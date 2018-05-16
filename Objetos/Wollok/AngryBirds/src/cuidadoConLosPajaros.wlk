class Pajaro {
	
	var ira = 0
	var estaEnojado = false
	
	method fuerza() = ira * 2
	method ira() = ira
	method ira(valor) {
		ira = valor
	}
	
	method estaEnojado(valor){
		estaEnojado = valor
	}
	
}

class Rencoroso inherits Pajaro{
	
	var vecesEnojado = 0
	
	override method fuerza () = ira * vecesEnojado
	
}

object comun inherits Pajaro{}

object red inherits Pajaro{
	
	override method fuerza() = super() * 10
	
}

object bomb inherits Pajaro{
	
	var topeDeFuerza = 9000
	
	override method fuerza() {
		if(ira * 2 > topeDeFuerza){
			return ira
		}else{
			return ira * 2
		}
	}
}

object chuck inherits Pajaro{
	
	var velocidad = 0
	
	override method fuerza(){
		
		if(estaEnojado) { velocidad *= 2 }
		
		if(velocidad <= 80){
			
			return 150
			
		}else{
			
			return 150 + (5 * (velocidad - 80))
			
		}
	}
	
}

object terence inherits Pajaro{
	
	var vecesEnojado = 0
	
	
	override method fuerza() = ira * vecesEnojado * multiplicador
	
}

object matilda inherits Pajaro{
	
	var huevos = []
	
	override method fuerza() = super() + self.sumaDeLaFuerzaDeLosHuevos()
	
	override method estaEnojado(valor){
		
		if(valor){ huevos.add(new Huevo(2))}
		estaEnojado = valor
	}
	
	method sumaDeLaFuerzaDeLosHuevos() {
		return  huevos.sum( { x => x.peso() } )
	}
	
}

class Huevo {
	
	var peso 
	
	constructor(_peso){
		peso = _peso
	}
	
	method peso() = peso
	method peso(valor) {
		peso = valor
	}
	
}

object isla {
	
	var pajaros = []
	
	method pajarosFuertes() = pajaros.filter( { x => x.fuerza() > 50 } )
	
	method fuerza() =  self.pajarosFuertes().sum( { x => x.fuerza() } )
	
	method sesionDeManejoDeIraConMatilda() {
		
	}
}

