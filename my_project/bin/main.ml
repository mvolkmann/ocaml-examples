open My_project.My_math

(* At the module level, everthing needs to
   be in a binding created with `let`.
   You could use `let _ =` which allows the
   expression to have any kind of value.
   But using `let () =` is preferred because it states
   that the expression does not return a value. *)
let () =
  let a = 1 and b = 2 and c = 3 in
  print_int (add a b);
  print_newline ();
  print_float (average b c);
  print_newline ()
