import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias Metric =
  { value : Int
  , year : Int
  }

type alias Model =
  { metrics : List Metric }

model : Model
model =
  Model
    [ Metric 210394680 2010
    , Metric 740276402 2011
    , Metric 986737865 2012
    , Metric 872356504 2013 ]


-- UPDATE

type Msg
    = Value Int

update : Msg -> Model -> Model
update msg model =
  model

formatMetric : Metric -> Metric
formatMetric metric =
  let
    oneThousand = 1000
    oneMillion = oneThousand * oneThousand
    oneBillion = oneMillion * oneThousand
  in
    if metric.value > oneBillion then
      { metric | value = (metric.value // oneBillion)}
    else if metric.value > oneMillion then
      { metric | value = (metric.value // oneMillion)}
    else
      metric

formatMetrics : Model -> Model
formatMetrics model =
  { model | metrics = List.map formatMetric model.metrics }

-- VIEW

getTableRow : Metric -> Html Msg
getTableRow metric =
  tr []
    [ td [] [text (toString metric.value)]
    , td [] [text (toString metric.year)]]

getTable : Model -> String -> Html Msg
getTable model cap =
  table []
    (List.append
    [ caption [] [text cap, tr [] [td [] [text "Value"], td [] [text "Year"]]] ]
    (List.map getTableRow model.metrics))

view : Model -> Html Msg
view model =
  div []
  [ getTable model "Original Metrics"
  , br [] []
  , getTable (formatMetrics model) "Formatted Metrics"
  ]
