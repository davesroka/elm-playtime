module State exposing (..)

import Routing exposing (Route, route)
import Navigation exposing (Location, newUrl)
import UrlParser as Url exposing ((</>), (<?>), s, int, stringParam, top)


-- MODEL


type alias Model =
    { history : List (Maybe Route) }



-- INIT


init : Location -> ( Model, Cmd Msg )
init location =
    ( Model [ Url.parsePath route location ]
    , Cmd.none
    )



-- UPDATE


type Msg
    = NewUrl String
    | UrlChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewUrl url ->
            ( model
            , newUrl url
            )

        UrlChange location ->
            ( { model | history = Url.parsePath route location :: model.history }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
