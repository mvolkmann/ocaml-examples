open Printf

(* A tree can be empty or it can have a node
   that holds a left tree, a value, and a right tree. *)
type 'a tree = Empty | Node of 'a * 'a tree * 'a tree

let rec depth_first_in_order tree =
  match tree with
  | Empty -> () (* do nothing *)
  | Node (value, left, right) ->
      depth_first_in_order left;
      print_endline value;
      depth_first_in_order right

(* This holds names in a tree so that when
   printed with depth_first_in_order
   they will appear in sorted order. *)
let family_tree : string tree =
  Node
    ( "Jeremy",
      Node ("Amanda", Empty, Empty),
      Node
        ( "Meghan",
          Node ("Mark", Empty, Empty),
          Node ("RC", Empty, Node ("Tami", Empty, Empty)) ) )

let () = depth_first_in_order family_tree
