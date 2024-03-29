open Printf

module type Shape = sig
  type t

  val area : t -> float
end

(* float represents radius *)
module Circle : Shape with type t := float = struct
  let area radius = Float.pi *. radius *. radius
end

(* float * float represents length and width *)
module Rectangle : Shape with type t := float * float = struct
  let area (length, width) = length *. width
end

let () =
  let radius = 5.0 in
  let circle_area = Circle.area radius in
  printf "Circle area: %.2f\n" circle_area;

  let length = 4.0 and width = 6.0 in
  let rectangle_area = Rectangle.area (length, width) in
  printf "Rectangle area: %.2f\n" rectangle_area
