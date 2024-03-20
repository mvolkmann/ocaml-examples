(* use Printf *)

let colors = [ "red"; "green"; "blue" ]
let color = "greenx"
let result = List.find_opt (fun x -> x = color) colors

let () =
  match result with
  | Some c -> Printf.printf "found %s\n" c
  | None -> print_endline "failed to find green\n"
