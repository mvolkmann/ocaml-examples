(* See w-template-logic at
   https://github.com/aantron/dream/tree/master/example/w-template-logic#files. *)
(* To uses this, run "opam install ppx_yojson_conv". *)
open My_lib
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

let dog_table = Hashtbl.create 10
let selected_id = ref None
let generate_uuid () = Uuidm.(v `V4 |> to_string)

let json_of_hashtbl json_of_list h =
  h
  |> Hashtbl.to_seq_values
  |> List.of_seq
  |> json_of_list
  |> Yojson.Safe.to_string (* converts json representation to string *)

let add_dog name breed =
  let id = generate_uuid () in
  let dog = { Dog.id; name; breed } in
  Hashtbl.replace dog_table id dog;
  dog

let create_dog request =
  match%lwt Dream.form request with
  (* The tuples in this list must be in alphabetical order. *)
  | `Ok [ ("breed", breed); ("name", name) ] ->
      let new_dog = add_dog name breed in
      Dog_row.render new_dog "" |> Dream.html ~status:`Created
  | _ -> Dream.empty `Bad_Request

let delete_dog request =
  let id = Dream.param request "id" in
  let dog = Hashtbl.find_opt dog_table id in
  match dog with
  | None -> Dream.empty `Not_Found
  | Some _ ->
      Hashtbl.remove dog_table id;
      Dream.empty `OK

let deselect_dog _ =
  selected_id := None;
  Dream.empty `OK ~headers:[ ("HX-Trigger", "selection-change") ]

let get_dogs_json _ =
  let json_of_list = [%yojson_of: Dog.t list] in
  json_of_hashtbl json_of_list dog_table
  |> Dream.json (* adds Content-Type response header *)

let form request =
  let attrs =
    match !selected_id with
    | None -> "hx-post=/dog hx-target=tbody hx-swap=afterbegin"
    | Some id -> "hx-put=/dog/" ^ id
  in
  let selected_dog_opt =
    match !selected_id with
    | None -> None
    | Some id -> Hashtbl.find_opt dog_table id
  in
  Form.render request attrs selected_dog_opt |> Dream.html

let select_dog request =
  let id = Dream.param request "id" in
  selected_id := Some id;
  Dream.empty `OK ~headers:[ ("HX-Trigger", "selection-change") ]

let table_rows _ =
  let dog_list = dog_table |> Hashtbl.to_seq_values |> List.of_seq in
  let sorted_list =
    List.sort
      (fun a b ->
        String.compare
          (String.lowercase_ascii a.Dog.name)
          (String.lowercase_ascii b.name))
      dog_list
  in
  let rows =
    List.fold_right (fun dog acc -> Dog_row.render dog "" :: acc) sorted_list []
  in
  String.concat "" rows |> Dream.html

let update_dog request =
  let id = Dream.param request "id" in
  let dog_opt = Hashtbl.find_opt dog_table id in
  match dog_opt with
  | None -> Dream.empty `Not_Found
  | Some _ -> (
      match%lwt Dream.form request with
      (* The tuples in this list must be in alphabetical order. The
         "Bad_Request" response below is returned if the form data does not
         contain "breed" and "name". *)
      | `Ok [ ("breed", breed); ("name", name) ] ->
          let updated_dog = { Dog.id; name; breed } in
          Hashtbl.replace dog_table id updated_dog;
          selected_id := None;
          Dog_row.render updated_dog "hx-swap-oob=true"
          |> Dream.html ~headers:[ ("HX-Trigger", "selection-change") ]
      | _ -> Dream.empty `Bad_Request)

let () =
  (* Add some initial dogs. This shows two ways to ignore the return value of a
     function. *)
  ignore (add_dog "Comet" "Whippet");
  add_dog "Oscar" "German Shorthaired Pointer" |> ignore;

  Dream.router
    [
      Dream.delete "/dog/:id" delete_dog;
      Dream.get "/deselect" deselect_dog;
      (* This demonstrates an endpoint that returns JSON. *)
      Dream.get "/dogs" get_dogs_json;
      Dream.get "/form" form;
      Dream.get "/select/:id" select_dog;
      Dream.get "/table-rows" table_rows;
      Dream.post "/dog" create_dog;
      Dream.put "/dog/:id" update_dog;
      (* This serves index.html by default. *)
      Dream.get "/" (Dream.from_filesystem "public" "index.html");
      (* This assumes all other GET requests are for static files in the public
         directory. It must appear after all the other routes. *)
      Dream.get "/**" @@ Dream.static "public";
    ]
  (* A session middleware is required. Other options are cookie_sessions and
     sql_sessions. *)
  |> Dream.memory_sessions
  (* This middleware logs all HTTP requests in the terminal where this is
     running. *)
  |> Dream.logger
  |> Dream.run ~port:3000
