(* Create an association list. *)
let al1 = [ ("red", "FF0000"); ("green", "00FF00"); ("blue", "0000FF") ]

(* Create a new association list from al1
   where the "green" key/value pair is removed. *)
let al2 = List.remove_assoc "green" al1

(* Create a new association list from al1
   where the "yellow" key/value pair is added. *)
let al3 = ("yellow", "FFFF00") :: al2

let () =
  (* Get the value for the "red" key in al1. *)
  assert (List.assoc "red" al1 = "FF0000");
  (* Determine if the key "red" is present in al1. *)
  assert (List.mem_assoc "red" al1);
  (* Determine if the key "purple" is present in al1. *)
  assert (not (List.mem_assoc "purple" al1));
  (* Determine if the key "yellow" is present in al3. *)
  assert (List.mem_assoc "yellow" al3)
