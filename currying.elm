import Html exposing (text)

main = text (toString (curriedQuadruple 2))

curriedQuadruple : Int -> Int
curriedQuadruple number =
  double (double number)

quadruple : Int -> Int
quadruple number =
  multiply number 4

-- here is the currying in action
-- the multiply function is being "partially applied"
-- the return value of double is actually a function
double : Int -> Int
double =
  multiply 2

multiply : Int -> Int -> Int
multiply multiplier number =
  number * multiplier
