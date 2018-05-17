module Clase_9 where

class BasicEq a where 
    isEqual, isNotEqual    :: a -> a -> Bool
    isEqual x y = not (isNotEqual x y)
    isNotEqual x y = not (isEqual x y)

instance BasicEq Bool where
    isEqual True True   = True
    isEqual False False = True
    isEqual _     _     = False

data Color = Red | Green | Blue 
-- deriving Show
instance Show Color where
    show Red   = "Red"
    show Blue  = "Blue"
    show Green = "Green"

instance BasicEq Color where
    isEqual Red   Red   = True
    isEqual Blue  Blue  = True
    isEqual Green Green = True
    isEqual _     _     = False 

data Micro = Micro {
    nombre :: String
}



m1 = Micro "pepe"
m2 = Micro "pepe"







Ansiosa
masUno x = x + 1
   masUno (2*3)
     masUno 6 
       6 + 1
         7




