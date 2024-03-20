type point2d = float * float

let pi = Float.pi

let add a b = a + b

let average numbers =
  let sum = List.fold_left (+) 0 numbers in
  let length = List.length numbers in
  float_of_int sum /. float_of_int length

(* This demonstrates adding types to parameters and
   specifying the return type, all of which can be inferred. *)
let distance ((x1, y1) : point2d) ((x2, y2) : point2d) : float =
  let dx = x2 -. x1 in
  let dy = y2 -. y1 in
  sqrt ((dx *. dx) +. (dy *. dy))