module PartialFunction where

f :: Int -> Bool
f 2 = True
f _ = False -- unconditional case to ensure an exhaustive pattern-match

data OneToThree = (1 :: Int) | (2 :: Int)
