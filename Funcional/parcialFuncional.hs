-- Harry Potter y el Exámen de Funcional
-- PdeP - Exámen Funcional 14/06/18

import Text.Show.Functions

data Mago = Mago {
    nombre  ::String,
    edad    ::Int,
    salud   ::Int,
    hechizos::[Hechizo]
} deriving Show

data Academia = Academia {
    magos   ::[Mago],
    examen  ::Examen
} deriving Show

type Hechizo = Mago -> Mago
type Examen = Mago -> Bool

harry = Mago "Harry James Potter" 11 100 [curar 10, lanzarRayo]
ron = Mago "Ronald Bilius Weasly" 12 100 [confundir]
hermione = Mago "Hermione Jean Granger" 11 100 [curar 30, lanzarRayo, confundir, amnesia 3]
albus = Mago "Albus Percival Wulfric Brian Dumbledore" 116 9 [curar 100, lanzarRayo, amnesia 10, confundir, lanzarRayo, curar 50, avadaKedavra, crucius, imperius "", amnesia 1, curar 10]
voldemort = Mago "Tom Marvolo Riddle" 71 800 [avadaKedavra, crucius, imperius "Sangre Sucia"]

ingreso m = True
hogwarts = Academia [harry,ron,hermione,albus] ingreso

-- 1)
-- a) curar:: Int -> Hechizo
curar cant mago = mago { salud = salud mago + cant }

-- b) lanzarRayo:: Hechizo
lanzarRayo mago 
    | salud mago > 10 = daniar 10 mago
    | otherwise = daniar (salud mago `div` 2) mago

-- daniar:: Int -> Hechizo
daniar cant mago = mago { salud = salud mago - cant }

-- c) amnesia:: Int -> Hechizo
amnesia = olvidar

-- olvidar:: Int -> Hechizo
olvidar 0 mago = mago
olvidar cant mago = olvidar (cant - 1) (mago {hechizos = (tail . hechizos) mago})

-- d) confundir:: Hechizo
confundir mago = ((head . hechizos) mago) mago

-- 2)
-- a) poder:: Mago -> Int
poder mago = salud mago + edad mago * length (hechizos mago)

-- b) danio:: Mago -> Hechizo -> Int
danio mago hechizo = salud mago - salud (hechizo mago)

-- c) difDePoder:: Mago -> Mago -> Int
difDePoder m1 m2 = abs (poder m1 - poder m2)

-- 3) 
-- a) Saber si hay algun mago sin hechizo cuyo nombre sea "Rincenwind".
seLlama nom = (nom==) . nombre
esSinHechizo = null . hechizos
hayAlgunoSinHechizoLlamado nom = any (seLlama nom) . filter esSinHechizo . magos

-- b) Sabes si todos los magos viejos (>50) son ñoños. Esto ocurre si tienen mas hechizos que salud.
esNionio m = (length . hechizos) m > salud m
esViejo = (>50) . edad 
todosLosViejosSonNionios = all esNionio . filter esViejo . magos

-- c) Conocer la cantidad de magos que no pasarían el examen de ingreso si lo volvieran a rendir.
cuantosNoPasarianElIngreso academia = (length . filter (not . examen academia) . magos) academia

-- d) Averiguar la sumatoria de la edad de los amgos que saber más de 10 hechizos.
-- saber más de 10 hechizos es de grosos
--esGroso = (>10) . length . hechizos
--sumatoriaEdadDeGrosos = sum . map edad . filter esGroso . magos

sabenMasDe10 = filter ((>10) . length . hechizos)
sunEdadAcademia academia = sum (map edad ((sabenMasDe10 . magos) academia))

-- 4)
f _ _ [z] = z
f x y (z1:z2:zs) 
    | x y z1 >= x y z2 = f x y (z1:zs)
    | otherwise = f x y (z2:zs)

-- a) Solución
-- f:: Ord c => (b -> a -> c) -> b -> [a] -> a

-- b) ...

-- c) 
-- mejorHechizoContra:: Mago -> Mago -> Hechizo
mejorHechizoContra m1 m2 = f danio m1 (hechizos m2)

-- mejorOponente:: Mago -> Academia -> Mago
mejorOponente mago academia = f difDePoder mago (magos academia)

-- 5) 
-- a) noPuedeGanarle:: Mago -> Mago -> Bool
noPuedeGanarle m1 m2 = salud m1 == salud (foldl (flip ($)) m1 (hechizos m2))

-- b) laTieneDeHija:: Academia -> Academia -> Bool
laTieneDeHija a1 = all ((noPuedeGanarle . head . magos) a1) . magos 

-- BONUS TRACK
-- Avada Kedavra: Este hechizo reduce a 0 la vida de cualquier mago, excepto si eres Harry James Potter
-- avadaKedavra:: Hechizo
avadaKedavra mago 
    | nombre mago == "Harry James Potter" = mago
    | otherwise = daniar (salud mago) mago

-- Imperius: Este hechizo cambia el nombre del mago sobre el que se lanza y hace que olvide todos sus hechizos
-- imperius:: String -> Hechizo
imperius nuevoNombre mago = mago { nombre = nuevoNombre, hechizos = [] }

-- Crucius: Deja en 1 la vida del mago al que se lanza y elimina todos los hechizos que curen mas de 1 de vida 
-- crucius:: Hechizo
crucius mago = mago { salud = 1, hechizos = (sinCuraciones (hechizos mago) mago) }
sinCuraciones [] _ = []
sinCuraciones (h:hs) mago
    | salud (h mago) > salud mago = sinCuraciones hs mago
    | otherwise = h : (sinCuraciones hs mago)

