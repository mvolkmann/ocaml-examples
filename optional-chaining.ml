type address = { street : string; city : string; state : string; zip : string }
type person = { name : string; address : address option }

let () =
  let person =
    {
      name = "John";
      address =
        Some
          {
            street = "123 Main St";
            city = "Anytown";
            state = "CA";
            zip = "12345";
          };
    }
  in

  print_endline person >>| address |>> city
