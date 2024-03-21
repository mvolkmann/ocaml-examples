let () =
  let result = 0 in
  if result = 0 then print_endline "none";
  let sign =
    if result > 0 then "positive" else if result < 0 then "negative" else "zero"
  in
  print_endline sign;

  let result = 7 in
  if result > 0 then (
    print_string "positive";
    print_newline ())
  else if result < 0 then print_endline "negative"
  else (
    print_endline "zero";
    print_endline "none")
