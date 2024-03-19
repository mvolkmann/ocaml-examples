let channel = open_in "BeverlyHillbillies.txt" in
let rec loop () =
  try
    let line = input_line channel in
    print_endline line;
    loop ()
  with End_of_file -> close_in channel
in
loop ()
