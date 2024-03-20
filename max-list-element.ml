(* let rec max_element (ls : 'a list) : 'a option =
   match ls with *)
let rec max_element = function
  | [] -> None (* Return None for an empty list *)
  | [ x ] ->
      Some x (* Return the single element as the maximum for a singleton list *)
  | hd :: tl -> (
      match max_element tl with
      | None ->
          Some hd (* If the tail has no maximum, then the head is the maximum *)
      | Some max_tail -> Some (if hd > max_tail then hd else max_tail))

let () =
  let numbers = [ 1; 13; 4; 9 ] in
  let max = max_element numbers in
  match max with
  | None -> print_endline "empty list"
  | Some max -> print_int max
