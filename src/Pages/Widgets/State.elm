module Pages.Widgets.State exposing (..)


type alias Id =
    String


type alias Name =
    String


type alias HexCode =
    String


type alias Widget =
    { id : Id
    , name : Name
    , hexCode : HexCode
    }


type Msg
    = ShowWidgets
    | ShowWidget Id
    | AddWidget Name HexCode
