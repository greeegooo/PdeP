-- Guia 1 Ejercicios Basicos

esMultiploDeTres x = mod x 3 == 0

esMultiploDe x y = mod x y == 0

cubo x = x * x * x

area x y = x * y

--

esBisiesto x = esMultiploDe x 400 || (esMultiploDe x 4 && not(esMultiploDe x 100))

dispersion x y z = max x (max y z) - min x (min y z)

diasParejos x y z = (dispersion x y z) < 30 

diasLocos x y z = (dispersion x y z ) > 100

diasNormales x y z = not(diasParejos x y z) && not(diasLocos x y z) 

pesoPino x | x < 300 = x * 3
           | otherwise = (x - 300) * 2 + 900

-- Ejercicio Mumuki Cuantas Muzzas

data Tuit = Tuit String String

cuantosHay [] = 0
cuantosHay (x:xs) = 1 + cuantosHay xs

cuantasPorciones [] = 0  
cuantasPorciones (x:xs) | fst x == "muzza" = snd x + cuantasPorciones xs | otherwise = cuantasPorciones xs 

cuantasMuzzas (x:xs) = ceiling (cuantasPorciones (x:xs) / 8)

-- Guia 1 Ejercicios

snd3 (a,b,c) = b

aplicar fn1 fn2 x = ((fn1 x),(fn2 x))

-- La posta 

data Curso = Curso { codigo::String , alumnos::[Alumno]}

data Materia = Materia { cursos::[Curso], id::String, año::Integer}

data Alumno = Alumno { nombre::String, notas::[Integer]}

type Carrera = [Materia]













