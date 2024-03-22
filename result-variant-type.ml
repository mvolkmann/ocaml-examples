let divide numerator denomiator =
  if denomiator = 0.0 then Error "Division by zero"
  else Ok (numerator /. denomiator)

let () =
  let n = 5.0 and d = 2.0 in
  match divide n d with
  | Ok v -> print_endline (string_of_float v)
  | Error e -> print_endline e
