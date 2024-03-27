open Printf

class point (x_init : float) (y_init : float) =
  object
    (* instance variables *)
    val mutable x : float = x_init
    val mutable y : float = y_init

    (* methods *)
    method get_x = x
    method get_y = y
    method set_x new_x = x <- new_x
    method set_y new_y = y <- new_y

    method translate dx dy =
      x <- x +. dx;
      y <- y +. dy
  end

let () =
  let p = new point 0.0 0.0 in
  p#set_x 1.0;
  p#set_y 2.0;
  p#translate 3.0 4.0;
  printf "(%f, %f)\n" p#get_x p#get_y
(* printf "(%f, %f)\n" p#x p#y *)
