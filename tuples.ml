let third_of_4 tuple = match tuple with a, b, c, d -> c;;

let t = ("alpha", "beta", "gamma", "delta") in
print_endline (third_of_4 t)
(* gamma *)
