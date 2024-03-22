open Printf

type 'a tree = Empty | Node of 'a tree * 'a * 'a tree

let rec depth_first_in_order tree =
  match tree with
  | Empty -> ()
  | Node (left, value, right) ->
      depth_first_in_order left;
      print_endline value;
      depth_first_in_order right

let family_tree : string tree =
  Node
    ( Node (Empty, "Amanda", Empty),
      "Jeremy",
      Node
        ( Node (Empty, "Mark", Empty),
          "Meghan",
          Node (Empty, "RC", Node (Empty, "Tami", Empty)) ) )

let () = depth_first_in_order family_tree
