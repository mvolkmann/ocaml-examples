type address = { street : string; city : string; state : string; zip : string }
type person = { name : string; address : address option }

(* This custom operator applies a function to an Option,
   returning a new Option.
   If it is given None, it returns None.
   Otherwise it returns Some (f x). *)
let ( let+ ) opt fn = Option.map fn opt

let get_city person =
  (let+ address = person.address in
   address.city)
  |> Option.value ~default:"unknown"

let person1 =
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

let person2 = { name = "John"; address = None }

let () =
  print_endline (get_city person1);
  (* "Anytown" *)
  print_endline (get_city person2)
(* "unknown" *)
