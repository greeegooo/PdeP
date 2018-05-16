module TierraDeBarbaros where
import Data.Char
-- Punto 1 
data Barbaro = Barbaro {nombre::String, fuerza::Int, skills::[String],objetos::[Objeto]}
type Objeto = Barbaro -> Barbaro 

-- Objetos
espada peso barbaro = Barbaro (nombre barbaro) ((fuerza barbaro) + 2*peso) (skills barbaro) (objetos barbaro)

amuletosMisticos barbaro = Barbaro (nombre barbaro) (fuerza barbaro) ("puerco-marranos":(skills barbaro)) (objetos barbaro)

varitasDefectuosas barbaro = Barbaro (nombre barbaro) (fuerza barbaro) ("hacer magia":(skills barbaro)) (varitasDefectuosas:[])

ardilla barbaro = barbaro

cuerda obj1 obj2 = obj1.obj2

-- Ejemplos de barbaros
dave = Barbaro "Dave" 100 ["tejer","escribirPoesia","tejer"] [ardilla,espada 10]

candy = Barbaro "Candy" 100 ["artes marciales"] []

fang = Barbaro "Fang" 40 ["No es un mono!"] [amuletosMisticos]

faffy = Barbaro "Faffy" 100 ["Escribir Poesia Atroz"] []

astro = Barbaro "Astro" 100 ["Robar","Robar"] [ardilla,ardilla]

muerto = Barbaro "Muerto" 0 [] []

-- Punto 2 
megafono barbaro = Barbaro (nombre barbaro) (fuerza barbaro) ((((map toUpper).(concat.skills)) barbaro):[]) (objetos barbaro)

megafonoBarbarico = cuerda ardilla megafono

-- Punto 3
-- Eventos
invasionDeSuciosDuendes barbaro | any ("Escribir Poesia Atroz"==) (skills barbaro) = barbaro | otherwise = muerto

cremalleraDelTiempo barbaro | (nombre barbaro) == "Faffy" || (nombre barbaro) == "Astro" = barbaro | otherwise = muerto

ritualDeFechorias barbaro | saqueo barbaro || gritoDeGuerra barbaro || caligrafia barbaro = barbaro | otherwise = muerto

-- sub eventos
saqueo barbaro = ((&& (fuerza barbaro) > 80) . any ("Robar"==) . skills) barbaro 

gritoDeGuerra barbaro = (> ((*4).length.objetos) barbaro) . length . concat . skills)  barbaro

caligrafia barbaro | all (cumpleEstandar) (skills barbaro) = True | otherwise = False

--auxiliares 
esVocal = flip elem ['a','e','i','o','u']

cantVocales cadena = length (filter (True==) (map esVocal cadena))

cumpleEstandar habilidad = (cantVocales habilidad) > 3 && isUpper (head habilidad)

-- Ej de aventuras
aventura1 = invasionDeSuciosDuendes.cremalleraDelTiempo

aventura2 = ritualDeFechorias.cremalleraDelTiempo

-- Sobrevivientes
barbaros = [dave,candy,fang,faffy,astro]
sobrevivientes aventura = map aventura 

-- Punto 4 Dinastia
-- Sin repetir
sinRepetidos [] = []
sinRepetidos (x:xs) | not(elem x xs) = x:(sinRepetidos xs) | otherwise = sinRepetidos xs

-- Descendientes 

descendiente barbaro = Barbaro ((nombre barbaro)++"*") (fuerza barbaro) (skills barbaro) (objetos barbaro)




















