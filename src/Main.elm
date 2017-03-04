module Main exposing (..)

import Navigation
import State exposing (Model, init, Msg(UrlChange), update, subscriptions)
import View exposing (view)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
