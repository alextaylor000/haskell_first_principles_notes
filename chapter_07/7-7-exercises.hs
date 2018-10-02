module Exercises77 where

-- 1., 2.
avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | otherwise = '-'
  | y>=0.9 ='A'
  | y>=0.8 ='B'
  | y>=0.7 ='C'
  | y >= 0.59 = 'D'
  | y< 0.59='F'
  where y = x / 100

-- 3., 4, 5
pal :: Eq a => [a] -> Bool
pal xs
  | xs == reverse xs = True
  | otherwise        = False

-- 6.
numbers :: (Ord a, Num a) => a -> a
numbers x
  | x < 0  = -1
  | x == 0 = 0
  | x > 0  = 1


-- p. 290
f :: Int -> [Int] -> Int
-- f z xs = foldr (+) z xs

-- in pointfree:
f = foldr (+)
