module BuildingFunctions where

snipOne :: String -> String
snipOne x = drop 1 x

exclaim :: String -> String
exclaim x = (++) x "!"

-- I had String -> String here before and
-- got an error, because I'm actually
-- returning a Char (just one letter)
snipToFour :: String -> Char
snipToFour x = x !! 4

dropLots :: String -> String
dropLots x = drop 9 x

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = inputString !! (x - 1)
  where inputString = "Curry is awesome!"

-- nice, Haskell will complain if you define
-- a type signature without binding it!
-- curryIsAwesome :: String

rvrs :: String
rvrs = awesome ++ " " ++ is ++ " " ++ curry
  where curry   = take 5 curryIsAwesome
        is      = drop 6 (take 8 curryIsAwesome)
        awesome = drop 9 curryIsAwesome
        curryIsAwesome = "Curry is awesome"

