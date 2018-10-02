module Chapter16 where

import Test.QuickCheck

-- p 699
incIfRight :: Num a => Either e a -> Either e a
incIfRight = fmap (+1)

incIfRight' :: (Num a, Functor f) => f a -> f a
incIfRight' = fmap (+1)

-- p 711

-- can we make a Functor for:
data Bool = False | True -- no, because there's only structure, no values

data BoolAndSomethingElse a =
  False' a | True' a
  deriving Show

instance Functor BoolAndSomethingElse where
  fmap f (False' a) = False' (f a)
  fmap f (True' a)  = True' (f a)


