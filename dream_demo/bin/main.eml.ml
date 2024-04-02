(* opam install ppx_yojson_conv *)
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

   (* <form hx-disabled-elt="#submit-btn" <% attrs %>> *)
let form attrs =
   <form hx-disabled-elt="#submit-btn">
    <div>
      <label for="name">Name</label>
      <input
        id="name"
        name="name"
        required
        size={30}
        type="text"
        value={selectedDog?.name ?? ''}
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
        value={selectedDog?.breed ?? ''}
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

(* let hello who =
  <html>
    <body>
      <h1>Hello, <%s who %>!</h1>
    </body>
  </html> *)

type dog = { id : string; name : string; breed : string }
[@@deriving yojson]

(* This is a Dream "template". *)
let dog_table = Hashtbl.create 10

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

let rows h =
  let trs = Hashtbl.fold (fun _ dog acc -> dog_row dog :: acc) h [] in
  String.concat "" trs

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
    Dream.get "/**" @@ Dream.static "./public";
    (* Dream.delete("/dog/:id" (fun id ->
      let dog = Hashtbl.find dog_table id in
      match dog with
      | None -> Dream.empty `Not_found
      | Some _ -> Hashtbl.remove dog_table id; Dream.empty `OK
    )); *)

    (* Dream.get "/hello" (fun _ -> Dream.html (hello "World")); *)

    Dream.get "/dogs" (fun _ ->
      let json_of_list = [%yojson_of: dog list] in
      (json_of_hashtbl json_of_list dog_table)
      |> Dream.json (* adds Content-Type response header *)
    );

    (* Dream.get "/row" (fun _ -> (dog_row my_dog) |> Dream.html); *)

    Dream.get "/form" (fun _ -> 
      let selectedDog = Hashtbl.find selected_id dog_table in
      let attrs = match selected_id with
      | None -> "hx-post=\"/dog\" hx-target=\"tbody\" hx-swap=\"afterbegin\""
      | Some id -> "hx-put=/dog/" ^ id
      (form attrs) |> Dream.html)
 
    Dream.get "/table-rows" (fun _ -> (rows dog_table) |> Dream.html)
  ]