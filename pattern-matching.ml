open Printf

type color = Red | Green | Blue
type player = { name : string; number : int; active : bool }

let player = { name = "Wayne Gretzky"; number = 99; active = false }

let () =
  let color = Red in
  (match color with
  | Red -> printf "FF0000\n"
  | Green -> printf "00FF00\n"
  | Blue -> printf "0000FF\n");

  let { name; number; active } = player in
  if active then
    printf "%s wears number %d.\n" name number
  else
    printf "%s is no longer active.\n" name;

  match player with
  | { name; active } when not active -> printf "%s is no longer active.\n" name
  | { name; number } -> printf "%s wears number %d.\n" name number