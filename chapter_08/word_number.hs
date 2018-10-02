module WordNumber where

import Data.List (intersperse)

-- 0 => "zero", 1 => "one", etc.
-- I could also do this with a list, like `["one", "two" ..] !! n`, but 
-- I think this version is actually more readable
-- reminds me of Ruby's Hash.to_proc
digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = error "whoops"

digits :: Int -> [Int]
digits n = go n []
  where go n result
          | n < 10    = reverse $ result ++ [n]
          | otherwise = go (div n 10) (result ++ [(mod n 10)])

-- 4567 => "four-five-six-seven"
wordNumber :: Int -> String
wordNumber n = concat . intersperse "-" . map digitToWord . digits $ n
