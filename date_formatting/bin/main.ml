module Date = ODate.Unix

(* For documentation for date/time format strings, see
   https://github.com/MLstate/opalang/blob/master/lib/stdlib/core/date/duration.opa#L472
   A is day of week, B is month, d is day of month, Y is year.
   a and b give abbreviations.
*)
let date_format = "%A, %B %d %Y"

let date_printer =
  match Date.To.generate_printer date_format with
  | Some p -> p
  | None -> failwith "could not generate printer"

let now () = Unix.(() |> time |> localtime)

let format_date { Unix.tm_year; tm_mon; tm_mday; _ } =
  Printf.sprintf "%4d-%02d-%02d" (tm_year + 1900) (tm_mon + 1) tm_mday

let () =
  let n = Date.now() in
  let s = Date.To.string date_printer n in
  print_endline s;

  let s2 = format_date (now ()) in
  print_endline s2

