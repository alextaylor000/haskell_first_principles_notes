module IOStuff where

hola :: IO ()
hola = do
  putStrLn "hey!"
  putStrLn "a couple"
  putStrLn "prints"

holaBitter :: IO ()
holaBitter = putStrLn "hey!" >> putStrLn "a couple" >> putStrLn "bitter" >> putStrLn "prints"

holaBitterer :: IO ()
holaBitterer = putStrLn "hey!" >>= \_ -> putStrLn "a couple" >>= \_ -> putStrLn "bitterest..."

holaGet :: IO ()
holaGet = do
  name <- getLine
  putStrLn name
  putStrLn name
  putStrLn name

holaGetBitter :: IO ()
holaGetBitter = getLine >>= \name ->
                  putStrLn name >> putStrLn name >> putStrLn name

holapplicative :: IO ()
holapplicative = getLine >>= \name ->
                  putStrLn name *> putStrLn name *> putStrLn name

reverseGetLine :: IO String
reverseGetLine = (reverse <$> getLine)

reverseGetLineDo :: IO ()
reverseGetLineDo = do
  -- str :: [Char]
  str <- getLine
  putStrLn $ reverse str




