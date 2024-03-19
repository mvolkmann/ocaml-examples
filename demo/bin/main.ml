open Demo
open Printf

let () =
  let a = 1 and b = 2 and c = 3 in
  printf "sum = %d\n" (Math_lib.add a b);
  printf "average = %f\n" (Math_lib.average b c)