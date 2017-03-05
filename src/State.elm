module State exposing (..)

import Routing exposing (Route, parseLocation)
import Navigation exposing (Location, newUrl)


-- MODEL


type alias Model =
    { history : List Route
    , currentRoute : Route
    }



-- INIT


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( Model [ currentRoute ] currentRoute
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
            let
                newRoute =
                    parseLocation location
            in
                ( { model
                    | history = newRoute :: model.history
                    , currentRoute = newRoute
                  }
                , Cmd.none
                )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
