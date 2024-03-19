open My_lib.My_math

let () =
  let a = 1 and b = 2 and c = 3 in
  print_int (MyMath.add a b);
  print_newline ();
  print_float (MyMath.average b c);
  print_newline ()
