open Printf

type int_list = int list
[@@deriving show]

let numbers = [4; 1; 9; 7; 2]

let doubled = List.map (fun x -> x * 2) numbers

let even_numbers = List.filter (fun x -> x mod 2 = 0) numbers

let sum = List.fold_left (+) 0 numbers

let () =
  print_endline (show_int_list doubled); (* [8; 2; 18; 14; 4] *)
  printf "sum = %d\n" sum; (* sum = 23 *)
  print_endline (show_int_list even_numbers); (* [4; 2] *)
