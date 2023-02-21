open Opium
open Lwt.Infix
open Caqti_request.Infix

module Db =
  (val Caqti_lwt.connect
         (Uri.of_string
            "postgresql://developer:developer@localhost:5432/fake_world")
       >>= Caqti_lwt.or_fail |> Lwt_main.run)

let plus =
  Caqti_request.(Caqti_type.(tup2 int int) ->! Caqti_type.int) "SELECT ? + ?"

let root_handler _req =
  match%lwt Db.find plus (7, 13) with
  | Ok result -> string_of_int result |> Response.of_plain_text |> Lwt.return
  | Error _e -> "fail" |> Response.of_plain_text |> Lwt.return

let _ = App.empty |> App.get "/" root_handler |> App.run_command
