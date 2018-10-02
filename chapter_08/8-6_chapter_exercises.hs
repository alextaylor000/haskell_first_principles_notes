module Exercises86 where

-- 1. [[Bool]]
-- 2. b)
-- 3. d)
-- 4. b)
func :: [a] -> [a] -> [a]
func x y = x ++ y


cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- recursion #1
-- dividedBy 15 2
-- go 15 2 0
--   | 15 < 2 = False
--   | go (15 - 2) 2 (0 + 1)
-- go 13 2 1
--   | 13 < 2 = False
--   | go (13 - 2) 2 (1 + 1)
-- go 11 2 2
--   | 11 < 2 = False
--   | go (11 - 2) 2 (2 + 1)
-- go 9 2 3
--   | 9 < 2 = False
--   | go (9 - 2) 2 (3 + 1)
-- go 7 2 4
--   | 7 < 2 = False
--   | go (7 - 2) 2 (4 + 1)
-- go 5 2 5
--   | 5 < 2 = False
--   | go (5 - 2) 2 (5 + 1)
-- go 3 2 6
--   | 3 < 2 = False
--   | go (3 - 2) 2 (6 + 1)
-- go 1 2 7
--   | 1 < 2 = True
--   | (7, 1)

recursiveSum :: (Eq a, Num a) => a -> a
recursiveSum n = go n 1 1
  where go n num count
          | count == n = num
          | otherwise  = go n (num + count + 1) (count + 1)

-- recursiveSum 5
-- go 5 1 1
-- | 1 == 5 = False
-- | go 5 (1 + 1 + 1) (1 + 1)
-- go 5 3 2
-- | 2 == 5 = False
-- | go 5 (3 + 2 + 1) (2 + 1)
-- go 5 6 3
-- | 3 == 5 = False
-- | go 5 (6 + 3 + 1) (3 + 1)
-- go 5 10 4
-- | 4 == 5 = False
-- | go 5 (10 + 4 + 1) (4 + 1)
-- go 5 15 5
-- | 5 == 5 = True
-- | 15

recursiveMult :: (Integral a) => a -> a -> a
recursiveMult x y = go x y 0
  where go num count result
          | count == 0 = result
          | otherwise  = go num (count - 1) (result + num)

recursiveMultCase :: (Integral a) => a -> a -> a
recursiveMultCase x y = go x y 0
  where go num count result =
          case (count == 0) of
            True  -> result
            False -> go num (count - 1) (result + num)

-- recursiveMult 5 3 == 15
-- go 5 3 0
-- | 3 == 0 = False
-- | go 5 (3 - 1) (0 + 5)
-- go 5 2 5
-- | 2 == 0 = False
-- | go 5 (2 - 1) (5 + 5)
-- go 5 1 10
-- | 1 == 0 = False
-- | go 5 (1 - 1) (10 + 5)
-- go 5 0 15
-- | 0 == 0 = True
-- 15

data DividedResult =
    Result Integer
  | DividedByZero

instance Show DividedResult where
  show (Result a) = show a

-- TODO: implement ~~zero handling~~ and negative handling
-- Question: couldn't figure out dividing by negative
dividedBy :: Integer -> Integer -> DividedResult
dividedBy num denom
  | num == 0   = DividedByZero
  | denom == 0 = DividedByZero
  | otherwise  = go num denom 0
  where go n d count
          | n < d = Result count
          | otherwise =
              go (n - d) d (count + 1)


-- McCarthy 91
mc91 :: Integer -> Integer
mc91 n
  | n > 100   = n - 10
  | otherwise = mc91 . mc91 $ n + 11
