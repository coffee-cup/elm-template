port module Subscriptions exposing (..)

import Time exposing (Time, second)
import Models exposing (Model)
import Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick
