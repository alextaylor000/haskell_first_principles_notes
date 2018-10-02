module IncorrectToCorrect where

-- x = (+)
-- F xs = w 'x' 1
-- where w = length xs

x = (+)
addOne xs = x w 1 where w = length xs

-- \X = x
id x = x

-- f (a b) = A
f (a, b) = a
