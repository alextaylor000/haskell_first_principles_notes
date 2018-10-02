module FoldImplementations where

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc []     = acc
myFoldr f acc (x:xs) = f x $ foldr f acc xs

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc []     = acc
myFoldl f acc (x:xs) = foldl f (f acc x) xs

-- foldr (+) 0 [1..3]
-- (+) 1 (foldr (+) 0 [2, 3])
-- (+) 1 ((+) 2 (foldr (+) 0 [3]))
-- (+) 1 ((+) 2 ((+) 3 (foldr (+) 0 [])))
-- (+) 1 ((+) 2 ((+) 3 (0)))
-- (+) 1 ((+) 2 3)
-- (+) 1 (5)
-- 6

-- foldl (+) 0 [1..3]
-- foldl (+) ((+) 0 1) [2, 3]
--        ^  ^^^^^^^^^ ^^^^^^
-- foldl (+) ((+) 1 2) [3]
-- foldl (+) ((+) 3 3) []
-- 6
