module MatchTheTypes where

-- Question: why does this not typecheck?
-- i :: a
-- i = 1

-- this doesn't compile, because the type isn't
-- specific enough; not all Nums can be represented
-- fractionally. Floats have an instance of Fractional,
-- which is why f :: Float, f :: Double or f :: Fractional a => a works
-- Float and Double are types; Fractional is a typeclass.
-- Float and Double both have instances of Fractional.
f :: Fractional a => a
f = 1.0

-- 7)
myX = 1 :: Int
-- we can't make this signature a -> a because we're returning
-- a concrete type (Int) in the function, and there's no guarantee
-- that `a` will be of type Int
sigmund :: Int -> Int
sigmund x = myX

-- 8)
-- this won't compile because myX is an Int, and Num is less specific.
-- while Int has an instance of Num, we can't guarantee that the supplied
-- Num value will have an instance of Int.
sigmund' :: Num a => a -> a
sigmund' x = myX

-- 11)
-- this won't compile for the same reason as 8. Our mySort function takes
-- a concrete type [Char], and we're trying to use a less constrained type
-- of Ord.
mySort :: [Char] -> [Char]; mySort = sort
signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)
