module Factorial where

factorial :: Integer -> Integer
factorial 0 = 1 -- this is an identity function for multiplication
                -- because 1 * anything = itself
factorial n = n * factorial (n -1)


-- 8.3
f :: Bool -> Maybe Int
f False = Just 0
f _     = Nothing

