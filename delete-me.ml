open Printf

type point = float * float

type shape =
  | Circle of { center : point; radius : float }
  | Rectangle of { lower_left : point; width : float; height : float }

let area shape =
  match shape with
  | Circle { radius = r } -> Float.pi *. r *. r
  | Rectangle { width = w; height = h } -> w *. h

let center = function
  | Circle { center = c } -> c
  | Rectangle { lower_left = x, y; width = w; height = h } ->
      (x +. (w /. 2.0), y +. (h /. 2.0))

let () =
  let c = Circle { center = (0.0, 0.0); radius = 10.0 } in
  let r = Rectangle { lower_left = (0.0, 0.0); width = 10.0; height = 5.0 } in
  printf "c area = %f\n" (area c);
  printf "r area = %f\n" (area r);
  let x, y = center c in
  printf "c center = (%f, %f)\n" x y;
  let x, y = center r in
  printf "r center = (%f, %f)\n" x y
