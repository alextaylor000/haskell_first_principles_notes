module Exercises73 where
-- page 256

-- 1. all these are the same
mTh1 x y z = x * y * z
mTh2 x y = \z -> x * y * z
mTh3 x = \y -> \z -> x * y * z
mTh4 = \x -> \y -> \z -> x * y * z

-- 2.
-- > :t mTh1 3
-- mTh1 3 :: Num a => a -> a -> a


