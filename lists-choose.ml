(* Choose elements from two lists based on a comparison function. *)
let rec choose list1 list2 cmp_fun =
  match (list1, list2) with
  | [], [] -> [] (* both lists are empty; return empty list *)
  | [], _ -> list2 (* first list is empty; return second list *)
  | _, [] -> list1 (* second list is empty; return first list *)
  | h1 :: t1, h2 :: t2 ->
      if cmp_fun h1 h2 then
        h1 :: choose t1 t2 cmp_fun (* add h1 to result list *)
      else h2 :: choose t1 t2 cmp_fun (* add h2 to result list *)

let l1 = [ 1; 3; 4; 6; 9; 10 ]
let l2 = [ 7; 1; 0; 8; 6; 4 ]

let () =
  List.iter
    (fun x ->
      print_int x;
      print_string " ")
    (choose l1 l2 ( > ))
