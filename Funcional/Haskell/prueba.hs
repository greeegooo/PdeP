suma3 numero = numero + 3

doble numero = 2 * numero

dobles listaDeNumeros = map doble listaDeNumeros

sig numero = numero + 1

cambiar f a b = f b a 

esPar n = mod n 2 == 0

esImpar n = not(esPar n)

miMensaje 0 = "Hola"
miMensaje 1 = "Hola hola"
miMensaje n = "no es ni cero ni uno"

siEsNegNeg True n = (-n)
siEsNegNeg False n = n

parteEntera n = siEsNegNeg (n < 0) n