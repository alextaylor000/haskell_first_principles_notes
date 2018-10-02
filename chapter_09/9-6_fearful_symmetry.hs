module Exercises96 where

myWords :: String -> [String]
myWords x
  | x == headWord x = [x]
  | otherwise       = headWord x : myWords (tailWords x)
  where
    headWord  = takeWhile (/= ' ')
    tailWords = drop 1 . dropWhile (/= ' ')

