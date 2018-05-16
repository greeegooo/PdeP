module TP where
import Text.Show.Functions
import Data.List

--instance Show (a -> b) where show f = "<una función>"
-- Punto 1
-- Modelo del tipo de dato cliente.
-- Utilizamos un data porque nos genera automaticamente funciones para acceder a los valores del tipo definido, facilitando la composicion de funciones y la declaratividad en el codigo

-- Se agrega un nuevo campo : tomadas::[Cliente -> Cliente]
data Cliente = Cliente { nombre::String, resistencia::Int, amigos::[Cliente], tomadas::[Cliente->Cliente]} deriving (Show)

-- Punto 2
-- Modelelado de los amigos 

-- Agregamos el nuevo campo a los clientes 
rodri = Cliente "Rodri" 55 [] [tintico]
marcos = Cliente "Marcos" 40 [rodri] [klusener "guinda"]
cristian = Cliente "Cristian" 2 [] [grogXD,jarraLoca]
ana = Cliente "Ana" 120 [marcos,rodri] []
robertoCarlos = Cliente "Roberto Carlos" 165 [] []


-- Punto 3
-- Desarrollo de la funcion comoEsta
comoEsta cliente | (resistencia cliente) > 50 = "Fresco" | (length (amigos cliente)) > 1 = "Piola" | otherwise = "Duro" 

-- Punto 4
-- funciones para reconocer y agregar amigos
-- Cambiamos el nombre de esta funcion
compararNombre cli = (nombre cli==).nombre

-- Dejamos de usar esto 
-- esAmigo cli = (any (cli==)).amigos

-- Empezamos a comparar por nombre
puedoAgregarAmigo cli cliente = not(compararNombre cli cliente) && not(any (compararNombre cli) (amigos cliente))

agregarAmigo cli cliente | puedoAgregarAmigo cli cliente = cambiarAmigos (cli:(amigos cliente)) cliente | otherwise = cliente

-- Punto 5 
-- Representacion de las bebidas
--Las bebidas ahora se agregan a la lista de tomadas (estan comentadas las funciones de antes)

--grogXD cliente = Cliente (nombre cliente) 0 (amigos cliente)
grogXD cliente = agregarBebida grogXD (restarResistencia (resistencia cliente) cliente) 

--jarraLoca cliente = Cliente (nombre cliente) ((resistencia cliente) - 10) (map jarraLoca (amigos cliente))
jarraLoca cliente = agregarBebida jarraLoca (cambiarAmigos (map jarraLoca (amigos cliente)) (restarResistencia 10 cliente))

--klusener sabor cliente = Cliente (nombre cliente) ((resistencia cliente) - length sabor) (amigos cliente)
klusener sabor cliente = agregarBebida (klusener sabor) (restarResistencia (length sabor) cliente)

--tintico cliente = Cliente (nombre cliente) ((resistencia cliente) + length (amigos cliente) * 5) (amigos cliente)
tintico cliente = agregarBebida tintico (restarResistencia (-length (amigos cliente)* 5) cliente) 

--soda fuerza cliente = Cliente ("e" ++ replicate fuerza 'r' ++ "p" ++ (nombre cliente)) (resistencia cliente) (amigos cliente)
soda fuerza cliente = agregarBebida (soda fuerza) (cambiarNombre ("e" ++ replicate fuerza 'r' ++ "p" ++ (nombre cliente)) cliente)

-- Punto 6 
-- Hacer que un cliente pueda rescatarde
rescatarse horas | horas > 3 = restarResistencia (-200)  
                 | otherwise = restarResistencia (-100)  

-- Punto 7
-- La consulta de consola : nosotros la llamamos itinerarioAna
itinerarioAna = klusener "huevo".rescatarse 2.klusener "chocolate".jarraLoca

-- Correcciones 
-- Tienen varias funciones que trabajan estructuralmente con el cliente, abriendo el patrón y creando un cliente nuevo a partir del recibido para cambiarle uno o más valores al que retornan. Si bien eso es válido, luego tiene problemas si cambia la forma que tiene el cliente (cosa que sucede en la segunda entrega), porque en todos los lugares donde hicieron eso tienen que ir y realizar el cambio necesario para adaptarse a la nueva forma.

-- ¿Cómo se puede minimizar ese impacto? Una forma es tener un conjunto chico de funciones que trabajan de esa forma, que sean tan simples como se pueda, en particular esas podrían ser:
-- cambiarNombre :: String -> Cliente -> Cliente
-- cambiarResistencia :: Int -> Cliente -> Cliente
-- cambiarAmigos :: [Cliente] -> Cliente -> Cliente

-- Luego todas las funciones con una lógica más compleja pueden usar la función chiquitita más conveniente, e incluso combinarlas cuando hay más de un cambio para hacer, como es el caso de la jarraLoca.

-- Funciones chicas
cambiarNombre nuevoNombre cliente = Cliente nuevoNombre (resistencia cliente) (amigos cliente) (tomadas cliente)

restarResistencia num cliente = Cliente (nombre cliente) ((resistencia cliente) - num) (amigos cliente) (tomadas cliente)

cambiarAmigos nuevosAmigos cliente = Cliente (nombre cliente) (resistencia cliente) nuevosAmigos (tomadas cliente)

-- agregarAmigos amigosNuevos cliente = Cliente (nombre cliente) (resistencia cliente) () (tomadas cliente)

agregarAmigos cliente = foldr agregarAmigo cliente 


-- TP parte 2

-- 1
--b)
agregarBebida bebida cliente = Cliente (nombre cliente) (resistencia cliente) (amigos cliente) (bebida:(tomadas cliente)) 

-- c)
tomarTragos cliente = foldr tomar cliente
tomar trago = trago

--d)
dameOtro cliente = tomar head(tomadas cliente) cliente

-- 2)
-- a)
cualesPuedeTomar cliente = filter (quedaEnCero cliente) 
quedaEnCero cliente trago = resistencia (trago cliente) > 0

-- b)
cuantasPuedeTomar cliente = length . cualesPuedeTomar cliente

-- 3)
-- Itinerarios nuevos

--mezclaExplosiva horas = klusener "frutilla" . rescatarse (horas - 2.0) . klusener "huevo" . rescatarse (horas - 1.5) . grogXD . rescatarse (horas - 1.5) . grogXD

--itinerarioBasico horas = rescatarse (horas - 3) . klusener "huevo" . rescatarse 2 . klusener "chocolate" . rescatarse (horas - 4) . jarraLoca

--salidaDeAmigos horas = rescatarse horas . jarraLoca . agregarAmigo robertoCarlos . tintico . soda 1




-- 4) 
-- Intensidad
-- a)
data Itinerario = Itinerario{ nomIti::String, horas::Float, bebidas::[Cliente->Cliente] } deriving (Show)

mezclaExplosiva = Itinerario "Mezcla Explosiva" 2.5 [grogXD,grogXD,(klusener "huevo"),(klusener "frutilla")]

itinerarioBasico = Itinerario "Itinerario Basico" 5 [jarraLoca,(klusener "chocolate"),(rescatarse 2),(klusener "huevo")]

salidaDeAmigos = Itinerario "Salida de amigos" 1 [(soda 1),(agregarAmigo robertoCarlos),tintico,jarraLoca]

intensidad h itinerario = (h / (horas itinerario)) * (genericLength (bebidas itinerario))

-- b)

elMasIntenso = maximum.map (intensidad 1)

cualEsElMasIntenso itinerarios = head (filter (\x -> (intensidad  1) x == (elMasIntenso itinerarios)) itinerarios)

tomarElMasIntenso cliente = (tomarTragos cliente) . bebidas . cualEsElMasIntenso 

-- 5) 


sodificacion nombre = foldl aSodar nombre [1..]

aSodar sodado numero = "e" ++ replicate numero 'r' ++ "p" ++ sodado

chuckNorris = Cliente (sodificacion "Chuck") 1000 [ana] [soda x | x <- [1 ..]]

-- itinerarioChuck chuck = tomarTragos chuck [soda x | x <- [1 ..]]


-- dobleSodarodri = (dameOtro . tomar (soda 1)) rodri

-- Justificar bien las preguntas.

-- AGUANTE SUBLIME LOCO


-- BONUS POINT 6)

--jarraPopular cliente espirituosidad = filter

jarraPopular cliente espirituosidad | espirituosidad == 0 = cliente
                                    | otherwise = jarraPopular (foldl (flip agregarAmigo) cliente (amigosDeAmigos (amigos cliente))) (espirituosidad - 1)


amigosDeAmigos listaDeAmigos = concat ( map amigar listaDeAmigos )
amigar amigo = amigos amigo  



