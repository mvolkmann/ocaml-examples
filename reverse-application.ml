open Printf

type item = { description : string; price : int }

let tax_rate = 0.085

let cart =
  [
    { description = "eggs"; price = 250 };
    { description = "milk"; price = 350 };
    { description = "bread"; price = 300 };
  ]

let () =
  let subtotal = List.fold_left (fun acc item -> acc + item.price) 0 cart in
  let float_subtotal = float_of_int subtotal /. 100. in
  let tax = float_subtotal *. tax_rate in
  let total = float_subtotal +. tax in
  printf "Total: $%.2f\n" total;

  let total =
    cart
    |> List.fold_left (fun acc item -> acc + item.price) 0
    |> float_of_int |> ( *. ) 0.01
    |> ( *. ) (1. +. tax_rate)
  in
  printf "Total: $%.2f\n" total
