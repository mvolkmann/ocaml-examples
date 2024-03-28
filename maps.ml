open Printf
module StringMap = Map.Make (String)

type dog = { id : string; name : string; breed : string }

let last_id_ref = ref 0
let dog_map_ref = ref StringMap.empty

let add_dog name breed dog_map_ref =
  last_id_ref := !last_id_ref + 1;
  let id = string_of_int !last_id_ref in
  let dog = { id; name; breed } in
  dog_map_ref := StringMap.add id dog !dog_map_ref

let print_map map =
  StringMap.iter map ~f:(fun ~key ~data ->
      Printf.printf "Key: %s, Value: %d\n" key data)

let () =
  let map =
    StringMap.empty |> StringMap.add "a" "apple" |> StringMap.add "b" "banana"
    |> StringMap.update "a" (Option.map (fun _ -> "apricot"))
    |> StringMap.remove "b"
  in
  let a_fruit = StringMap.find_opt "a" map in
  match a_fruit with
  | None -> print_endline "No such fruit"
  | Some fruit ->
      print_endline fruit;

      add_dog "Comet" "Whippet" dog_map_ref;
      add_dog "Oscar" "GSP" dog_map_ref;
      let dog_map = !dog_map_ref in
      (* Print the key/value pairs in dog_map_ref. *)
      StringMap.iter (fun key value -> printf "%s: %s\n" key value) dog_map
