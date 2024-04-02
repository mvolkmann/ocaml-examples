(* See w-template-logic at
  https://github.com/aantron/dream/tree/master/example/w-template-logic#files.
*)
(* opam install ppx_yojson_conv *)
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type dog = { id : string; name : string; breed : string }
[@@deriving yojson]

let dog_table = Hashtbl.create 10

let selected_id = ref None

let dog_breed (dog_option : dog option) =
  match dog_option with
  | None -> ""
  | Some dog -> dog.breed

let dog_name (dog_option : dog option) =
  match dog_option with
  | None -> ""
  | Some dog -> dog.name

let form request attrs selected_dog_option =
  <form hx-disabled-elt="#submit-btn" <%s attrs %>>
    <%s! Dream.csrf_tag request %>
    <div>
      <label for="name">Name</label>
      <input
        id="name"
        name="name"
        required
        size="30"
        type="text"
        value="<%s dog_name selected_dog_option %>"
      />
    </div>
    <div>
      <label for="breed">Breed</label>
      <input
        id="breed"
        name="breed"
        required
        size="30"
        type="text"
        value="<%s dog_breed selected_dog_option %>"
      />
    </div>
    <div class="buttons">
      <button id="submit-btn">
        <%s if selected_dog_option = None then "Add" else "Update" %>
      </button>

%     begin match selected_dog_option with
%     | None -> ()
%     | Some _ ->
        <button hx-put="/deselect" hx-swap="none" type="button">
          Cancel
        </button>
%     end;
    </div>
  </form>

let generate_uuid () = Uuidm.(v `V4 |> to_string)

let add_dog name breed =
  let id = generate_uuid () in
  let dog = { id; name; breed } in
  Hashtbl.replace dog_table id dog;
  dog

let dog_row dog =
  <tr class="on-hover" id=<%s "row" ^ dog.id%> {...attrs}>
    <td><%s dog.name %></td>
    <td><%s dog.breed %></td>
    <td class="buttons">
      <button
        class="show-on-hover"
        hx-confirm="Are you sure?"
        hx-delete=<%s "/dog/" ^ dog.id%>
        hx-target="closest tr"
        hx-swap="delete"
        type="button"
      >
        ✕
      </button>
      <!-- This selects the dog which triggers a selection-change event,
           which causes the form to update. -->
      <button
        class="show-on-hover"
        hx-get=<%s "/select/" ^ dog.id%>
        hx-swap="none"
        type="button"
      >
        ✎
      </button>
    </td>
  </tr>

let json_of_hashtbl json_of_list h =
  h
  |> Hashtbl.to_seq_values (* gets sequence of values *)
  |> List.of_seq (* converts sequence to a list *)
  |> json_of_list (* converts list to json representation *)
  |> Yojson.Safe.to_string (* converts json representation to string *)

(* See https://aantron.github.io/dream/#json. *)
(* Dream.json just adds the response header Content-Type: application/json *)
let () =
  (* This shows two ways to ignore the return value of a function. *)
  add_dog "Comet" "Whippet" |> ignore;
  ignore (add_dog "Oscar" "GSP");
  Dream.run ~port:3000
  @@ Dream.logger
  @@ Dream.memory_sessions
  @@ Dream.router [
    Dream.delete "/dog/:id" (fun request ->
      let id = Dream.param request "id" in
      let dog = Hashtbl.find_opt dog_table id in
      match dog with
      | None -> Dream.empty `Not_Found
      | Some _ -> Hashtbl.remove dog_table id; Dream.empty `OK
    );

    Dream.get "/dogs" (fun _ ->
      let json_of_list = [%yojson_of: dog list] in
      (json_of_hashtbl json_of_list dog_table)
      |> Dream.json (* adds Content-Type response header *)
    );

    Dream.get "/form" (fun request -> 
      let attrs = match !selected_id with
      | None -> "hx-post=/dog hx-target=tbody hx-swap=afterbegin"
      | Some id -> "hx-put=/dog/" ^ id in
      let selected_dog_option = match !selected_id with
      | None -> None
      | Some id -> Hashtbl.find_opt dog_table id in
      (form request attrs selected_dog_option) |> Dream.html);
      (* "<div>form does here</div>" |> Dream.html); *)
 
    Dream.get "/table-rows" (fun _ ->
      (* sort based on dog name *)
      let trs = Hashtbl.fold (fun _ dog acc -> dog_row dog :: acc) dog_table [] in
      (String.concat "" trs) |> Dream.html);

    Dream.get "/hello" (fun _ ->
      "<h1>Hello, World!</h1>" |> Dream.html);

    Dream.post "/dog" (fun request ->
      match%lwt Dream.form request with
      (* The tuples in this list must be in alphabetical order. *)
      | `Ok [("breed", breed); ("name", name)] ->
        (add_dog name breed)
        |> dog_row
        |> Dream.html ~status:`Created
      | _ -> Dream.empty `Bad_Request
    );

    Dream.put "/dog/:id" (fun request ->
      let id = Dream.param request "id" in
      let dog_option = Hashtbl.find_opt dog_table id in
      match dog_option with
      | None -> Dream.empty `Not_Found
      | Some _ ->
        match%lwt Dream.form request with
        | `Ok [("breed", breed); ("name", name)] ->
          let updated_dog = {id; name; breed} in
          Hashtbl.replace dog_table id updated_dog;
          selected_id := None;
          updated_dog
          |> dog_row
          |> Dream.html ~headers:[("HX-Trigger", "selection-change")]
        | _ -> Dream.empty `Bad_Request
    );

    Dream.get "/" (Dream.from_filesystem "public" "index.html");

    Dream.get "/**" @@ Dream.static "public";
  ]