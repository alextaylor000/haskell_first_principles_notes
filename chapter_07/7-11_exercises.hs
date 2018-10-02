module Exercises711 where

-- 1. a polymorphic function d) may resolve to values of different types
-- 2. Two functions named f and g have types Char -> String and String -> [String] respectively.
--    the composed function g . f has the type Char -> [String]
-- 3. A function f has the type Ord a => a -> a -> Bool and we apply it to one numeric value.
--    (Ord a, Num a) => a -> Bool
-- 4. (a -> b ) -> c is a higher-order function. Question: how could this be implemented?


-- p 295 #1
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigitDivMod :: Integral a => a -> a
tensDigitDivMod x = fst $ divMod x 10

-- 2.
foldBool :: a -> a -> Bool -> a
foldBool x y z =
  case z of
    True -> x
    False -> y

foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard x y z
  | z == True  = x
  | z == False = y

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (applyF, c)
  where applyF = f a

