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

   (* <form hx-disabled-elt="#submit-btn" <% attrs %>> *)
let form attrs selected_dog_option =
  <form hx-disabled-elt="#submit-btn" <%s attrs %>>
    <%s attrs %>
    <div>
      <label for="name">Name</label>
      <input
        id="name"
        name="name"
        required
        size={30}
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
        size={30}
        type="text"
        value="<%s dog_breed selected_dog_option %>"
      />
    </div>
    <div class="buttons">
      <button id="submit-btn">{selectedId ? 'Update' : 'Add'}</button>
      {selectedId && (
        <button hx-get="/deselect" hx-swap="none" type="button">
          Cancel
        </button>
      )}
    </div>
  </form>

let generate_uuid () = Uuidm.(v `V4 |> to_string)

let add_dog name breed =
  let id = generate_uuid () in
  Hashtbl.add dog_table id { id; name; breed }

let dog_row dog =
  <tr>
    <td><%s dog.name %></td>
    <td><%s dog.breed %></td>
    <td class="buttons">
      <button
        class="show-on-hover"
        hx-confirm="Are you sure?"
        hx-delete={`/dog/${dog.id}`}
        hx-target="closest tr"
        hx-swap="delete"
        type="button"
      >
        ✕
      </button>
      {/* This selects the dog which triggers a selection-change event,
          which causes the form to update. */}
      <button
        class="show-on-hover"
        hx-get={'/select/' + dog.id}
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
  add_dog "Comet" "Whippet";
  add_dog "Oscar" "GSP";
  Dream.run ~port:3000
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/**" @@ Dream.static "public";

    (* Dream.delete("/dog/:id" (fun id ->
      let dog = Hashtbl.find dog_table id in
      match dog with
      | None -> Dream.empty `Not_found
      | Some _ -> Hashtbl.remove dog_table id; Dream.empty `OK
    )); *)

    Dream.get "/" (Dream.from_filesystem "public" "index.html");

    Dream.get "/dogs" (fun _ ->
      let json_of_list = [%yojson_of: dog list] in
      (json_of_hashtbl json_of_list dog_table)
      |> Dream.json (* adds Content-Type response header *)
    );

    Dream.get "/form" (fun _ -> 
      let attrs = match !selected_id with
      | None -> "hx-post=\"/dog\" hx-target=\"tbody\" hx-swap=\"afterbegin\""
      | Some id -> "hx-put=/dog/" ^ id in
      let selected_dog_option = match !selected_id with
      | None -> None
      | Some id -> Hashtbl.find_opt dog_table id in
      (form attrs selected_dog_option) |> Dream.html);
      (* "<div>form does here</div>" |> Dream.html); *)
 
    Dream.get "/table-rows" (fun _ ->
      let trs = Hashtbl.fold (fun _ dog acc -> dog_row dog :: acc) dog_table [] in
      (String.concat "" trs) |> Dream.html)
  ]