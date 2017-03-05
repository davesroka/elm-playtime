module Components.Header exposing (view)

import State exposing (Model, Msg)
import Html exposing (Html, header, nav, text, a)
import Html.Attributes exposing (href)


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
    nav [] (List.map navLink navItems)


navLink : NavItem -> Html Msg
navLink navItem =
    a [ href ("#" ++ navItem.link) ] [ text navItem.displayText ]
