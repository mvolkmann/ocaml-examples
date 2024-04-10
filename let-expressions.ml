open Printf

let my_tuple = (1, 2, 3)
let my_list = [ 1; 2; 3 ]
let my_array = [| 1; 2; 3 |]

type my_record_type = { first : int; second : int; third : int }

let my_record = { first = 1; second = 2; third = 3 }

let () =
  let a, b, c = my_tuple in
  printf "tuple: a = %d, b = %d, c = %d\n" a b c;

  let { first; second; third } = my_record in
  printf "record: first = %d, second = %d, third = %d\n" first second third;

  (match my_list with
  | a :: b :: c :: _ -> printf "list: a = %d, b = %d, c = %d\n" a b c
  | _ -> print_endline "list doesn't contain at least 3 elements");

  match my_array with
  | [| a; b; c |] -> printf "array: a = %d, b = %d, c = %d\n" a b c
  | _ -> printf "array doesn't contain exactly 3 elements\n"
