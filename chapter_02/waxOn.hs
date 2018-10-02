module WaxOn where

z = 7
waxOn = x * 5
  where x = y ^ 2
y = z + 8

triple x = x * 3

waxOff x = triple x

waxSide x =
  triple x
  + 1

waxWax x = (triple (triple x))
