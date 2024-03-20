(* open Uuidm *)
open Printf
open Random

let generate_uuid () =
  (* let uuid = Uuidm.create `V4 in
     match uuid with `Error msg -> failwith msg | `Ok uuid_str -> uuid_str *)
  let () = Random.self_init () in
  let number = Random.int 1000000000 in
  string_of_int number

(* String is the key type for this map type. *)
(* Module names must start with an uppercase letter. *)
module StringMap = Map.Make (String)

type dog = { id : string; name : string; breed : string }

let add_dog map name breed =
  let uuid = generate_uuid () in
  let dog = { id = uuid; name; breed } in
  StringMap.add uuid dog map

let print_dog id dog = printf "%s) %s is a %s.\n" dog.id dog.name dog.breed

let () =
  let dog_map = StringMap.empty in
  let dog_map = add_dog dog_map "Comet" "whippet" in
  let dog_map = add_dog dog_map "Oscar" "GSP" in
  StringMap.iter print_dog dog_map
