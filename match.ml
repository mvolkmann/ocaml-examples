open Random

let () =
  Random.self_init ();
  let n = Random.int 10 in
  print_int n;
  print_newline ();
  match n with
  | n when n < 3 ->
      print_string "test";
      print_string "small"
  | n when 4 <= n && n <= 7 -> print_string "medium"
  | _ -> print_string "large"
