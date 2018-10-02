module Main where

import Hello ( sayHello )
import qualified DogsRule as DR
import System.IO (hSetBuffering, stdout, BufferMode(..))

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Please input your name: "
  name <- getLine
  sayHello name
  DR.dogs
