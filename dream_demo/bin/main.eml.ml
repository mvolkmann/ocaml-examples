type dog = { id : string; name : string; breed : string }
[@@deriving to_yojson]

let hello who =
  <html>
    <body>
      <h1>Hello, <%s who %>!</h1>
    </body>
  </html>

module StringMap = Map.Make (String)

let dog_table = Hashtbl.create 10
[@@deriving yojson]

let generate_uuid () = Uuidm.(v `V4 |> to_string)

let add_dog name breed =
  let id = generate_uuid () in
  Hashtbl.add dog_table id { id; name; breed }

(* let rows () =
  Hashtbl.fold (fun _ dog acc -> table_row dog :: acc) dog_table [] *)

let () =
  add_dog "Comet" "Whippet";
  add_dog "Oscar" "GSP";
  Dream.run ~port:3000
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ -> Dream.html (hello "World"));
    (* See https://aantron.github.io/dream/#json. *)
    Dream.get "/dog" (fun _ -> dog_table |> Yojson.Safe.t |> Dream.json)
    (* Dream.get "/rows" (fun _ -> Dream.html (rows ())); *)
  ]