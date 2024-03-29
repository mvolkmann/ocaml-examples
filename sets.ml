open Printf

module IntSet = Set.Make (struct
  type t = int

  let compare = compare
end)

type dog = { name : string; breed : string }

module DogSet = Set.Make (struct
  type t = dog

  let compare a b = compare a.name b.name
end)

let () =
  let intSet = IntSet.of_list [ 3; 5; 3 ] in
  IntSet.iter
    (fun n ->
      print_int n;
      print_newline ())
    intSet;

  let dogSet =
    DogSet.(
      empty
      |> add { name = "Comet"; breed = "Whippet" }
      |> add { name = "Oscar"; breed = "GSP" }
      |> add { name = "Comet"; breed = "Greyhound" })
  in
  DogSet.iter (fun dog -> printf "%s is a %s.\n" dog.name dog.breed) dogSet
