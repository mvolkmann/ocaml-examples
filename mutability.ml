open Printf

type player = { name : string; mutable score : int }

let () =
  let score = ref 0 in
  score := !score + 1;
  (* The incr and decr functions only operate on refs. *)
  incr score;
  decr score;
  printf "score = %d\n" !score;

  let numbers = [| 1; 2; 3 |] in
  numbers.(2) <- 4;
  Array.iter (fun n -> printf "%d\n" n) numbers;

  let player = { name = "Mark"; score = 0 } in
  player.score <- succ player.score;
  printf "score for %s is %d\n" player.name player.score;

  let dogs = Hashtbl.create 10 in
  Hashtbl.add dogs "Comet" "Whippet";
  Hashtbl.add dogs "Oscar" "GSP";
  Hashtbl.replace dogs "Comet" "Greyhound";
  Hashtbl.remove dogs "Comet";
  Hashtbl.iter (fun name breed -> printf "%s is a %s.\n" name breed) dogs
