import Test.HUnit
import TP


data Desconocido = ResultadoDeTipoDesconocido

--
-- correr todo usando:
-- > correrTodo
--

-- DATOS PARA ARMAR LAS PRUEBAS (modificar donde corresponda)
-- Cada una de estas funciones debe retornar una tupla de aridad 3
-- cuyos valores representan (descripcion, consulta que resuelve lo pedido, resultado esperado)
-- por cuestiones de tipado, cambien los ResultadoDeTipoDesconocido para una misma función de datos de test (por ejemplo datosTest3) todos juntos
-- pueden reemplazar los undefined por la consulta que resuelve el problema por separado sin problemas porque undefined :: a


datosTest3 1 = ("Cristian debe estar duro", comoEsta cristian, "Duro")
datosTest3 2 = ("Rodri debe estar fresco", comoEsta rodri, "Fresco")
datosTest3 3 = ("Marcos debe estar duro", comoEsta marcos, "Duro")
datosTest3 4 = ("Si Marcos se hace amigo de Ana y Rodri, está piola", (comoEsta . agregarAmigo ana) marcos, "Piola")

datosTest4 1 = ("Rodri intenta hacerse amigo de sí mismo", (length . amigos) (agregarAmigo rodri rodri), 0)
datosTest4 2 = ("Marcos intenta hacerse amigo de Rodri, de quien ya es amigo", (length . amigos) (agregarAmigo rodri marcos), 1)
datosTest4 3 = ("Rodri intenta hacerse amigo de Marcos, que no era su amigo", (length . amigos) (agregarAmigo marcos rodri), 1)
 
datosTest5 1 = ("Si Ana toma GrogXD queda con resistencia 0", resistencia (grogXD ana) == 0, True)
datosTest5 2 = ("Si Ana toma la Jarra Loca su resistencia y la de sus amigos baja", (resistencia ana) + sum (map resistencia (amigos ana)) > resistencia (jarraLoca ana) + sum (map resistencia (amigos (jarraLoca ana))), True) 
datosTest5 3 = ("Si Ana toma un Klusener de huevo queda con resistencia 115", resistencia (klusener "huevo" ana) == 115, True)
datosTest5 4 = ("Si Ana toma un Klusener de chocolate queda con resistencia 111", resistencia (klusener "chocolate" ana) == 111, True)
datosTest5 5 = ("Si Cristian toma un Tintico queda con resistencia 2", resistencia (tintico cristian) == 2, True)
datosTest5 6 = ("Si Ana toma un Tintico queda con resistencia 130", resistencia (tintico ana) == 130, True)
datosTest5 7 = ("Si Rodri toma una Soda de fuerza 2 queda con nombre errpRodri", nombre (soda 2 rodri) == "errpRodri", True)
datosTest5 8 = ("Si Ana toma una Soda de fuerza 10 queda con nombre errrrrrrrrrpAna", nombre (soda 10 ana) == "errrrrrrrrrpAna", True)
datosTest5 9 = ("Si Ana toma una Soda de fuerza 0 queda con nombre epAna", nombre (soda 0 ana) == "epAna", True)

datosTest6 1 = ("Si Rodri se rescata 5 horas queda con 255 de resistencia", resistencia (rescatarse 5 rodri), 255)
datosTest6 2 = ("Si Rodri se rescata 1 hora queda con 155 de resistencia", resistencia (rescatarse 1 rodri), 155)

datosTest7 1 = ("Itinerario de Ana", resistencia (itinerarioAna ana) > resistencia ana, True)


--- ENTREGA 2 ---
datosEntrega2Test1b 1 = ("Marcos toma una soda de nivel 3 y queda con 2 bebidas y con 40 de resistencia", (length . tomadas . soda 3) marcos == 2 && (resistencia . soda 3) marcos == 40, True)

datosEntrega2Test1c 1 = ("Rodri toma una soda de nivel 1 y una soda de nivel 2 y queda con nombre errperpRodri", (nombre . soda 2 . soda 1) rodri, "errperpRodri")
datosEntrega2Test1c 2 = ("Marcos toma un klusener de huevo, un tintico y una jarraLoca y queda con 30 de resistencia y con 4 bebidas en el historial" , resistencia (tomarTragos marcos [klusener "huevo", tintico, jarraLoca]) == 30 && (length . tomadas) (tomarTragos marcos [klusener "huevo", tintico, jarraLoca]) == 4, True)

datosEntrega2Test1d 1 = ("Marcos pide “dame otro” y queda con 2 bebidas en el historial y 34 de resistencia", (length . tomadas . dameOtro) marcos == 2 && (resistencia . dameOtro) marcos == 34, True)
datosEntrega2Test1d 2 = ("Rodri toma una soda de nivel 1, y “dame otro” da como resultado que tiene 3 bebidas y su nombre queda “erperpRodri”", (length . tomadas . dameOtro . soda 1) rodri == 3 && (nombre . dameOtro . soda 1) rodri == "erperpRodri", True)

datosEntrega2Test2b 1 = ("Rodri puede tomar dos bebidas, entre un grog XD, un tintico y un klusener de frutilla", cuantasPuedeTomar rodri [grogXD, tintico, klusener "frutilla"], 2)
datosEntrega2Test2b 2 = ("Entre un grog XD, un tintico, un klusener de fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla Rodri se puede tomar una sola bebida", cuantasPuedeTomar rodri [grogXD, tintico, klusener "fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla"], 1)

--datosEntrega2Test3b 1 = ("Rodri hace una salida de amigos... y le pasa de todo", tomarTragos rodri (bebidas salidaDeAmigos), True)

datosEntrega2Test4a 1 = ("la intensidad de la mezcla explosiva es 1.6", intensidad 1 mezclaExplosiva, 1.6)
datosEntrega2Test4a 2 = ("la intensidad de la salidaDeAmigos es 4.0", intensidad 1 salidaDeAmigos, 4.0)
datosEntrega2Test4a 3 = ("la intensidad del itinerario basico es 0.8", intensidad 1 itinerarioBasico, 0.8)

datosEntrega2Test4b 1 = ("Entre la salida de amigos, la mezcla explosiva y el itinerario básico, el itinerario más intenso es la salida de amigos", nomIti (cualEsElMasIntenso [mezclaExplosiva, salidaDeAmigos, itinerarioBasico]), nomIti salidaDeAmigos)

--datosEntrega2Test5 1 = ("Rodri hace el itinerario más intenso entre una salida de amigos, la mezcla explosiva y el itinerario básico y realiza salida de amigos", tomarElMasIntenso rodri [salidaDeAmigos,mezclaExplosiva,itinerarioBasico], tomarTragos rodri (bebidas salidaDeAmigos))

datosEntrega2Test6 1 = ("Roberto Carlos se hace amigo de Ana, toma una jarra popular de espirituosidad 0, sigue quedando con una sola amiga (Ana)", (length . amigos) (jarraPopular (agregarAmigo ana robertoCarlos) 0), 1)
datosEntrega2Test6 2 = ("Roberto Carlos se hace amigo de Ana, toma una jarra popular de espirituosidad 3, queda con 3 amigos (Ana, Marcos y Rodri)", (length . amigos) (jarraPopular (agregarAmigo ana robertoCarlos) 3), 3)
datosEntrega2Test6 3 = ("Cristian se hace amigo de Ana. Roberto Carlos se hace amigo de Cristian, toma una jarra popular de espirituosidad 4, queda con 4 amigos (Cristian, Ana, Marcos y Rodri)",(length . amigos) (jarraPopular (agregarAmigo robertoCarlos (agregarAmigo cristian ana)) 4), 4)

-- TESTS AUTOMATICOS (no modificar)

armarTest fDatosTest = (\(titulo, resultado, esperado) -> TestLabel titulo (resultado ~?= esperado)).fDatosTest

armarTestSuite titulo fDatosTest cant = (TestLabel titulo . TestList . map (armarTest fDatosTest)) [1.. cant]
tests = TestList [
    armarTestSuite "Punto 3" datosTest3 4,
    armarTestSuite "Punto 4" datosTest4 3,
    armarTestSuite "Punto 5" datosTest5 9,
    armarTestSuite "Punto 6" datosTest6 2,
    armarTestSuite "Punto 7" datosTest7 1,
    armarTestSuite "Entrega 2 Punto 1b" datosEntrega2Test1b 1,
    armarTestSuite "Entrega 2 Punto 1c" datosEntrega2Test1c 2,
    armarTestSuite "Entrega 2 Punto 1d" datosEntrega2Test1d 2,
    armarTestSuite "Entrega 2 Punto 2b" datosEntrega2Test2b 2,
    armarTestSuite "Entrega 2 Punto 3b" datosEntrega2Test3b 1,
    armarTestSuite "Entrega 2 Punto 4a" datosEntrega2Test4a 3,
    armarTestSuite "Entrega 2 Punto 4b" datosEntrega2Test4b 1,
    armarTestSuite "Entrega 2 Punto 4b" datosEntrega2Test5 1,
    armarTestSuite "Entrega 2 Punto 6" datosEntrega2Test6 3
  ]
correrTodo = runTestTT tests