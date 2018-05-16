module PuniosDePuria where
import Text.Show.Functions
-- 1
-- a)

data Peleador = Peleador {
	vida::Int, 
	resistencia::Int, 
	ataques::[Ataque]} deriving (Show)

type Ataque = Peleador -> Peleador

pMuerto = Peleador 0 0 []

-- b)
estaMuerto::Peleador->Bool
estaMuerto p = (vida p) < 1

esHabil::Peleador->Bool
esHabil p = length (ataques p) > 10

-- c)

golpe::Int->Ataque
golpe intensidad p = reducirVida (intensidad `div` (resistencia p)) p

reducirVida::Int->Ataque
reducirVida daño p = Peleador ((vida p) - daño) (resistencia p) (ataques p)

patada::String->Ataque
patada "el pecho" p | not(estaMuerto p) = reducirVida 10 p
                    | otherwise = reducirVida (-1) p

patada "la carita" p = reducirVida ((vida p) `div` 2) p 

patada "la nuca" p = Peleador (vida p) (resistencia p) (tail (ataques p))

patada _ p = p

toqueDeLaMuerte::Ataque
toqueDeLaMuerte p = reducirVida (vida p) p

triplePatada::Ataque
triplePatada = (patada "la carita") . (patada "la carita") . (patada "la carita")

-- d)

bruceLee = Peleador 200 25 [toqueDeLaMuerte, golpe 500, triplePatada]


-- 2

f _ _ [x] = x
f g p (x:y:xs) | (g.x) p < (g.y) p = f g p (x:xs)
               | otherwise = f g p (y:xs)

-- 3

-- a)

terrible::Ataque->[Peleador]->Bool
terrible a ps = length (filter (not.estaMuerto) (map a ps)) < length ps

peligroso::Peleador->[Peleador]->Bool
peligroso p os = foldr  (flip (terrible os))  

golpear a p = a p

invencible::Peleador->[Peleador]->Bool
invencible p os = vida (foldr golpear p (losMejoresAtaques p os)) == vida p

losMejoresAtaques::Peleador->[Peleador]->[Ataque]
losMejoresAtaques p ps = map (\o -> f vida p (ataques o)) ps 
















