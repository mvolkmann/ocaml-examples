(* This defines the "Math" module which is in the "Module_demo2" library. *)
type point = float * float

(* private function *)
let square x = x *. x

(* public function *)
let distance (x1, y1) (x2, y2) =
  let dx = x2 -. x1 in
  let dy = y2 -. y1 in
  sqrt ((square dx) +. (square dy))