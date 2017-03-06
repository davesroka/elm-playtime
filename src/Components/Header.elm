module Components.Header exposing (view)

import State exposing (Model, Msg)
import Html exposing (Html, header, div, nav, text, a)
import Html.Attributes exposing (href, class)


type alias NavItem =
    { displayText : String
    , link : String
    }


view : Model -> Html Msg
view model =
    let
        navItems =
            [ NavItem "Blog Posts" "blog"
            , NavItem "Blog Post 32" "blog/32"
            ]
    in
        header []
            [ navigation navItems ]


navigation : List NavItem -> Html Msg
navigation navItems =
    nav
        [ class "clearfix white bg-maroon" ]
        [ div
            [ class "sm-col" ]
            (List.map navLink navItems)
        , div
            [ class "sm-col-right" ]
            [ navLink (NavItem "About" "about") ]
        ]


navLink : NavItem -> Html Msg
navLink navItem =
    a
        [ href ("#" ++ navItem.link)
        , class "btn py2"
        ]
        [ text navItem.displayText ]
