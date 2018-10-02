module Fibonacci where

fibonacci :: Integral a => a -> a

-- (1, 1, 2, 3, 5, 8)
-- fibonacci 6 == 8

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

-- fibonacci 6
-- fibonacci 6 = fibonacci (6 - 1)                     + fibonacci (6 - 2)
-- fibonacci 6 = fibonacci 5                           + fibonacci 4
-- fibonacci 6 = fibonacci (5 - 1) + fibonacci (5 - 2) + ...
-- fibonacci 6 = fibonacci 4       + fibonacci 3
-- fibonacci 6 = fibonacci (4 - 1) + fibonacci (4 - 2)
-- fibonacci 6 = fibonacci 3 + fibonacci 2
-- fibonacci 6 = fibonacci (3 - 1) + fibonacci (3 - 2)
-- fibonacci 6 = fibonacci 2 + fibonacci 1
-- fibonacci 6 = fibonacci (2 - 1) + fibonacci (2 - 2)
-- fibonacci 6 = fibonacci 1 + fibonacci 0
-- fibonacci 6 = 1 + 0
-- fibonacci 6 = 1                                     + 
