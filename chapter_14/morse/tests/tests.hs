module Main where

import qualified Data.Map as M
import Morse
import Test.QuickCheck

data Trivial =
  Trivial
  deriving (Eq, Show)


trivialGen :: Gen Trivial
trivialGen = return Trivial

instance Arbitrary Trivial where
  arbitrary = trivialGen

data Identity a =
  Identity a
  deriving (Eq, Show)

instance Arbitrary a =>
         Arbitrary (Identity a) where
  arbitrary = identityGen

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen


sampleTrivial :: IO ()
sampleTrivial = do
  sample trivialGen

allowedChars :: [Char]
allowedChars = M.keys letterToMorse

allowedMorse :: [Morse]
allowedMorse = M.elems letterToMorse

charGen :: Gen Char
charGen = elements allowedChars

morseGen :: Gen Morse
morseGen = elements allowedMorse

prop_thereAndBackAgain :: Property
prop_thereAndBackAgain =
  forAll charGen
  (\c -> ((charToMorse c) >>= morseToChar) == Just c)

main :: IO ()
main = quickCheck prop_thereAndBackAgain
