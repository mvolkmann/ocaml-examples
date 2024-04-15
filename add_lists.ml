let l1 = [ 1; 2; 3 ]
let l2 = [ 4; 5; 6 ]

let () =
  (* This raises an Invalid_argument exception if the lists have different
     lengths and it results in an error if the lists have elements of different
     types. *)
  let l3 = List.map2 ( + ) l1 l2 in
  List.iter
    (fun n ->
      print_int n;
      print_newline ())
    l3
