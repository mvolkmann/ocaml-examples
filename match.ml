type season = Winter | Spring | Summer | Fall

let weather s =
  match s with
  | Winter -> "cold"
  | Spring -> "cool"
  | Summer -> "hot"
  | Fall -> "perfect"

let weather2 = function
  | Winter -> "cold"
  | Spring -> "cool"
  | Summer -> "hot"
  | Fall -> "perfect"

let () =
  print_endline (weather Fall);
  print_endline (weather2 Fall);

  Random.self_init ();
  let n = Random.int 10 in
  print_endline (string_of_int n);
  match n with
  | n when n < 3 -> print_endline "small"
  | n when 4 <= n && n <= 7 -> print_endline "medium"
  | _ -> print_endline "large"
