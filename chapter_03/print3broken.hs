
module Print3Broken where

greeting :: String
greeting = "Hello"

-- printSecond :: String -> IO ()
-- printSecond greeting =
--   putStrLn greeting

printSecond :: IO ()
printSecond = do
  putStrLn greeting

printTwoThings :: String -> String -> IO()
printTwoThings x y =
  putStrLn (x ++ " " ++ y)

main :: IO ()
main = do
  putStrLn greeting
  printSecond
    -- where greeting = "Yarr"

