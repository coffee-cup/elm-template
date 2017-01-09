module Messages exposing (..)

import Time exposing (Time)
import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | Increase Int
    | Decrease Int
    | ShowHome
    | ShowAbout
    | Tick Time
