module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

newtype WordList =
  WordList [String]
  deriving (Eq, Show)

data Puzzle =
  Puzzle String [Maybe Char] [Char]

data Guess = CorrectGuess Char | IncorrectGuess Char

instance Show Puzzle where
  show (Puzzle _ discovered guessed) =
    (intersperse ' ' $
      fmap renderPuzzleChar discovered)
    ++ " Incorrect guesses: " ++ guessed

minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9

allWords :: IO WordList
allWords = do
  dict <- readFile "data/dict.txt"
  return $ WordList (lines dict)

gameWords :: IO WordList
gameWords = do
  (WordList aw) <- allWords
  return $ WordList (filter gameLength aw)
    where gameLength w =
            let l = length (w :: String)
            in      l >= minWordLength
                 && l < maxWordLength

-- we have to use IO here because
-- of the call to randomRIO; we say
-- IO String because the function ultimately
-- returns a string
randomWord :: WordList -> IO String
randomWord (WordList wl) = do
  randomIndex <- randomRIO (0, gwLength)
  return $ wl !! randomIndex
  where gwLength = length wl - 1

-- interesting note: we have to propogate the
-- monadic type IO because we ultimately make
-- use of allWords, which has a side effect.
randomWord' :: IO String
randomWord' = gameWords >>= randomWord
--            gameWords :: IO WordList
--            randomWord :: WordList -> IO String
--            gameWords >>= randomWord will
--              bind the WordList returned from gameWords
--              to the first argument of randomWord

freshPuzzle :: String -> Puzzle
freshPuzzle str = Puzzle str freshNothings []
  where freshNothings = fmap (const Nothing) str

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle solution _ _) guess =
  elem guess solution

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) guess =
  elem guess guessed

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing  = '_'
renderPuzzleChar (Just x) = x

fillInCharacter :: Puzzle -> Guess -> Puzzle
fillInCharacter (Puzzle word filledInSoFar guesses) (IncorrectGuess c) =
  Puzzle word filledInSoFar (guesses ++ [c])

fillInCharacter (Puzzle word filledInSoFar guesses) (CorrectGuess c) =
  Puzzle word newFilledInSoFar guesses
    where zipper guessed wordChar guessChar =
            if wordChar == guessed
            then Just wordChar
            else guessChar
          newFilledInSoFar =
            zipWith (zipper c) word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guess that, pick something else!"
      return puzzle
    (True, _) -> do
      putStrLn "You guessed a letter!"
      return (fillInCharacter puzzle (CorrectGuess guess))
    (False, _) -> do
      putStrLn "Nope, try again"
      return (fillInCharacter puzzle (IncorrectGuess guess))

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) =
  if (length guessed) > 7 then
    do putStrLn "You lose!"
       putStrLn $
         "The word was: " ++ wordToGuess
       exitSuccess
  else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) =
  if all isJust filledInSoFar then
    do putStrLn "You win!"
       exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameOver puzzle
  gameWin puzzle
  putStrLn $
    "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess <- getLine -- [Char]
  -- Question: I'm presuming `[c]` is how you pattern-match on a monadic value?
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _   ->
      putStrLn "Your guess must be a single character"


main :: IO ()
main = do
  word <- randomWord'
  putStrLn $ "(word is " ++ word ++ ")"
  let puzzle =
        freshPuzzle (fmap toLower word)
  runGame puzzle
