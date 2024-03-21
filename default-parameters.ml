open Printf

let greet ?(name = "World") ?suffix:(s = "!") = printf "Hello, %s%s\n" name s
let product ?(a = 1.0) b = a *. b

let () =
  printf "product = %f\n" (product ~a:8.5 2.0);
  printf "product = %f\n" (product 8.5);
  greet ~name:"Mark" ~suffix:".";
  greet ()
