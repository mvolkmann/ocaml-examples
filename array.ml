let () =
  let a = [| 3; 7; 11 |] in
  Array.iter
    (fun n ->
      print_int n;
      print_newline ())
    a
