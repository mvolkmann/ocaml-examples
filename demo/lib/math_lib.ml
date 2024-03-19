let add a b = a + b
let average a b = float_of_int (add a b) /. 2.0

let%test _ = add 1 2 = 3
let%test _ = average 2 3 = 2.5