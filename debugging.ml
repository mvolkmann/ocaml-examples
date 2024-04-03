let log file fn line =
  Printf.printf "file: %s; function: %s; line: %d\n" file fn line

let demo () =
  print_endline "entered demo";
  log __FILE__ __FUNCTION__ __LINE__;
  print_endline "exiting demo"

let () = demo ()
