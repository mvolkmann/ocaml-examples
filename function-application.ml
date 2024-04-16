let double x = x * 2
let square x = x * x

let () =
  (* All these expressions print 16. *)
  let d = double 2 in
  let s = square d in
  print_int s;
  print_int (square (double 2));
  print_int @@ square @@ double @@ 2;
  2 |> double |> square |> print_int
