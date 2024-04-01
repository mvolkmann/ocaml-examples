open Printf

(* reverse function application *)
let ( let* ) = Option.bind

(*
Option.map is used to apply a function to the value inside an Option
and return a new Option.
If it is Some v then the result of passing v to the function
is returned in a Some variant.
If it is None then None is returned. *)
let ( let+ ) o f = Option.map f o

let ( and+ ) p1 p2 =
  let* v1 = p1 in
  let+ v2 = p2 in
  (v1, v2)

let int_value int_opt = Option.value int_opt ~default:0
let x_opt = Some 1
let y_opt = Some 2

let () =
  let z = int_value x_opt + int_value y_opt in
  printf "z = %d\n" z;

  (* This is another way to express the same thing
     using nested anonymous functions. *)
  let z = (fun x -> (fun y -> x + y) (int_value y_opt)) (int_value x_opt) in
  printf "z = %d\n" z;

  let z =
    let+ x = x_opt and+ y = y_opt in
    x + y
  in
  printf "z = %d\n" (int_value z)
