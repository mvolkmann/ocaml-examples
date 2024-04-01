(* opam install ppx_yojson_conv *)
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type dog = { id : string; name : string; breed : string }
[@@deriving yojson]

let hello who =
  <html>
    <body>
      <h1>Hello, <%s who %>!</h1>
    </body>
  </html>

module StringMap = Map.Make (String)

let dog_table = Hashtbl.create 10

let generate_uuid () = Uuidm.(v `V4 |> to_string)

let add_dog name breed =
  let id = generate_uuid () in
  Hashtbl.add dog_table id { id; name; breed }

let my_dog = { id = "1"; name = "Comet"; breed = "Whippet" }

(* let rows () =
  Hashtbl.fold (fun _ dog acc -> table_row dog :: acc) dog_table [] *)

let json_of_hashtbl json_of_list h =
  h
  |> Hashtbl.to_seq_values (* gets sequence of values *)
  |> List.of_seq (* converts sequence to a list *)
  |> json_of_list (* converts list to json representation *)
  |> Yojson.Safe.to_string (* converts json representation to string *)

let () =
  add_dog "Comet" "Whippet";
  add_dog "Oscar" "GSP";
  Dream.run ~port:3000
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ -> Dream.html (hello "World"));
    (* See https://aantron.github.io/dream/#json. *)
    (* Dream.json just adds the response header Content-Type: application/json *)

    Dream.get "/dog" (fun _ -> my_dog |>[%yojson_of: dog] |> Yojson.Safe.to_string |> Dream.json);
    Dream.get "/dogs" (fun _ ->
      let json_of_list = [%yojson_of: dog list] in
      (json_of_hashtbl json_of_list dog_table)
      |> Dream.json (* adds Content-Type response header *)
    )
    (* Dream.get "/rows" (fun _ -> Dream.html (rows ())); *)
  ]