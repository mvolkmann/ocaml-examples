(* Type names must start lowercase. *)
type point2D = float * float (* a tuple *)

let distance (x1, y1) (x2, y2) =
  let dx = x2 -. x1 in
  let dy = y2 -. y1 in
  sqrt ((dx *. dx) +. (dy *. dy))

let () =
  let p1 = (0.0, 0.0) in
  let p2 = (1.0, 1.0) in
  let d = distance p1 p2 in
  print_float d
