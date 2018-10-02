module Exercises911 where

compareZips xs xs' = (zip xs xs') == (myZip xs xs')

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (x':xs') = (x, x') : myZip xs xs'

-- myZip [1,2,3] [4,5,6]
-- (1, 4) : myZip [2,3] [5,6]
-- (1, 4) : (2, 5) : myZip [3] [6]
-- (1, 4) : (2, 5) : (3, 6) : myZip [] []
