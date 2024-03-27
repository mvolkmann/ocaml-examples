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
    (* Instance variables are immutable by default,
       but can be made mutable. *)
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

(*
Abstract classes are defined with "class virtual".
Methods can be defined with "method virtual"
to require subclasses to implement them.
In inherit from an abstract class, add "inherit {class_name} {args}"
inside "object (self)" to call its constructor.
Arguments passed to a constructor do not require a matching field
and can be used in methods.
To enable calling superclass methods,
add "inherit {class_name} {args} as super"
and then use "super#{method_name}" to call them.
To coerce a subclass value to a superclass type, `obj :> {superclass}`.
*)

class virtual shape (name_init : string) =
  object
    val name = name_init
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

let () =
  (* Use the new keyword to create an instance of the class. *)
  let p = new point 0.0 0.0 in

  (* Methods are called with # instead of dot. *)
  p#set_x 1.0;
  p#set_y 2.0;
  p#translate 3.0 4.0;
  printf "(%f, %f)\n" p#get_x p#get_y;
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
  printf "p2 id = %d\n" (Oo.id p2);

  let c = new circle p 5.0 in
  printf "circle area = %f\n" c#area;
  let r = new rectangle p 10.0 5.0 in
  printf "rectangle area = %f\n" r#area
