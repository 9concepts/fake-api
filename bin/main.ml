open Opium

let root_handler _req =
  "Hello\n"
  |> Response.of_plain_text
  |> Lwt.return
;;

let _ =
  App.empty
  |> App.get "/" root_handler
  |> App.run_command
;;
