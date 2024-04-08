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
  StringMap.iter
    (fun key dog -> printf "%s: %s is a %s.\n" key dog.name dog.breed)
    !dog_map_ref
