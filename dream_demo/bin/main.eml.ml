let hello who =
  <html>
    <body>
      <h1>Hello, <%s who %>!</h1>
    </body>
  </html>

let dog_map_ref = ref StringMap.empty
(* let add_dog name breed dog_map_ref = *)

let generate_uuid () = Uuidm.(v `V4 |> to_string)
let uuid = generate_uuid () in
  let new_dog_map = StringMap.add uuid dog dog_map


let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ -> Dream.html (hello "World"));
    (* See https://aantron.github.io/dream/#json. *)
    Dream.get "/dog" (fun _ -> Dream.json (hello "World"));
    Dream.get "/dogs" (fun _ -> Dream.html (hello "World"));
  ]