module FstSnd where

fst' :: (f, g) -> f -- don't need to be a, b
fst' (a, b) = a

snd' :: (a, b) -> b
snd' (a, b) = b

tupFunc :: (Int, [a])
        -> (Int, [a])
        -> (Int, [a])
tupFunc (a, b) (c, d) = ((a + c), (b ++ d))

anotherTupFunc :: (Int, [a])
               -> Int
               -> Int
anotherTupFunc (a, b) c = a + c
