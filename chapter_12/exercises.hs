module Exercises where
import Data.List

-- r :: a -> f a
-- What are the kinds of a and f?
--
-- a has to be concrete? So:
--  *
-- f is a Functor I believe, so:
-- :k Functor 
--   (* -> *) -> Constraint

notThe :: String -> Maybe String
notThe x =
  case x == "the" of
    True -> Nothing
    False -> Just x

replaceThe :: String -> String
replaceThe input = unwords inputWithA
  where
    inputWithA       = foldr replaceThe [] inputList
    replaceThe x acc = case x of
                         Just a  -> a : acc
                         Nothing -> "a" : acc
    inputList        = map notThe $ words input

isVowel :: Char -> Bool
isVowel x =
  case find (\a -> a == x) "aeiou" of
    Just a  -> True
    Nothing -> False

isConsonant :: Char -> Bool
isConsonant x =
  case find (\a -> a == x) "bcdfghjklmnpqrstvwxyz" of
    Just a -> True
    Nothing  -> False


-- Question: can I use 'foldr' or a Maybe type here to make things nicer?
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel x = countIt (words x) 0
  where
  countIt :: [String] -> Integer -> Integer
  countIt [] acc     = acc
  countIt (x:xs) acc =
    case x == "the" of
      True  -> countIt xs acc + (acc + (testVowel $ head $ head xs))
      False -> countIt xs acc
    where
      testVowel c = case isVowel c of
                      True  -> 1
                      False -> 0

filterVowels :: String -> String
filterVowels str = foldr filterVowel "" str
  where
    filterVowel x acc = case isVowel x of
                          True  -> x : acc
                          False -> acc

filterConsonants :: String -> String
filterConsonants str = foldr filterConsonant "" str
  where
    filterConsonant x acc = case isConsonant x of
                              True  -> x : acc
                              False -> acc

countVowels :: String -> Integer
countVowels str = toInteger $ length $ filterVowels str

-- Validate the word
newtype Word' = Word' String deriving (Eq, Show)

mkWord :: String -> Maybe Word'
mkWord str =
  case validatesWord str of
    True  -> Just (Word' str)
    False -> Nothing
  where
    validatesWord x = length vowelsInStr <= length consonantsInStr
    vowelsInStr     = filterVowels str
    consonantsInStr = filterConsonants str

data Nat = Zero | Succ Nat deriving (Eq, Show)
-- >>> natToInteger Zero
-- 0
-- >>> natToInteger (Succ Zero)
-- 1
-- >>> natToInteger (Succ (Succ Zero))
-- 2
natToInteger :: Nat -> Integer
natToInteger (Zero)   = 0
natToInteger (Succ a) = natToInteger a + 1

integerToNat :: Integer -> Maybe Nat
integerToNat x
  | x < 0     = Nothing
  | otherwise = Just $ natFor x
  where
    natFor x'
      | x' == 0    = Zero
      | otherwise  = Succ $ natFor $ x' - 1

isJust :: Maybe a -> Bool
isJust Nothing  = False
isJust (Just _) = True

isNothing :: Maybe a -> Bool
isNothing Nothing  = True
isNothing (Just _) = False
