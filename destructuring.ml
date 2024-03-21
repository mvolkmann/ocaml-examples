open Printf

(* This only handles tuples of length 4. *)
let tuple2of4 (_, e, _, _) = e

(* Alternate implementation *)
(* let tuple2of4 tuple = match tuple with a, b, c, d -> b *)

(* This only handles lists of length 4. *)
let list2of4 = function
  | [ _; e; _; _ ] -> e
  | _ -> failwith "list must have length 4"

(* This only handles arrays of length 4. *)
let array2of4 = function
  | [| _; e; _; _ |] -> e
  | _ -> failwith "array must have length 4"

let () =
  (* The type of this tuple is `int * int * int * int`.
     It specifies a length of 4. *)
  (* You can think of tuples like records where the fields
     are accessed by position rather than name. *)
  let t = ("a", "b", "c", "d") in
  let _, second, third, _ = t in
  printf "second in tuple is %s\n" second;
  printf "third in tuple is %s\n" third;
  printf "second in tuple is %s\n" (tuple2of4 t);

  (* The type of this list is `int list`.
     It does not specify a length. *)
  let l = [ "a"; "b"; "c"; "d" ] in
  printf "second in list is %s\n" (list2of4 l);

  (* The type of this array is `int array`.
     It does not specify a length. *)
  let a = [| "a"; "b"; "c"; "d" |] in
  printf "second in array is %s\n" (array2of4 a)
