module Main exposing (..)

import Html exposing (Html, a, button, code, div, h1, li, text, ul)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Http
import Navigation
import State exposing (Model, init, Msg(NewUrl, UrlChange), update, subscriptions)
import Routing exposing (Route(..))


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



--VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Links" ]
        , ul [] (List.map viewLink [ "/", "/blog/", "/blog/42", "/blog/37", "/blog/?search=cats" ])
        , h1 [] [ text "History" ]
        , ul [] (List.map viewRoute model.history)
        ]


viewLink : String -> Html Msg
viewLink url =
    li [] [ button [ onClick (NewUrl url) ] [ text url ] ]


viewRoute : Maybe Route -> Html msg
viewRoute maybeRoute =
    case maybeRoute of
        Nothing ->
            li [] [ text "Invalid URL" ]

        Just route ->
            li [] [ code [] [ text (routeToString route) ] ]


routeToString : Route -> String
routeToString route =
    case route of
        Home ->
            "home"

        BlogList Nothing ->
            "list all blog posts"

        BlogList (Just search) ->
            "search for " ++ Http.encodeUri search

        BlogPost id ->
            "show blog post" ++ toString id
