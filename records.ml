open Printf

type item = { description : string; weight : float; mutable price : int }
type team = { name : string; city : string; sport : string }

(* If variables that are set to a record do not specify a record type,
   they still must match some known record type (using duck typing).
   Also, they cannot contain extra fields. *)
let chiefs : team =
  { name = "Chiefs"; city = "Kansas City"; sport = "football" }

let eggs = { description = "eggs"; weight = 0.4; price = 275 }
let milk : item = { description = "milk"; weight = 1.0; price = 350 }

(* THIS DOESN'T REQUIRE THE CHANGES TO BE ON MUTABLE FIELDS! *)
let new_milk = { milk with description = "new milk"; weight = 1.5 }
let items = [ eggs; new_milk ]

(* Use dot syntax to acces field values. *)
let print_item item =
  printf "%s: $%d (%f lbs)\n" item.description item.price item.weight

let () =
  List.iter print_item items;
  let total = List.fold_left (fun acc item -> acc + item.price) 0 items in
  printf "Total: $%d\n" total
