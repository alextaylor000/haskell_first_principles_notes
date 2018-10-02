module Chapter16 where

import Test.QuickCheck

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Eq (f c), Functor f) =>
                       (a -> b)
                    -> (b -> c)
                    -> f a
                    -> Bool
functorCompose f g x =
  (fmap g (fmap f x)) == (fmap (g . f) x)

-- p 699
incIfRight :: Num a => Either e a -> Either e a
incIfRight = fmap (+1)

incIfRight' :: (Num a, Functor f) => f a -> f a
incIfRight' = fmap (+1)

-- p 711

-- can we make a Functor for:
-- data Bool = False | True
--   no, because there's only structure, no values

data BoolAndSomethingElse a =
  False' a | True' a
  deriving (Eq, Show)

-- Question: if we wanted to QuickCheck these, I think we'd need
-- a generator for BoolAndSomethingElse right?
instance Functor BoolAndSomethingElse where
  fmap f (False' a) = False' (f a)
  fmap f (True' a)  = True' (f a)

qcBoolAndSomethingElse :: (BoolAndSomethingElse Int) -> Bool
qcBoolAndSomethingElse  x = functorIdentity x



-- p 712
-- we started with `data Sum a b ...`
data Sum b a = First a | Second b
-- we have to pass `b` first, because in the instance below
-- we're defining `fmap f (Second b)` as passing
-- it through untouched; so this must be because `b` is part
-- of our Functor instance
--
-- `Sum b a` has kind * -> * -> *, but to define a Functor
-- instance we have to apply away one of the types to get * -> *
-- So, we apply the first argument. But because of this,
-- we're unable to touch the first argument to the type,
-- because it's part of the Functor.
-- p. 689 has a great explanation of this

instance Functor (Sum b) where
  fmap f (First a)  = First (f a)
  fmap f (Second b) = Second b


