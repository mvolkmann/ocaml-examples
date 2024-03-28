let rec list_max (lst : 'a list) : 'a option =
  match lst with
  | [] -> None
  | h :: t -> (
      match list_max t with None -> Some h | Some m -> Some (max h m))

let () =
  (* let numbers = [ 1; 13; 4; 9 ] in *)
  let numbers = [] in
  let max = list_max numbers in
  match max with
  | None -> print_endline "empty list"
  | Some max -> print_int max