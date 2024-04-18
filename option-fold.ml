type dogt = { name : string; breed : string }

let dog1_opt = None
let dog2_opt = Some { name = "Comet"; breed = "whippet" }

let () =
  let dog = Option.value ~default:{ name = ""; breed = "unknown" } dog1_opt in
  print_endline dog.breed;

  let breed =
    Option.fold ~none:"unknown"
      ~some:(fun dog -> String.uppercase_ascii dog.breed)
      dog2_opt
  in
  print_endline breed
