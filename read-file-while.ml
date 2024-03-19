let channel = open_in "BeverlyHillbillies.txt" in
try
  while true do
    let line = input_line channel in
    print_endline line
  done
with End_of_file -> close_in channel
