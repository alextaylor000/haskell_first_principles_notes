module Vehicles where

data Price = Price Integer
  deriving (Eq, Show)

data Size = Small | Large
  deriving (Eq, Show)

data Manufacturer =
      Mini
    | Mazda
    | Tata
      deriving (Eq, Show)

data Airline =
      PapuAir
    | CatapultsR'Us
    | TakeYourChancesUnited
      deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size
  deriving (Eq, Show)

---

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir Small

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar (Plane _ _) = False

isPlane :: Vehicle -> Bool
isPlane (Car _ _) = False
isPlane (Plane _ _) = True

areCars :: [Vehicle] -> [Bool]
areCars xs = map (\a -> isCar a) xs

areCarsF :: [Vehicle] -> [Bool]
areCarsF xs = foldr (\a b -> isCar a : b) [] xs

getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
-- Question: what's a good way to handle passing
-- in a plane?


