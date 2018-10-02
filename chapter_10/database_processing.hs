module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
  (fromGregorian 1911 5 1)
  (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
              (fromGregorian 1921 5 1)
              (secondsToDiffTime 34123))
  , DbNumber 42
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate x =
  foldr innerFilter [] x where
    innerFilter (DbDate i) acc = i : acc
    innerFilter _          acc = acc

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber x =
  foldr innerFilter [] x where
    innerFilter (DbNumber i) acc = i : acc
    innerFilter _ acc            = acc

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent x =
  maximum $ filterDbDate x

sumDb :: [DatabaseItem] -> Integer
sumDb x = sum $ filterDbNumber x

avgDb :: [DatabaseItem] -> Double
avgDb x = summed / count where
  summed = fromIntegral $ sumDb x
  count = fromIntegral (length $ filterDbNumber x)
