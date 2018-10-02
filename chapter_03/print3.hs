module Print3 where



main = do
  putStrLn myGreeting
  putStrLn secondGreeting
    where secondGreeting =
            concat [hello, " ", world]

-- these can technically be anywhere in the file
main :: IO ()
myGreeting :: String
hello :: String
world :: String
myGreeting = "hello" ++ " world!"


hello = "hello"

world = "world!"
