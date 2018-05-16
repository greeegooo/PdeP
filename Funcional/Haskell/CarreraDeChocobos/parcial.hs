module Warrrk where

data Chocobo = Chocobo {fuerza::Int, peso::Int, velocidad::Int} deriving (Show,Eq)
data Tramo = Tramo {distancia::Int, correccionDeVelocidad::Chocobo->Int}

type Pista = [Tramo]

f1 chocobo = velocidad chocobo * 2

f2 chocobo = velocidad chocobo + fuerza chocobo

f3 chocobo = velocidad chocobo `div` peso chocobo



tramo1 = Tramo 100 f1

bosqueTenebroso::Pista
bosqueTenebroso = [tramo1]

--bosqueTenebroso = [(100, f1), (50, f2), (120, f2), (200, f1), (80, f3)]

pantanoDelDestino = [(40, f2), (90, (\chocobo-> fuerza chocobo + peso chocobo + velocidad chocobo)), (120, fuerza), (20, fuerza)]

amarillo = Chocobo 5 3 3
negro = Chocobo 4 4 4
blanco = Chocobo 2 3 6
rojo = Chocobo 3 3 4

apocalipsis = [("Leo", amarillo), ("Gise", blanco), ("Mati", negro), ("Alf",rojo)]

quickSort _ [] = []
quickSort criterio (x:xs) = (quickSort criterio . filter (not . criterio x)) xs ++ [x] ++ (quickSort criterio . filter (criterio x)) xs


mayorSegun funcion val1 val2 = funcion val1 > funcion val2
menorSegun funcion val1 val2 = funcion val1 < funcion val2

tiempo chocobo tramo = fst tramo `div` (snd tramo) chocobo

tiempoTotal pista chocobo = sum (map (tiempo chocobo) pista) 

--podio jinetes pista = quickSort  