(* Note how open requires the library name AND the module name. *)
open Demo.Math
open Demo.Points
open Printf

let my_constant = 7

let square x = x * x (* a function *)

(* This is similar to the "main" function in other languages.
   Note the use of semicolons to separate the
   statements and expressions.
   This is where most side effects should occur. *)
let () =
  let avg = average [5.2; 3.5] in
  printf "average = %f\n" avg;
  let area = Geometry.rectangle_area 5.2 3.5 in
  printf "area = %f\n" area;

  (* This is a verbose way to print a value. *)
  print_string "my_constant = ";
  print_int my_constant;
  print_newline ();

  (* This is a more concise way to print a value. *)
  printf "pi = %f\n" pi; (* defined in math.ml *)

  (* This calls a function defined in this file. *)
  printf "square of %d = %d\n" my_constant (square my_constant);

  (* The remaining examples call functions defined in math.ml. *)
  let a = 2.0 and b = 3.0 and c = 2.5 in
  printf "sum of a and b = %f\n" (add a b);

  let numbers = [a; b; c] in
  let avg = average numbers in
  printf "average of a, b, and c = %f\n" avg;

  let p1 = (0.0, 0.0) and p2 = (1.0, 1.0) in
  let d = distance p1 p2 in print_float d