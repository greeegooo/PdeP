object iPhone{
	var bateria = 5	
	
	method bateria() = bateria
	method estaApagado() = bateria <= 0
	
	method llamar(duracion){
		bateria -= duracion * 0.1
	}
	method recargar(){
		bateria = 5
	}
}

object motoU9{
	var bateria = 5
	
	method bateria() = bateria
	method estaApagado() = bateria <= 0
	
	method llamar(duracion){	
		bateria -= 0.25
	}
	method recargar(){
		bateria = 5
	}
}
