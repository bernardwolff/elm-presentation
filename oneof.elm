import Html exposing (text)


-- Maybe.oneOf was removed in Elm 0.18
-- here's my (bgw) implementation of it

oneOf : List (Maybe a) -> Maybe a
oneOf list =
  case list of
    head :: rest ->
      case head of
        Just value ->
          Just value
        Nothing ->
          oneOf rest
    [] ->
      Nothing

main =
  text (toString [
    oneOf [Nothing, Just "dog", Just "cat"],
    oneOf [Nothing, Nothing],
    oneOf [Just "apple", Just "pear", Nothing]
  ])
