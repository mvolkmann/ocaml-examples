type address = { street : string; city : string; state : string; zip : string }
type person = { name : string; address : address option }

(* This custom operator applies a function to an Option,
   returning a new Option.
   If it is given None, it returns None.
   Otherwise it returns Some (f x). *)
let ( >>| ) opt fn = Option.map fn opt

(* Option.value takes an optional value and a default value.
   If the optional value is Some x, it returns x.
   If it is None, it returns the default value. *)
let get_city person =
  person.address >>| (fun x -> x.city) |> Option.value ~default:"unknown"

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
