module Main exposing (..)

import Browser
import Html exposing (Html, div, input, node)
import Html.Attributes exposing (placeholder, property, value)
import Html.Events exposing (onInput)
import Json.Encode exposing (string)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { expression : String
    }


init : Model
init =
    { expression = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newExpression ->
            { model | expression = newExpression }



-- VIEW


viewMathInline : String -> Html msg
viewMathInline expression =
    node "math-inline"
        [ property "expression" (string expression) ]
        []


viewMathBlock : String -> Html msg
viewMathBlock expression =
    node "math-block"
        [ property "expression" (string expression) ]
        []


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Expression to LaTeX", value model.expression, onInput Change ] []
        , viewMathInline model.expression
        ]
