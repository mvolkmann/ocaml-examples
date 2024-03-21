open Printf

let rectangle_area1 length width = length *. width
let rectangle_area2 ~length:l ~width:w = l *. w

let () =
  printf "area1 = %f\n" (rectangle_area1 8.5 11.0);
  printf "area2 = %f\n" (rectangle_area2 ~length:8.5 ~width:11.0)
