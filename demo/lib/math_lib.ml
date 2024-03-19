let add a b = a + b

let average a b = float_of_int (add a b) /. 2.0

let%test _ = add 1 2 = 3

let%expect_test _ =
  print_float (average 2 3);
  [%expect "2.5"]
