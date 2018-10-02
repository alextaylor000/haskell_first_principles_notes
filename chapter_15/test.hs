{-# LANGUAGE FlexibleInstances #-}

module Test where
import Data.Monoid


-- instance Monoid a => Monoid (a -> a) where
--   mempty = id
--   mappend = (.) -- compose the arguments to `mappend`

-- func1 :: Int -> Sum
func1 = Sum . (+1)

-- func2 :: Int -> Sum
func2 a = Sum (a *10)


newtype Message a = Message a deriving Show

instance Monoid (Message String) where
  mempty = Message ""
  mappend (Message a) (Message b) = Message $ a ++ reverse b


