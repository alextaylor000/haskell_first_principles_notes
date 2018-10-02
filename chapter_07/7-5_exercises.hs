module CasePractice where

-- 1.
-- functionC x y = if (x > y) then x else y
functionC :: (Ord a) => a -> a -> a
functionC x y =
  case x > y of
    True  -> x
    False -> y

-- 2.
-- ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n =
  case even n of
    True -> n + 2
    _ -> n -- I could do `False` here as well

-- 3.
nums :: (Ord a, Num a, Num p) => a -> p
nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1
    EQ -> 0
