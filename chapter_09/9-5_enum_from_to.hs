module Exercises95 where

eftBool :: Bool -> Bool -> [Bool]
eftBool from to
  | from > to  = []
  | from == to = [from]
  | otherwise  = [from, to]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd from to
  | from > to  = []
  | from == to = [from]
  | otherwise  = from : (eftOrd (succ from) to)
-- eftOrd LT GT
-- | LT > GT = False
-- | LT == GT = False
-- | LT : (eftOrd EQ GT)
-- eftOrd EQ GT
-- | EQ > GT  = False
-- | EQ == GT = False
-- | EQ : (eftOrd GT GT)
-- eftOrd GT GT
-- | GT > GT = False
-- | GT == GT = [GT]
-- EQ : [GT]
-- [EQ, GT]
-- LT : [EQ, GT]
-- [LT, EQ, GT]

eftInt :: Int -> Int -> [Int]
eftInt from to
  | from > to  = []
  | from == to = [from]
  | otherwise  = from : (eftInt (succ from) to)

eftChar :: Char -> Char -> [Char]
eftChar from to
  | from > to  = []
  | from == to = [from]
  | otherwise  = from : (eftChar (succ from) to)
