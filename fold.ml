let numbers = [ 1; 2; 3 ]

let () =
  let sum = List.fold_left (fun acc n -> acc + n) 0 numbers in
  Printf.printf "fold_left result is %d\n" sum;

  let sum = List.fold_right (fun n acc -> acc + n) numbers 0 in
  Printf.printf "fold_right result is %d\n" sum
