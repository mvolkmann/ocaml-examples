open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type t = { id : string; name : string; breed : string } [@@deriving yojson]

let breed_of_opt = Option.fold ~some:(fun dog -> dog.breed) ~none:""
let name_of_opt = Option.fold ~some:(fun dog -> dog.name) ~none:""

let%test "test breed_of_opt with some" =
  breed_of_opt (Some { id = "1"; name = "Buddy"; breed = "Labrador" })
  = "Labrador"

let%test "test breed_of_opt with none" = breed_of_opt None = ""

let%test "test name_of_opt with some" =
  name_of_opt (Some { id = "1"; name = "Buddy"; breed = "Labrador" }) = "Buddy"

let%test "test name_of_opt with none" = name_of_opt None = ""
