open Printf

(* Classes offer an alternative to records.
   While both can define fields,
   classes add the ability to define methods. *)

(* This defines both a class and its single constructor.
   Constructor parameters, fields, and method parmeters
   can have generic types (ex. 'a').
*)
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
  (* Use the new keyword to create an instance of the class. *)
  let p = new point 0.0 0.0 in

  (* Methods are called with # instead of dot. *)
  p#set_x 1.0;
  p#set_y 2.0;
  p#translate 3.0 4.0;
  printf "(%f, %f)\n" p#get_x p#get_y;
  p#print
(* No need to pass `()`. *)

(*
Abstract classes are defined with "class virtual".
Methods can be defined with "method virtual"
to require subclasses to implement them.
In inherit from an abstract class, add "inherit {class_name} {args}"
inside "object (self)" to call its constructor.
To enable calling superclass methods,
add "inherit {class_name} {args} as super"
and then use "super#{method_name}" to call them.
*)
