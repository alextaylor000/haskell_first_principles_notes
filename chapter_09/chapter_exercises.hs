module ChapterExercises where

import Data.Char

-- p 339
stripLower :: String -> String
stripLower x = filter isUpper x

capFirst :: String -> String
capFirst (x:xs) = toUpper x : xs

capAll :: String -> String
capAll [] = []
capAll (x:xs) = toUpper x : capAll xs

firstCapped :: String -> Char
-- firstCapped x = toUpper . head $ x
firstCapped x = head (capFirst x)


