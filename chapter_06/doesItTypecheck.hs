module DoesItTypeCheck where

data Person = Person Bool
  -- must add deriving Show to get printPerson to typecheck
  deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


-- need to derive Eq since we use `== Woot` below
data Mood = Blah | Woot deriving (Eq, Show)

-- fun with instances :)
instance Num Mood where
  (+) _ _ = Blah
  (-) _ _ = Woot
  (*) _ _ = Woot
  abs _ = Woot
  signum  _ = Woot
  fromInteger _ = Woot

settleDown x = if x == Woot
                  then Blah
                  else x


-- yes, this typechecks, although
-- `s1` is the function s1 :: Object -> Sentence so it
-- needs one more value to resolve to a Sentence
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)
