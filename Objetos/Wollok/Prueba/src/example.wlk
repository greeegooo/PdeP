import objects.*
import constants.*

/** First Wollok example */
object wollok {
	method howAreYou() {
		return 'I am Wolloktastic!'
	}
}

class MiPrimerClaseHeredada inherits MiPrimerClase{
	
	constructor (){
		
	}
	
	method sumarAyB (a,b) = a + b
	
	method elSiguiente (a) = a + 1
	
	method elAnterior (a) = a - 1
}

object objeto inherits MiPrimerClaseHeredada{
	
}

// Ejercicio

object pepita inherits Ave{
	var energia = 0
	method come(comida){
		energia += comida * 10
	}
	method vola(distancia){
		energia -= distancia
	}
	//getter
	override method energia() = energia
	//setter
	method energia(valor){
		energia = valor
	}
}

object entrenador{
	method entrena(ave){
		ave.come(5)
		ave.vola(10)
		return ave.energia()
	}
}

object pepe inherits Ave{
	var comido = 0
	var volado = 0
	method come(comida){
		comido += comida * 10
	}
	method vola(distancia){
		volado -= distancia
	}
	override method energia() = comido - volado
	method flotaEnElLugar(){
		volado += 10
	}
}

class Ave{
	method come(){}
	method vola(){}
	method energia()
}

















