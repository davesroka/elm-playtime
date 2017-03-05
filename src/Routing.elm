module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), (<?>), s, int, stringParam, top)


type Route
    = Home
    | BlogList (Maybe String)
    | BlogPost Int
    | NotFound


routeMatcher : Url.Parser (Route -> a) a
routeMatcher =
    Url.oneOf
        [ Url.map Home top
        , Url.map BlogList (s "blog" <?> stringParam "search")
        , Url.map BlogPost (s "blog" </> int)
        ]


parseLocation : Location -> Route
parseLocation location =
    case (Url.parsePath routeMatcher location) of
        Just route ->
            route

        Nothing ->
            NotFound
