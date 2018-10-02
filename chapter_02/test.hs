sayHello :: String -> IO ()
sayHello x =
  putStrLn ("Hello, " ++ x ++ "!")

triple x = x * 30

times_pi_squared num = pi * (num * num)
