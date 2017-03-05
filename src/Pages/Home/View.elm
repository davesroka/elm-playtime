module Pages.Home.View exposing (view)

import Html exposing (Html, a, button, code, div, h1, li, text, ul)
import Html.Events exposing (onClick)
import State exposing (Model, Msg(NewUrl))


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Links" ]
        , ul [] (List.map link [ "/", "/blog/", "/blog/42", "/blog/37", "/blog/?search=cats" ])
        , h1 [] [ text "History" ]
        ]


link : String -> Html Msg
link url =
    li [] [ button [ onClick (NewUrl url) ] [ text url ] ]
