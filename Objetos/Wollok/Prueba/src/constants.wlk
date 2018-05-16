object tom{
	
	// Vars
	var energia = 0
	var velocidad = 5 * (energia / 10)
	var ratonesComidos = 0
	var segundosCorridos = 0
	
	// Methods
	method energia() = energia
	method velocidad() = velocidad
	
	method calcularDistanciaRecorrida(segundos){
		 return 5 * segundos + (energia /10)
	}
	
	method comerRatones(raton){
		ratonesComidos ++
		return energia += 12 + raton.peso()
	}
	method correr(tiempo) {
		segundosCorridos += tiempo
		return energia -= 0.5  *  self.calcularDistanciaRecorrida(tiempo)
	}
	
	method meConvieneComerAqueEsta(raton,distancia){
		var energiaGanadaPorComer = self.comerRatones(raton.peso())
		var energiaPerdidaPorCorrer = 0.5 * distancia
		return energiaGanadaPorComer > energiaPerdidaPorCorrer
	}
}

object raton{
	
	// Vars
	var peso = 0
	
	// Methods
	method peso() = peso
	method peso(gramos){
		peso = gramos
	}
}

object persona{
	
	// Vars
	var ratonesComidos = 0
	var segundosCorridos = 0
	
	// Methods
	method ratonesComidos() = ratonesComidos
	method ratonesComidos(tom){
		ratonesComidos += tom.ratonesComidos()
	}
	
	method segundosCorridos() = segundosCorridos
	method segundosCorridos(tom){
		segundosCorridos += tom.segundosCorridos()
	}
}