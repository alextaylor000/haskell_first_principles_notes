module Main where

import Control.Monad (forever)
import Data.List (intersperse)
import Test.Hspec

data Player = X | O deriving Eq
instance Show Player where
  show X = "X"
  show O = "O"

data Cell = Cell (Maybe Player) deriving Eq
instance Show Cell where
  show $ Cell (Just p) = show p
  show $ Cell Nothing  = "-"

-- TODO: what if we made this `Board [Cell]`
--       * we could get rid of boardToList and listToBoard
--       * we'd have to pattern-match in the `show` instance
data Board = Board { topLeft :: Cell,
                     topMid :: Cell,
                     topRight :: Cell,
                     midLeft :: Cell,
                     midMid :: Cell,
                     midRight :: Cell,
                     botLeft :: Cell,
                     botMid :: Cell,
                     botRight :: Cell
                   } deriving Eq

instance Show Board where
  show b = concat $ intersperse "\n" [top, mid, bot]
    where top = concat $ intersperse " " [show (topLeft b), show (topMid b), show (topRight b)]
          mid = concat $ intersperse " " [show (midLeft b), show (midMid b), show (midRight b)]
          bot = concat $ intersperse " " [show (botLeft b), show (botMid b), show (botRight b)]

boardToList :: Board -> [Cell]
boardToList b =
  [topLeft b, topMid b, topRight b, midLeft b, midMid b, midRight b, botLeft b, botMid b, botRight b]

listToBoard :: [Cell] -> Board
listToBoard [a, b, c, d, e, f, g, h, i] =
  Board a b c d e f g h i

insertMove :: Board -> Int -> Player -> Board
insertMove board pos p =
  listToBoard boardList where
    boardList = h ++ [newMove] ++ (tail t)
    (h, t)    = splitAt pos $ boardToList board
    newMove   = Cell (Just p)

freshBoard :: Board
freshBoard = Board e e e
                   e e e
                   e e e
               where e = Cell Nothing

playersFromCells :: Cell -> Maybe Player
playersFromCells (Cell Nothing) = Nothing
playersFromCells (Cell (Just p)) = (Just p)

-- Question: this evaluates the whole list instead of
--           lazily returning once it encounters a Nothing.
--           Is there a better way?
determineWinner :: [Maybe Player] -> Maybe Player
determineWinner (x:xs) = foldr compareEach x xs where
  compareEach x acc = case (x == acc) of
                        True  -> x
                        False -> Nothing

isWinner :: [Cell] -> Maybe Player
isWinner xs = determineWinner $ fmap playersFromCells xs

getIntMove :: String -> Int
getIntMove "tl" = 0
getIntMove "tm" = 1
getIntMove "tr" = 2
getIntMove "ml" = 3
getIntMove "mm" = 4
getIntMove "mr" = 5
getIntMove "bl" = 6
getIntMove "bm" = 7
getIntMove "br" = 8
getIntMove _    = 0

nextPlayer :: Player -> Player
nextPlayer X = O
nextPlayer O = X

runGame :: Board -> Player -> IO ()
runGame board player = forever $ do
  putStrLn $ (show board) ++ "\n"
  putStr "> "
  move <- getLine
  let intMove = getIntMove move
  putStrLn $ "you entered: " ++ move
  runGame (insertMove board intMove player) (nextPlayer player)

main :: IO ()
main = do
  putStrLn "Welcome!\n"
  runGame freshBoard X

spec :: IO ()
spec = hspec $ do
  let n = Cell Nothing
      x = Cell (Just X)
      o = Cell (Just O)

  describe "insertMove" $ do
    it "returns a new board" $ do
      (insertMove freshBoard 3 X) `shouldBe` Board n n n x n n n n n
      (insertMove freshBoard 8 O) `shouldBe` Board n n n n n n n n o
      (insertMove freshBoard 0 X) `shouldBe` Board x n n n n n n n n

  describe "listToBoard" $ do
    it "converts a list of cells to a board" $ do
      (listToBoard [n, x, o, x, x, x, o, n, o]) `shouldBe` Board n x o x x x o n o
  describe "freshBoard" $ do
    it "prints the board" $ do
      (show freshBoard) `shouldBe` "- - -\n- - -\n- - -"

  describe "show cells" $ do
    it "prints the cells" $ do
      (show [Cell Nothing, Cell (Just X), Cell (Just O)]) `shouldBe` "[-,X,O]"

  describe "isWinner" $ do
    it "returns a player if all cells are identical" $ do
      let winX  = [Cell (Just X), Cell (Just X), Cell (Just X)]
          winO  = [Cell (Just O), Cell (Just O), Cell (Just O)]
          lose1 = [Cell Nothing, Cell (Just X), Cell (Just X)]
          lose2 = [Cell (Just X), Cell (Just X), Cell (Just O)]
      isWinner winX `shouldBe` (Just X)
      isWinner winO `shouldBe` (Just O)
      isWinner lose1 `shouldBe` Nothing
      isWinner lose2 `shouldBe` Nothing


