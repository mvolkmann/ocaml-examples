type expr =
  | Int of int
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr

let rec eval expr =
  match expr with
  | Int n -> n (* Evaluate integer literals *)
  | Add (e1, e2) -> eval e1 + eval e2
  | Sub (e1, e2) -> eval e1 - eval e2
  | Mul (e1, e2) -> eval e1 * eval e2
  | Div (e1, e2) -> eval e1 / eval e2

let () =
  let result = eval (Add (Int 5, Mul (Int 3, Int 2))) in
  print_int result;
  (* 5 + (3 * 2) = 11 *)
  print_newline ()
