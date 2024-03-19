module MyMath = struct
  let add a b = a + b

  let average a b = float_of_int (add a b) /. 2.0
end

(* let test "add" = MyMath.add 1 2 = 4 *)
(* let test "average" = average 2 3 = 2.5 *)
