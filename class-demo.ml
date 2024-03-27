open Printf

class point (x_init : float) (y_init : float) =
  (* Can omit "(self)" if there are no references to it. *)
  object (self)
    (* Instance variables are immutable by default,
       but can be made mutable. *)
    val mutable x = x_init
    val mutable y = y_init

    (* Getter methods can have the same name as the field they return. *)
    method x = x
    method y = y
    method set_x new_x = x <- new_x
    method set_y new_y = y <- new_y

    (* This is a named constructor. *)
    method origin = new point 0.0 0.0
    method print = printf "(%f, %f)\n" x y

    method translate dx dy =
      x <- x +. dx;
      y <- y +. dy
  end

let () =
  (* Use the new keyword to create an instance of the class. *)
  let p = new point 0.0 0.0 in

  (* Methods are called with # instead of dot. *)
  p#set_x 1.0;
  p#set_y 2.0;
  p#translate 3.0 4.0;
  printf "(%f, %f)\n" p#x p#y;
  (* There is no need to pass the unit value `()`
     to call methods that have no parameters. *)
  p#print;
  (* The Oo.copy function makes a shallow copy of an object. *)
  let p2 = Oo.copy p in
  p2#set_x 5.0;
  p2#print;
  (* Each object is assigned a unique id
     that can be accessed with Oo.id function. *)
  printf "p id = %d\n" (Oo.id p);
  printf "p2 id = %d\n" (Oo.id p2)
