module StringMap = Map.Make (String)

let () =
  let map =
    StringMap.empty |> StringMap.add "a" "apple" |> StringMap.add "b" "banana"
    |> StringMap.update "a" (Option.map (fun _ -> "apricot"))
    |> StringMap.remove "b"
  in
  let a_fruit = StringMap.find_opt "a" map in
  match a_fruit with
  | None -> print_endline "No such fruit"
  | Some fruit -> print_endline fruit
