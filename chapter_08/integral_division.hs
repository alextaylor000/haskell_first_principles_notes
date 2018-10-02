module IntegralDiv where

-- `type` creates a type alias
type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

-- we want to call this function from the outside with 2 arguments,
-- but we need a third argument to keep track of the quotient (how
-- many times we've divided). we can use `where` to define a nested
-- function that accepts three arguments and implements the actual
-- division algorithm.
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise =
             go (n - d) d (count + 1)


