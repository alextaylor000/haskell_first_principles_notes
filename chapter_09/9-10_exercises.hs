module Exercises910 where

-- filtering
listComprehensionWay =
      [x | x <- [1..30], rem x 3 == 0]

filterWay = filter (\x -> rem x 3 == 0) [1..30]

-- lengthOfFilter [1..30]
lengthOfFilter = length . filter (\x -> rem x 3 == 0)
