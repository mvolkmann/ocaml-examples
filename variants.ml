open Printf

type season = Spring | Summer | Fall | Winter
type tense = Spring | Sprung | Sprang

(* Since both the season and tense types define a Spring constructor,
   we need to specify which variant type to use. *)
let forecast : season -> string = function
  | Spring -> "rain"
  | Summer -> "sun"
  | Fall -> "nice"
  | Winter -> "snow"

let get_tense : tense -> int = function
  | Spring -> 1
  | Sprang -> 2
  | Sprung -> 3

type result = Ok of float | Error of string

let divide x y = if y = 0.0 then Error "Division by zero" else Ok (x /. y)

type my_union = BoolVal of bool | IntVal of int | StringVal of string
type point = float * float

type shape =
  | Circle of { center : point; radius : float }
  | Rectangle of { lower_left : point; width : float; height : float }

let area = function
  | Circle { radius = r } -> Float.pi *. r *. r
  | Rectangle { width = w; height = h } -> w *. h

let get_string = function
  | IntVal i -> string_of_int i
  | StringVal s -> s
  | BoolVal b -> string_of_bool b

let () =
  print_endline (forecast Spring);
  print_int (get_tense Spring);

  let numerator = 5.0 and denomiator = 0.0 in
  match divide numerator denomiator with
  | Ok v -> print_endline (string_of_float v)
  | Error e ->
      print_endline e;

      let c = Circle { center = (0.0, 0.0); radius = 10.0 } in
      let r =
        Rectangle { lower_left = (0.0, 0.0); width = 10.0; height = 5.0 }
      in
      printf "c area = %f\n" (area c);
      printf "r area = %f\n" (area r);

      let b = BoolVal true in
      let i = IntVal 10 in
      let s = StringVal "hello" in
      print_endline (get_string i);
      print_endline (get_string s);
      print_endline (get_string b)
