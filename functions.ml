open Printf

(**
 * This function has two optional parameters.
 * @param alpha the first number
 * @param beta the second number
 * @return the sum of alpha and beta
 *)
let sum2 ?alpha:(first = 1) ?(beta = 2) () = first + beta

(**
 * This function has two optional parameters and one required parameter.
 * @param alpha the first number
 * @param beta the second number
 * @param gamma the third number
 * @return the sum of alpha, beta, and gamma
 *)
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
