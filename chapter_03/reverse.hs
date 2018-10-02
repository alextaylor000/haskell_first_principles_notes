module Reverse where

rvrs :: String -> String
rvrs x = awesome ++ " " ++ is ++ " " ++ curry
  where curry   = take 5 x
        is      = drop 6 $ take 8 x
        awesome = drop 9 x
        x = "Curry is awesome"

main :: IO ()
main = print $ rvrs "Curry is awesome"
