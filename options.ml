let double x = x * 2
let is_even x = x mod 2 == 0

let () =
  let numbers = [ 1; 4; 7 ] in
  let result = List.find_opt is_even numbers |> Option.map double in
  Option.map string_of_int result
  |> Option.value ~default:"no even found"
  |> print_endline
