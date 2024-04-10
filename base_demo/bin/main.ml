open Base

(* From RegularSpatula
   Base has int int exponent, float ^ int exponent (fast),
   and float ^ float exponentiation.
   val int_pow : float -> int -> float (in Float module)
   They say it is 5-10x faster than `**.` for exponent up to ~1000*.
*)

let add1 x = x + 1
let square x = x * x
(* The functions are applied from right to left. *)
let add1square = Fn.compose square add1

let () =
  (* printf "integer exponentiation = %d\n" 2 ** 3; *)
  (* printf "float exponentiation = %f\n" (2.3 ** 4.5) *)
  let i = 2 in
  let f = Int.to_float i in
  Stdlib.print_float (f *. 3.0);

  assert (add1square 2 = 9)
