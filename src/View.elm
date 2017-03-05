module View exposing (view)

import Html exposing (Html, a, button, code, div, h1, li, text, ul, nav)
import Http
import State exposing (Model, Msg(NewUrl))
import Routing exposing (Route(..))
import Pages.Home.View as Home
import Components.Header as Header


view : Model -> Html Msg
view model =
    div []
        [ Header.view model
        , getView model
        ]


getView : Model -> Html Msg
getView model =
    case model.currentRoute of
        Home ->
            Home.view model

        BlogList Nothing ->
            div [] [ code [] [ text "List all blog posts" ] ]

        BlogList (Just search) ->
            div [] [ code [] [ text ("search for " ++ Http.encodeUri search) ] ]

        BlogPost id ->
            div [] [ code [] [ text ("show blog post " ++ toString id) ] ]

        NotFound ->
            div [] [ text "Not Found" ]
