open Printf

module IntSet = Set.Make (struct
  type t = int

  let compare = Int.compare
end)

type dog = { name : string; breed : string }

module DogSet = Set.Make (struct
  type t = dog

  let compare a b = String.compare a.name b.name
end)

let () =
  let intSet = IntSet.of_list [ 3; 5; 3 ] in
  IntSet.iter (fun n -> print_endline (string_of_int n)) intSet;

  let dogSet =
    DogSet.(
      empty
      |> add { name = "Comet"; breed = "Whippet" }
      |> add { name = "Oscar"; breed = "GSP" }
      |> add { name = "Comet"; breed = "Greyhound" })
  in
  DogSet.iter (fun dog -> printf "%s is a %s.\n" dog.name dog.breed) dogSet
