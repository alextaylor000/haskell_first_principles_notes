module Main where

import Data.Monoid
import Test.QuickCheck

monoidAssoc :: (Eq m, Monoid m)
            => m -> m -> m -> Bool
monoidAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                    => m
                    -> Bool
monoidRightIdentity a = (a <> mempty) == a

data Optional a = Nada | Only a deriving (Eq, Show)

newtype First' a =
  First' { getFirst :: Optional a }
  deriving (Eq, Show)

-- to make arbitrary values of First' types,
-- we ensure that whatever we pass to First'
-- has an instance of Arbitrary itself (like String)
--
-- then, we pull an arbitrary value out of `a`
-- and return either a proper First' value, or Nada
instance Arbitrary a =>
  Arbitrary (First' a) where
    arbitrary = do
      arby <- arbitrary
      frequency [(1, return $ First' (Only arby))
                ,(1, return $ First' Nada)]

instance Monoid (First' a) where
  mempty = First' Nada
  mappend (First' Nada) (First' Nada)     = First' Nada
  mappend (First' Nada) (First' (Only b)) = First' (Only b)
  mappend (First' (Only a)) _             = First' (Only a)

firstMappend :: First' a
             -> First' a
             -> First' a
firstMappend = mappend

type FirstMappend =
     First' String
  -> First' String
  -> First' String
  -> Bool

type FstId =
  First' String -> Bool

main :: IO ()
main = do
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: FstId)
  quickCheck (monoidRightIdentity :: FstId)
