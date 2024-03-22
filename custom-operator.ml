open Printf

type point = { x : float; y : float }

let ( +! ) (p1 : point) (p2 : point) : point =
  { x = p1.x +. p2.x; y = p1.y +. p2.y }

let ( + ) (n1 : int) (n2 : int) : int = n1 - n2

let () =
  let p1 = { x = 1.0; y = 2.0 } in
  let p2 = { x = 4.0; y = 6.0 } in
  let p3 = p1 +! p2 in
  printf "(%f, %f)\n" p3.x p3.y;

  let n1 = 2 and n2 = 3 in
  printf "%d\n" (n1 + n2)
