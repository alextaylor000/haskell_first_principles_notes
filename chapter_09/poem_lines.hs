module PoemLines where

split :: String -> Char -> [String]
split x char
  | x == headWord x = x : []
  | otherwise       = headWord x : split (tailWords x) char
  where
    headWord n  = takeWhile (/= char) n
    tailWords n = drop 1 $ dropWhile (/= char) n


firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
\ symmetry?"

sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
-- putStrLn sentences -- should print
     -- Tyger Tyger, burning bright
     -- In the forests of the night
     -- What immortal hand or eye
     -- Could frame thy fearful symmetry?

myLines :: String -> [String]
myLines x = split x '\n'

shouldEqual =
       [ "Tyger Tyger, burning bright"
       , "In the forests of the night"
       , "What immortal hand or eye"
       , "Could frame thy fearful symmetry?"
       ]
-- The main function here is a small test -- to ensure you've written your function -- correctly.
main :: IO ()
main = print $
       "Are they equal? "
       ++ show (myLines sentences == shouldEqual)
