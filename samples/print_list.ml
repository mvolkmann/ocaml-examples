type int_list = int list [@@deriving show]

let print_int_list l =
  List.iter (Printf.printf "%d ") l;
  print_newline ()

let () =
  let numbers = [ 1; 2; 3 ] in
  (* This demonstrates two ways to print a list. *)
  print_int_list numbers;
  print_endline (show_int_list numbers)
