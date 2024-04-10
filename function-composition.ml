(* open Base *)

let add1 x = x + 1
let square x = x * x
let add1square x = x |> add1 |> square
let add1square' x = square @@ add1 x
let ( << ) f g x = f (g x)
let add1square'' = square << add1
let ( >> ) f g x = g (f x)
let add1square''' = add1 >> square

let () =
  assert (add1square 2 = 9);
  assert (add1square' 2 = 9);
  assert (add1square'' 2 = 9);
  assert (add1square''' 2 = 9)
