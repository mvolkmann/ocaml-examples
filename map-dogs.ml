open Printf
module StringMap = Map.Make (String)

type dog = { id : string; name : string; breed : string }

let dog_map_ref = ref StringMap.empty

let add_dog id name breed dog_map_ref =
  let key = string_of_int id in
  let dog = { id = key; name; breed } in
  dog_map_ref := StringMap.add key dog !dog_map_ref

let () =
  add_dog 1 "Comet" "Whippet" dog_map_ref;
  add_dog 2 "Oscar" "GSP" dog_map_ref;
  (* iterate over the map and print the key/value pairs *)
  StringMap.iter (fun key value -> printf "%s: %s\n" key value) !dog_map_ref
