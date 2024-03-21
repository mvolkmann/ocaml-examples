type point2d = float * float

(* This demonstrates adding types to parameters and
   specifying the return type, all of which can be inferred. *)
let distance ((x1, y1) : point2d) ((x2, y2) : point2d) : float =
  let dx = x2 -. x1 in
  let dy = y2 -. y1 in
  sqrt ((dx *. dx) +. (dy *. dy))
  
let%test _ = distance (1., 1.) (4., 5.) = 5.0