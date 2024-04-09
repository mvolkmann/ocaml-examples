open Printf

(* Get the second element of a 4-element tuple using destructuring. *)
let second (_, e, _, _) = e

(* This shows three ways to write a function that
   returns the third elemet of a 4-element tuple `t`. *)
let third_of_4 t = match t with a, b, c, d -> c

(* let third_of_4 t =
   let _, _, c, _ = t in
   c *)

let third_of_4 (_, _, v, _) = v
let greek = ("alpha", "beta", "gamma", "delta")

let () =
  print_endline (second greek);
  (* beta *)
  print_endline (third_of_4 greek);

  (* gamma *)
  let t = (true, 3, "blue") in
  let b, n, c = t in
  printf "b = %b, n = %d, c = %s\n" b n c
