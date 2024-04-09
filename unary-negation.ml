open Printf

let () =
  let x = 5 in
  let n1 = x + ~-1 in
  let n2 = x + -1 in
  printf "n1 = %d\n" n1;
  printf "n2 = %d\n" n2
