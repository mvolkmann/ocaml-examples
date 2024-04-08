open Printf

let sum a b = a + b
let double a = a * 2

let () =
  printf "result = %d\n" (double (sum 3 4));
  printf "result = %d\n" @@ double @@ sum 3 4
