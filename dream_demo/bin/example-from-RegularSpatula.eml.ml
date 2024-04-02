let show_form ?message_1 ?message_2 request =
  <html>
  <body>

%   begin match message_1 with
%   | None -> ()
%   | Some message_1 ->
      <p>You entered: <b><%s message_1 %>!</b></p>
%   end;

%   begin match message_2 with
%   | None -> ()
%   | Some message_2 ->
      <p>You entered: <b><%s message_2 %>!</b></p>
%   end;

    <form method="POST" action="/">
      <%s! Dream.csrf_tag request %>
      <input name="message_1" autofocus>
      <input name="message_2" autofocus>
      <button type="submit">Submit</button>
    </form>

  </body>
  </html>

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.memory_sessions
  @@ Dream.router [

    Dream.get  "/"
      (fun request ->
        Dream.html (show_form request));

    Dream.post "/"
      (fun request ->
        match%lwt Dream.form request with
        | `Ok [("message_1", message_1); ("message_2", message_2)] ->
          Dream.html (show_form ~message_1 ~message_2 request)
        | _ ->
          Dream.error (fun log ->
            log ~request "OOps!");
          Dream.empty `Bad_Request);

  ]