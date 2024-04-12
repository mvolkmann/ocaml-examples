let options = [ Some 1; None; Some 2 ]
let values = List.map (function Some x -> x | None -> 0) options
let () = List.iter (Printf.printf "%d\n") values
