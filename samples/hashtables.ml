(* See README.md for instructions on running this. *)
open Printf

type dog = { id : string; name : string; breed : string }

(* 10 is an estimate for the number of entries I will add. *)
let dog_map = Hashtbl.create 10
let generate_uuid () = Uuidm.(v `V4 |> to_string)

let add_dog name breed =
  let id = generate_uuid () in
  Hashtbl.add dog_map id { id; name; breed }

let print_dog dog = printf "%s is a %s (id=%s).\n" dog.name dog.breed dog.id

let () =
  add_dog "Comet" "Whippet";
  add_dog "Oscar" "GSP";
  Hashtbl.iter (fun _ dog -> print_dog dog) dog_map
