(* To allow referring to the functions in a library file
   without a library name prefix, open the library.
   For example,open My_project.Math_lib *)
open My_project
open Printf

(* At the module level, everthing needs to
   be in a binding created with `let`.
   You could use `let _ =` which allows the
   expression to have any kind of value.
   But using `let () =` is preferred because it states
   that the expression does not return a value. *)
let () =
  let a = 1 and b = 2 and c = 3 in
  printf "%d %d\n" (Math_local.add a b) (Math_lib.add a b);
  printf "%f %f\n" (Math_local.average b c) (Math_lib.average b c)
