class Habitante {
	method leGusta(disfraz)
	method cantidadDeCaramelos(disfraz, casa)
}

object azucena inherits Habitante{
	override method leGusta(disfraz) = disfraz.ternura() > 8
	
	override method cantidadDeCaramelos(disfraz, casa) {
		return if(self.leGusta(disfraz)) disfraz.ternura() else 5  
	}
		
}

object sandra inherits Habitante{
	override method leGusta(disfraz) = disfraz.ternura() > disfraz.terror()  
	
	override method cantidadDeCaramelos(disfraz, casa){
		return if(casa.caos() < 3) 8 else 2
	}
}

object jorge inherits Habitante{
	override method leGusta(disfraz) = disfraz.terror() > 8
	
	override method cantidadDeCaramelos(disfraz, casa){
		return if(casa.caramelos() >= 50) 5 else 4
	}
}

object casa {
	var caramelos = 100
	var caos = 0
	
	method caramelos() = caramelos
	method caos() = caos
	
	method sacarCaramelos(cantidad) {
		caramelos -= cantidad
	}
}

object zombie {
	method ternura() = 0
	method terror() = 8
}

object frozen {
	method ternura() = 5
	method terror() = 0
}

object disfrazCustom {
	var ternura = 0
	var terror = 0
	
	method ternura() = ternura
	method ternura(valor){
		ternura = valor
	}
	
	method terror() = terror
	method terror(valor){
		terror = valor
	}
	
}
