module Hello
  ( sayHello ) -- be explicit about module exports
  where

sayHello :: String -> IO ()
sayHello name =
  putStrLn ("Hi, " ++ name ++ "!")
