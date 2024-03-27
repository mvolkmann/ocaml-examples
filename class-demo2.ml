open Printf

module Geometry = struct
  class point (x_init : float) (y_init : float) =
    object (self)
      val mutable x = x_init
      val mutable y = y_init
      method get_x = x
      method get_y = y
      method set_x new_x = x <- new_x
      method set_y new_y = y <- new_y
      method print = printf "(%f, %f)\n" x y

      method translate dx dy =
        x <- x +. dx;
        y <- y +. dy
    end

  let origin = new point 0.0 0.0

  class virtual shape (name_init : string) =
    object
      val name = name_init
      method name = name
      method virtual area : float
    end

  class circle (center_init : point) (radius_init : float) =
    object
      inherit shape "circle"
      val center = center_init
      val radius = radius_init
      method area = 3.14159 *. radius *. radius
    end

  class rectangle (lower_left_init : point) (width_init : float)
    (height_init : float) =
    object
      inherit shape "rectangle"
      val lower_left = lower_left_init
      val width = width_init
      val height = height_init
      method area = width *. height
    end
end

let () =
  let p = Geometry.origin in
  let c = new Geometry.circle p 5.0 in
  printf "%s area = %f\n" c#name c#area;
  let r = new Geometry.rectangle p 10.0 5.0 in
  printf "%s area = %f\n" r#name r#area
