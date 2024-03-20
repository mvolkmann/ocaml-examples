module StringMap = Map.Make (String)

let () =
  let map = StringMap.empty in
  let map = map |> StringMap.add "a" "apple" in
  let map = map |> StringMap.add "b" "banana" in
  let map = map |> StringMap.update "a" (Option.map (fun _ -> "apricot")) in
  let map = map |> StringMap.remove "b" in
  let a_fruit = StringMap.find_opt "a" map in
  match a_fruit with
  | None -> print_endline "No such fruit"
  | Some fruit -> print_endline fruit
