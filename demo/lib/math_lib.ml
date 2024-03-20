let add a b = a + b

let avg a b = float_of_int (add a b) /. 2.0

let%test _ = add 1 2 = 3

let%expect_test _ =
  print_float (avg 2 3);
  [%expect "2.5"]
