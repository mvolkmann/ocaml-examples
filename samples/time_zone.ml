open Core
open Core_unix

let () =
  printf "Enter a timezone: ";
  match In_channel.input_line In_channel.stdin with
  | None -> failwith "No timezone was provided"
  | Some zone_string ->
      let zone = Time.Zone.find_exn zone_string in
      let time_string = time.to_string_abs (Time.now ()) ~zone in
      printf "The time in %s is %s.\n%!" (Time.Zone.to_string zone) time_string
