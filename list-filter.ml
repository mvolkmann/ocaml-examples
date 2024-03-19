let numbers = [ 1; 3; 4; 6; 9; 10 ]
let is_even x = x mod 2 = 0
let even_numbers = List.filter is_even numbers

let () =
  List.iter
    (fun x ->
      print_int x;
      print_string " ")
    even_numbers
