open Printf

(* Classes offer an alternative to records.
   While both can define fields,
   classes add the ability to define methods. *)
class point (x_init : float) (y_init : float) =
  (* Can omit "(self)" if there are no references to it. *)
  object (self)
    (* instance variables *)
    val mutable x = x_init
    val mutable y = y_init

    (* methods *)
    method get_x = x
    method get_y = y
    method set_x new_x = x <- new_x
    method set_y new_y = y <- new_y
    method print = printf "(%f, %f)\n" x y

    method translate dx dy =
      x <- x +. dx;
      y <- y +. dy
  end

let () =
  let p = new point 0.0 0.0 in
  (* Methods are called with # instead of dot. *)
  p#set_x 1.0;
  p#set_y 2.0;
  p#translate 3.0 4.0;
  printf "(%f, %f)\n" p#get_x p#get_y;
  p#print (* No need to pass `()`. *)
