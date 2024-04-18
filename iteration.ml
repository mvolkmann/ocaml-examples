open Printf

let () =
  print_endline "for going up";
  for i = 1 to 5 do
    printf "%d\n" i
  done;

  print_endline "for going down";
  for i = 5 downto 1 do
    printf "%d\n" i
  done;

  (* The expression inside a for loop must have a unit value, which means that
     the loop itself doesn't return a value. *)
  (* There is no `break` or `continue` like in other languages. *)

  (* A while loop takes a boolean expression. This might be an expression
     involving a ref whose value changes or a function that returns a value to
     be tested. *)
  print_endline "while";
  let i = ref 1 in
  while !i <= 5 do
    printf "%d\n" !i;
    incr i
  done;

  (* To iterate over collections like lists and arrays it's best to use `iter`
     functions instead of `for` loops. *)
  print_endline "List.iter";
  let numbers = [ 1; 2; 3; 4; 5 ] in
  List.iter (fun x -> printf "%d\n" x) numbers;

  print_endline "Array.iter";
  let numbers = [| 1; 2; 3; 4; 5 |] in
  Array.iter (fun x -> printf "%d\n" x) numbers
