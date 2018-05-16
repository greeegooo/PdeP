
object movistar {
	
	method cobra(duracion) = duracion * 0.60
}

object claro {
	
	method cobra(duracion){ 
		var costo = duracion * 0.50
		return costo + costo * 0.21  
	}
}

object personal {
		
	method cobra(duracion){
		
		if(duracion <= 10)
			return duracion * 0.70
		else
			return 7 + (duracion - 10) * 0.40
	}
}