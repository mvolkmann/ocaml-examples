open Core

let () =
  (* Including %! at the end of the format string flushes the output buffer. *)
  printf "Enter a timezone: %!";
  (* Enter a value like "America/Chicago" or "Europe/London". *)
  match In_channel.(input_line stdin) with
  (* Pressing return without entering text gives Some "", not None. *)
  | None -> failwith "No timezone was provided"
  | Some zone_string ->
      (* The package Time_float_unix is defined in the Core_unix library,
         but through some magic it is found without mentioning that library. *)
      let open Time_float_unix in
      let now = Time_float.now () in
      (* Can I make this work with timezone abbreviations
         like CST instead of long timezone names? *)
      let zone = Zone.find_exn zone_string in
      (* How can I get only the time without
         the date, seconds, and timezone offset? *)
      let time_string = to_string_abs now ~zone in
      printf "The time in %s is %s.\n" (Zone.to_string zone) time_string
