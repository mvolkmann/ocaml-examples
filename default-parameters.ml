open Printf

let product ?(a = 1.0) b = a *. b

(* When using optional parameters, there must be at least one
   that is not optional.  Adding `()` satisifies this. *)
let greet ?(name = "World") ?(suffix = "!") () =
  printf "Hello, %s%s\n" name suffix

let () =
  printf "product = %f\n" (product ~a:8.5 2.0);
  printf "product = %f\n" (product 8.5);

  (* In calls to functions with no required parameters, include `()`.
     It doesn't matter where it appears in the argument list. *)
  greet ~name:"Mark" ~suffix:"." ();
  greet () ~name:"Mark";
  greet ()
