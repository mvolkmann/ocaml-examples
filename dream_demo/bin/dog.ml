open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type t = { id : string; name : string; breed : string }
[@@deriving yojson]

let breed = Option.fold ~some:(fun dog -> dog.breed) ~none:""

let name = Option.fold ~some:(fun dog -> dog.name) ~none:""
