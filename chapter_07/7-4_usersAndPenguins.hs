module RegisteredUser where

newtype Username =
  Username String

newtype AccountNumber =
  AccountNumber Integer


data User =
  UnregisteredUser
    | RegisteredUser Username AccountNumber


printUser :: User -> IO ()
printUser UnregisteredUser =
  putStrLn "Unregistered user"

printUser (RegisteredUser
          (Username name)
          (AccountNumber acctNum)) =
            putStrLn $ name ++ " " ++ show acctNum

---

data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)


isSouthAfrica' :: WherePenguinsLive -> Bool
isSouthAfrica' SouthAfrica = True
isSouthAfrica' _ = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng location) = location

galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _                = False

antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _                 = False

galapagosOrAntarcticPenguin :: Penguin -> Bool
galapagosOrAntarcticPenguin p =
     (galapagosPenguin p)
  || (antarcticPenguin p)

---

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))
-- compare to:
-- f x y = ((snd x, snd y), (fst x, fst y))

