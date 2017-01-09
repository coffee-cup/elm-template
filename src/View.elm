module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList)
import Html.Events exposing (onClick)
import Date exposing (Date, fromTime)
import Time exposing (Time)
import Svg exposing (circle, line, svg)
import Svg.Attributes
import Utils exposing (formatTime)


--import Svg.Attributes exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Sitemap(..))
import ViewUtils exposing (..)


view : Model -> Html Msg
view model =
    div [ class "ph6-ns ph4-m ph3" ]
        [ div [ class "full" ] [ page model ]
        ]



-- Router


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            homeView model

        AboutRoute ->
            aboutView model

        NotFoundRoute ->
            notFoundView


header : Model -> Html Msg
header model =
    div [ class "header bold full vertical-center" ]
        [ div []
            [ h1 [ class "f-headline-ns f-subheadline mv0" ] [ text "Hello." ]
            , counter model.counter
            ]
        ]


clock : Time -> Html Msg
clock time =
    let
        angle =
            turns (Time.inMinutes time)

        handX =
            toString (50 + 40 * cos angle)

        handY =
            toString (50 + 40 * sin angle)
    in
        svg [ Svg.Attributes.viewBox "0 0 100 100", Svg.Attributes.width "300px" ]
            [ circle [ Svg.Attributes.cx "50", Svg.Attributes.cy "50", Svg.Attributes.r "45", Svg.Attributes.fill "#0B79CE" ] []
            , line [ Svg.Attributes.x1 "50", Svg.Attributes.y1 "50", Svg.Attributes.x2 handX, Svg.Attributes.y2 handY, Svg.Attributes.stroke "#023963" ] []
            ]


counter : Int -> Html Msg
counter counter =
    div [ class "counter f1" ]
        [ span [ onClick (Decrease 1), class "pointer" ] [ text "-" ]
        , span [ class "ph4" ] [ text (toString counter) ]
        , span [ onClick (Increase 1), class "pointer" ] [ text "+" ]
        ]


footer : Html Msg
footer =
    div [ class "footer pb4" ]
        [ p [ class "f5" ]
            [ a [ onClick ShowHome, class "dim none pointer" ] [ text "♥" ]
            ]
        ]


timeDisplay : Time -> Html Msg
timeDisplay time =
    div [ class "time-display w-100" ]
        [ h1 [ class "f-headline-ns f-subheadline mv0 tc" ] [ text (formatTime time) ] ]



-- Sample Routes


homeView : Model -> Html Msg
homeView model =
    div [ class "full vertical-center" ]
        [ timeDisplay model.time
        ]


aboutView : Model -> Html Msg
aboutView model =
    div [ class "about" ]
        [ headingLarge "About"
        , p [ class "measure" ] [ text "About this site." ]
        , a [ onClick ShowHome, class "f1 none dim" ] [ text "←" ]
        ]


notFoundView : Html Msg
notFoundView =
    div [ class "not-found full vertical-center" ]
        [ div []
            [ h2 [ class "f2 mv4 mono" ] [ text "¯\\_(ツ)_/¯" ]
            , p [ class "measure" ]
                [ text "Page not found. "
                , a [ onClick ShowHome, class "pointer su-colour" ] [ text "Go home" ]
                , text "."
                ]
            ]
        ]
