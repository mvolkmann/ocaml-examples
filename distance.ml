(* Apparently type names must start lowercase. Why? *)
type point2D = float * float (* a tuple *)

let distance (x1, y1) (x2, y2) =
  let dx = x2 -. x1 in
  let dy = y2 -. y1 in
  sqrt ((dx *. dx) +. (dy *. dy))

(* let distance2 (x1, y1) (x2, y2) =
   This does NOT work! It says dx and dy are unused.
   let dx = x2 -. x1;
   let dy = y2 -. y1;
   sqrt ((dx *. dx) +. (dy *. dy)) *)

(* So it seems that function bodies must be a single expression. *)

let () =
  let p1 = (0.0, 0.0) in
  let p2 = (1.0, 1.0) in
  let d = distance p1 p2 in
  print_float d
