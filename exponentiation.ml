(* This works, but the conversions to and from
   float values introduce precision issues. *)
let bad_pow a b = float_of_int a ** float_of_int b |> int_of_float

(* This avoids converting int values to float values. *)
let rec fast_pow acc i n =
  (* Printf.printf "acc = %d, i = %d, n = %d\n" acc i n; *)
  if n = 0 then acc
    (* lsr is short for logical shift right (i.e. divide by 2) *)
  else if n mod 2 = 0 then fast_pow acc (i * i) (n lsr 1)
  else fast_pow (i * acc) (i * i) (n lsr 1)

let pow i n = if n < 0 then assert false else fast_pow 1 i n

(* For example:
   pow 2 6
   fast_pow 1 2 6
   fast_pow 1 (2 * 2) (6 lsr 1) -> fast_pow 1 4 3
   fast_pow (4 * 1) (4 * 4) (3 lsr 1) -> fast_pow 4 16 1
   fast_pow (16 * 4) (16 * 16) (1 lsr 1) -> fast_pow 64 256 0
*)
let () =
  assert (2. ** 3. = 8.);
  assert (pow 2 2 = 4);
  assert (pow 2 6 = 64);
  assert (pow 2 7 = 128)
