open Printf

(* let rec list_sum l = match l with [] -> 0 | hd :: tl -> hd + list_sum tl *)

let rec list_sum = function [] -> 0 | hd :: tl -> hd + list_sum tl
let numbers = [ 1; 2; 3; 4 ]

let () =
  let sum1 = list_sum numbers in
  printf "sum1 = %d\n" sum1;
  let sum2 = List.fold_left ( + ) 0 numbers in
  printf "sum2 = %d\n" sum2
