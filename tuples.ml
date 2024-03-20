(* Get the second element of a 4-element tuple using destructuring. *)
let second (_, e, _, _) = e

(* Get the third element of a 4-element tuple using match. *)
let third tuple = match tuple with a, b, c, d -> c
let greek = ("alpha", "beta", "gamma", "delta")

let () =
  print_endline (second greek);
  (* beta *)
  print_endline (third greek)
(* gamma *)
