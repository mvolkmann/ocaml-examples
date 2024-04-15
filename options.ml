let options = [ Some 1; None; Some 2 ]
let double x = x * 2
let is_even x = x mod 2 == 0

let () =
  List.iter
    (fun x ->
      match x with
      | None -> print_endline "none"
      | Some n ->
          print_int n;
          print_newline ())
    options;

  let numbers = [ 1; 4; 7 ] in
  (* Find the first even number, double it, and print it. *)
  List.find_opt is_even numbers
  |> Option.map double
  |> Option.map string_of_int
  |> Option.value ~default:"no even found"
  |> print_endline
