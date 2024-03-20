open Printf

let generate_uuid () = Uuidm.(v `V4 |> to_string)

(* String is the key type for this map type. *)
(* Module names must start with an uppercase letter. *)
module StringMap = Map.Make (String)

type dog = { id : string; name : string; breed : string }

let add_dog name breed map =
  let uuid = generate_uuid () in
  let dog = { id = uuid; name; breed } in
  StringMap.add uuid dog map

let print_dog {id; name; breed} = printf "%s) %s is a %s.\n" id name breed

let () =
  let dog_map =
    StringMap.empty
    |> add_dog "Comet" "whippet"
    |> add_dog "Oscar" "GSP"
  in
  (* (fun _ -> print_dog) is the same as (fun _ x -> print_dog x) *)
  StringMap.iter (fun _ -> print_dog) dog_map
