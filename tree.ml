open Printf

(* A tree can be empty or it can have a node
   that holds a left tree, a value, and a right tree. *)
type 'a tree = Empty | Node of 'a tree * 'a * 'a tree

let rec depth_first_in_order tree =
  match tree with
  | Empty -> () (* do nothing *)
  | Node (left, value, right) ->
      depth_first_in_order left;
      print_endline value;
      depth_first_in_order right

(* This holds names in a tree so that when
   printed with depth_first_in_order
   they will appear in sorted order. *)
let family_tree : string tree =
  Node
    ( Node (Empty, "Amanda", Empty),
      "Jeremy",
      Node
        ( Node (Empty, "Mark", Empty),
          "Meghan",
          Node (Empty, "RC", Node (Empty, "Tami", Empty)) ) )

let () = depth_first_in_order family_tree
