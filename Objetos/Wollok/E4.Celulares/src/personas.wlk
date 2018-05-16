import celulares.*
import companias.*

object juliana {
	
	var celular = motoU9
	var compania = personal
	
	method tieneElCelularApagado() = celular.estaApagado()
	
	method llamar(duracion){
		celular.llamar(duracion)
		compania.cobra(duracion)
	}
}

object catalina {
	
	var celular = iPhone
	var compania = movistar
	
	method tieneElCelularApagado() = celular.estaApagado()
	
	method llamar(duracion){
		celular.llamar(duracion)
		compania.cobra(duracion)
	}
}