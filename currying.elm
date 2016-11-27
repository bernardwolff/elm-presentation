import Html exposing (text)

main = text (toString (curriedQuadruple 2))

curriedQuadruple : Int -> Int
curriedQuadruple number =
  double (double number)

quadruple : Int -> Int
quadruple number =
  multiply number 4

double : Int -> Int
double number =
  multiply number 2

multiply : Int -> Int -> Int
multiply number multiplier =
  number * multiplier
