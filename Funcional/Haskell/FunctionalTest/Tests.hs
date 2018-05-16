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
datosTest3 4 = ("Si Marcos se hace amigo de Ana y Rodri, está piola", comoEsta (agregarAmigo ana marcos), "Piola")

datosTest4 1 = ("Rodri intenta hacerse amigo de sí mismo", agregarAmigo rodri rodri, rodri)

datosTest4 2 = ("Marcos intenta hacerse amigo de Rodri, de quien ya es amigo", agregarAmigo rodri marcos, marcos)
datosTest4 3 = ("Rodri intenta hacerse amigo de Marcos, que no era su amigo", agregarAmigo marcos rodri, cambiarAmigos (marcos:(amigos rodri)) (rodri))

datosTest5 1 = ("Si Ana toma GrogXD queda con resistencia 0", grogXD ana, restarResistencia 120 ana)

datosTest5 2 = ("Si Ana toma la Jarra Loca su resistencia y la de sus amigos baja", jarraLoca ana, cambiarAmigos (map jarraLoca (amigos ana)) (restarResistencia 10 ana))

datosTest5 3 = ("Si Ana toma un Klusener de huevo queda con resistencia 115", klusener "huevo" ana, Cliente {nombre = "Ana", resistencia = 115, amigos = [Cliente {nombre = "Marcos", resistencia = 40, amigos = [Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]})

datosTest5 4 = ("Si Ana toma un Klusener de chocolate queda con resistencia 111", klusener "chocolate" ana, Cliente {nombre = "Ana", resistencia = 111, amigos = [Cliente {nombre = "Marcos", resistencia = 40, amigos = [Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]})
datosTest5 5 = ("Si Cristian toma un Tintico queda con resistencia 2", tintico cristian, Cliente {nombre = "Cristian", resistencia = 2, amigos = []})

datosTest5 6 = ("Si Ana toma un Tintico queda con resistencia 130", tintico ana, Cliente {nombre = "Ana", resistencia = 130, amigos = [Cliente {nombre = "Marcos", resistencia = 40, amigos = [Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]})

datosTest5 7 = ("Si Rodri toma una Soda de fuerza 2 queda con nombre errpRodri", soda 2 rodri, Cliente {nombre = "errpRodri", resistencia = 55, amigos = []})

datosTest5 8 = ("Si Ana toma una Soda de fuerza 10 queda con nombre errrrrrrrrrpAna", soda 10 ana, Cliente {nombre = "errrrrrrrrrpAna", resistencia = 120, amigos = [Cliente {nombre = "Marcos", resistencia = 40, amigos = [Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]})

datosTest5 9 = ("Si Ana toma una Soda de fuerza 0 queda con nombre epAna", soda 0 ana, Cliente {nombre = "epAna", resistencia = 120, amigos = [Cliente {nombre = "Marcos", resistencia = 40, amigos = [Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 55, amigos = []}]})

datosTest6 1 = ("Si Rodri se rescata 5 horas queda con 255 de resistencia", rescatarse 5 rodri, Cliente {nombre = "Rodri", resistencia = 255, amigos = []})
datosTest6 2 = ("Si Rodri se rescata 1 hora queda con 155 de resistencia", rescatarse 1 rodri, Cliente {nombre = "Rodri", resistencia = 155, amigos = []})

datosTest7 1 = ("Itinerario de Ana", itinerarioAna ana, Cliente {nombre = "Ana", resistencia = 196, amigos = [Cliente {nombre = "Marcos", resistencia = 30, amigos = [Cliente {nombre = "Rodri", resistencia = 45, amigos = []}]},Cliente {nombre = "Rodri", resistencia = 45, amigos = []}]})

-- TESTS AUTOMATICOS (no modificar)

armarTest fDatosTest = (\(titulo, resultado, esperado) -> TestLabel titulo (resultado ~?= esperado)).fDatosTest

armarTestSuite titulo fDatosTest cant = (TestLabel titulo . TestList . map (armarTest fDatosTest)) [1.. cant]
tests = TestList [
    armarTestSuite "Punto 3" datosTest3 4,
    armarTestSuite "Punto 4" datosTest4 3,
    armarTestSuite "Punto 5" datosTest5 9,
    armarTestSuite "Punto 6" datosTest6 2,
    armarTestSuite "Punto 7" datosTest7 1
  ]
correrTodo = runTestTT tests