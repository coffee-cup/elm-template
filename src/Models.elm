module Models exposing (..)

import Time exposing (Time)
import Routing exposing (Sitemap)


type alias Model =
    { counter : Int
    , route : Sitemap
    , time : Time
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { counter = 0
    , route = sitemap
    , time = 0
    }
