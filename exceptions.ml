open Printf

exception TemperatureCrazy
exception TemperatureHigh of float

let evaluate_temperature temp =
  if temp >= 120.0 then raise TemperatureCrazy;
  if temp >= 100.0 then raise (TemperatureHigh temp);
  if temp < 32.0 then "cold" else if temp < 75.0 then "hot" else "nice"

let report_temperature t =
  try printf "%.1f is %s\n" t (evaluate_temperature t) with
  | TemperatureCrazy -> printf "%.1f is a crazy temperature!\n" t
  | TemperatureHigh t -> printf "%.1f is too hot!\n" t

(* Alternative that does the same thing and
   is good for matching both exceptions and other values.
   let report_temperature t =
     match evaluate_temperature t with
     | exception TemperatureCrazy -> printf "%.1f is a crazy temperature!\n" t
     | exception TemperatureHigh t -> printf "%.1f is too hot!\n" t
     | s -> printf "%.1f is %s\n" t s
*)

let () =
  report_temperature 80.0;
  (* "80.0 is nice" *)
  report_temperature 50.0;
  (* "50.0 is nice" *)
  report_temperature 20.0;
  (* "20.0 is cold" *)
  report_temperature 100.0;
  (* "100.0 is too hot!" *)
  report_temperature 120.0 (* "120.0 is a crazy temperature!" *)
