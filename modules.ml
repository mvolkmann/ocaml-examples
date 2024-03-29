open Printf

module Temperature = struct
  let c_of_f fahrenheit = (fahrenheit -. 32.0) *. (5.0 /. 9.0)
  let f_of_c celsius = (9.0 /. 5.0 *. celsius) +. 32.0
end

let dog_table = Hashtbl.create 10

let () =
  print_float (Temperature.c_of_f 100.0);
  (* 37.8. *)
  print_newline ();
  print_float (Temperature.f_of_c 0.0);
  (* 32.0 *)
  print_newline ();

  let open Hashtbl in
  add dog_table "Comet" "Whippet";
  add dog_table "Oscar" "GSP";
  iter (fun name breed -> printf "%s is a %s.\n" name breed) dog_table
