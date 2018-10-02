module MyAbs where

myAbs :: Integer -> Integer
myAbs x =
  if x > 0
     then x
     else abs x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))
