open Printf

let al1 = [ ("red", "FF0000"); ("green", "00FF00"); ("blue", "0000FF") ]
let al2 = List.remove_assoc "green" al1
let al3 = ("yellow", "FFFF00") :: al2

let () =
  assert (List.assoc "red" al1 = "FF0000");
  assert (List.mem_assoc "red" al1);
  assert (not (List.mem_assoc "purple" al1));
  assert (List.mem_assoc "yellow" al3)
