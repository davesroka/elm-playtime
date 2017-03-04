module Routing exposing (..)

import UrlParser as Url exposing ((</>), (<?>), s, int, stringParam, top)

type Route
    = Home
    | BlogList (Maybe String)
    | BlogPost Int


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map BlogList (s "blog" <?> stringParam "search")
        , Url.map BlogPost (s "blog" </> int)
        ]
