open Base
open Printf

let () =
  (* printf "integer exponentiation = %d\n" 2 ** 3; *)
  (* printf "float exponentiation = %f\n" (2.3 ** 4.5) *)
  let i = 2 in
  let f = Int.to_float i in
  Stdlib.print_float (f *. 3.0)
