(* let rec max_element = function *)
let rec max_element (ls : 'a list) : 'a option =
  match ls with
  | [] -> None (* Return None for an empty list *)
  | [ x ] ->
      Some x (* Return the single element as the maximum for a singleton list *)
  | hd :: tl -> (
      match max_element tl with
      | None ->
          Some hd (* If the tail has no maximum, then the head is the maximum *)
      | Some max_tail -> Some (max hd max_tail))

(* let max_element = function | [] -> None | hd :: tl -> Some (List.fold_left
   max hd tl) *)

let () =
  let numbers = [ 1; 13; 4; 9 ] in
  let max = max_element numbers in
  match max with
  | None -> print_endline "empty list"
  | Some max -> print_int max
