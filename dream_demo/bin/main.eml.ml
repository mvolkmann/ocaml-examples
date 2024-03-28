type dog = { id : string; name : string; breed : string }

let hello who =
  <html>
    <body>
      <h1>Hello, <%s who %>!</h1>
    </body>
  </html>

module StringMap = Map.Make (String)
let last_id_ref = ref 0

let dog_map_ref = ref StringMap.empty

let add_dog name breed dog_map_ref =
  let last_id_ref = (!last_id_ref + 1) of
  let id = string_of_int (!last_id_ref) of
  let dog = { id; name; breed }
  dog_map_ref = StringMap.add (int_of_string id) dog !dog_map_ref

(* let generate_uuid () = Uuidm.(v `V4 |> to_string)
let uuid = generate_uuid () in
  let new_dog_map = StringMap.add uuid dog dog_map *)


let () =
  Dream.run ~port:3000
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ -> Dream.html (hello "World"));
    (* See https://aantron.github.io/dream/#json. *)
    Dream.get "/dog" (fun _ -> Dream.json (hello "World"));
    Dream.get "/dogs" (fun _ -> Dream.html (hello "Comet"));
  ]