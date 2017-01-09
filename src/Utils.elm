module Utils exposing (..)

import Time exposing (Time)
import Date exposing (fromTime)


classify : String -> String
classify s =
    s
        |> String.toLower
        |> String.split " "
        |> String.join "-"


boolToInt : Bool -> Int
boolToInt b =
    case b of
        True ->
            1

        False ->
            0


formatTime : Time -> String
formatTime time =
    let
        date =
            fromTime time

        hour =
            Date.hour date

        minute =
            Date.minute date

        second =
            Date.second date

        padTime : Int -> String
        padTime time =
            time |> toString |> String.padLeft 2 '0'
    in
        (padTime hour) ++ "." ++ (padTime minute) ++ "." ++ (padTime second)
