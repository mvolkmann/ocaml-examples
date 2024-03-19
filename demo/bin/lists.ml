(* This is an example of "parametric polymorphism" because
the function works on lists of any type. *)
let at_least_3 (l : 'a list) = (List.length l) >= 3

(* let%test _ = at_least_3 [] = false
let%test _ = at_least_3 [1, 2, 3, 4] = true *)