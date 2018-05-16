object calculadorDeSueldos {
	method calcularSueldo(persona, bonoPorResultado){
		return  persona.neto() + persona.bonoPorPresentismo() + bonoPorResultado
	}
}

object pepe {
	var categoria
	var diasQueFalta = 0
	
	method categoria() = categoria
	method categoria(tipo){
		categoria = tipo
	} 
	
	method diasQueFalta() = diasQueFalta
	method diasQueFalta(cantidad){
		diasQueFalta = cantidad
	}
	
	method neto() = categoria.neto()
	method bonoPorPresentismo() = categoria.bonoPresentismo(diasQueFalta)
}

object gerente {
	const neto = 1000
	method neto() = neto
	method bonoPresentismo(diasQueFalta){
		if(diasQueFalta == 0) return 100
		else if (diasQueFalta == 1) return 50
		else return 0
	}
}

object cadete {
	const neto = 1500
	method neto() = neto
	method bonoPresentismo(diasQueFalta) = 0
}

object bonoPorResultado{
	method diezSobreElNeto(persona) = persona.neto() * 0.1
	method ochentaFijos() = 80
	method nada() = 0
}