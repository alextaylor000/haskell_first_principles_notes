module Arith4 where

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
  print (roundTrip 4)
  print (id 4)

roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

-- Question: can't figure this one out (p 297)
roundTrip2 :: (Show a, Read b) => a -> b
roundTrip2 a = (read (show a))

