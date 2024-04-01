let reverse_int_list l =
  let rec visit acc l =
    match l with [] -> acc | hd :: tl -> visit (hd :: acc) tl
  in
  visit [] l

let rec print_int_list l =
  match l with
  | [] -> ()
  | hd :: tl ->
      print_int hd;
      print_char ' ';
      print_int_list tl

let () =
  let numbers = [ 1; 2; 3; 4; 5 ] in
  let rev = reverse_int_list numbers in
  print_int_list rev;
  print_newline ()
