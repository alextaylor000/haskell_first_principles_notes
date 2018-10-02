module Addition where
import Test.Hspec
import Test.QuickCheck

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
  a <- arbitrary
  b <- arbitrary
  return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  return (a, b, c)

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise =
            go (n - d) d (count + 1)

recursiveMult :: (Eq a, Num a) => a -> a -> a
recursiveMult x y = go x y x where
  go x y acc
    | y == 1    = acc
    | otherwise = go x (y - 1) (acc + x)

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)

    it "1 + 1 is greater than 1" $ do
      (1 + 1) > 1 `shouldBe` True

    it "2 + 2 is equal to 4" $ do
      2 + 2 `shouldBe` 4

  describe "recursiveMult" $ do
    it "4 * 3 = 12" $ do
      recursiveMult 4 3 `shouldBe` 12

    it "4 * 1 = 4" $ do
      recursiveMult 4 1 `shouldBe` 4

  describe "dividedBy" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5, 0)

    it "22 divided by 5 is \
       \ 4 remainder 2" $ do
         dividedBy 22 5 `shouldBe` (4, 2)
