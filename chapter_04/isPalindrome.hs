module IsPalindrome where

-- why do we need (Eq a)?
-- because we're calling == in the function,
-- so we need to make sure that `a` is comparable,
-- and we need it to be a list so that reverse
-- can work on it
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x =
  x == (reverse x)

