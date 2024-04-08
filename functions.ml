open Printf

let sum2 ?alpha:(first = 1) ?(beta = 2) () = first + beta
let sum3 ?alpha:(first = 1) ?(beta = 2) ~gamma () = first + beta + gamma

let () =
  printf "%d\n" (sum2 ~alpha:3 ~beta:4 ());
  (* 7 *)
  printf "%d\n" (sum2 ~alpha:3 ());
  (* 5 *)
  printf "%d\n" (sum2 ~beta:4 ());
  (* 5 *)
  printf "%d\n" (sum3 ~gamma:5 ())
(* 8 *)
