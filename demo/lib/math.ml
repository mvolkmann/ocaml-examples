let pi = Float.pi

let add a b = a +. b

let average numbers =
  let sum = List.fold_left (+.) 0.0 numbers in
  let length = List.length numbers in
  sum /. float_of_int length

let%test _ = add 1.2 2.3 = 3.5

let%expect_test _ =
  print_float (average [2.0; 3.0; 2.5]);
  [%expect "2.5"]
