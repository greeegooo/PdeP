sueniaCon(gabriel, loteria([5,9])).
sueniaCon(gabriel, futbolista(arsenal)).
sueniaCon(juan, cantante(100000)).
sueniaCon(gabriel, cantante(10000)).
sueniaCon(macarena, cantante(100)).

puto(elQueLee).

creeEn(gabriel,campanita).
creeEn(gabriel,elMagoDeOz).
creeEn(gabriel,cavenaghi).
creeEn(juan,conejoDePascuas).
creeEn(macarena,losReyesMagos).
creeEn(macarena,elMagoCapria).
creeEn(macarena,campanita).

ambiciosa(Persona):- creeEn(Persona,_),
					 findall(V, (sueniaCon(Persona,Suenio), valorar(Suenio,V)), Vs),
				     sumlist(Vs,Ambicion), Ambicion > 20.

equipoChico(arsenal).
equipoChico(aldosivi).

valorar(loteria(Ns),V):- length(Ns, Pts), V is Pts * 10.
valorar(futbolista(Equipo), 16):- not(equipoChico(Equipo)).
valorar(futbolista(Equipo), 3):- equipoChico(Equipo).
valorar(cantente(Discos), 6):- Discos > 500000.
valorar(cantente(Discos), 4):- Discos =< 500000.

esPuro(futbolista(_)).
esPuro(cantante(Discos)):- Discos =< 200000.

tieneQuimica(campanita, Persona):- creeEn(Persona, campanita),
								   sueniaCon(Persona, Suenio), valorar(Suenio, Valor), Valor < 5. 

tieneQuimica(Personaje, Persona):- creeEn(Persona, Personaje), 
								   Personaje\=campanita, 
								   forall(sueniaCon(Persona,Suenio), esPuro(Suenio)), 
								   not(ambiciosa(Persona)).

esAmigo(campanita, losReyesMagos).
esAmigo(campanita, conejoDePascuas).
esAmigo(conejoDePascuas, cavenaghi).
esAmigo(conejoDePascuas, Amigo):- esAmigo(Amigo, conejoDePascuas).

enfermo(campanita).
enfermo(losReyesMagos).
enfermo(conejoDePascuas).

/*
puedeAlegrar(Personaje, Persona):- sueniaCon(Persona,_),
								   tieneQuimica(Personaje, Persona), 
								   not(enfermo(Personaje)).

puedeAlegrar(Personaje, Persona):- sueniaCon(Persona,_),
								   tieneQuimica(Personaje, Persona), 
								   enfermo(Personaje),
								   backup(Personaje).

backup(Personaje):- not(enfermo(Personaje)).
backup(Personaje):- esAmigo(Personaje, Alguien),
					enfermo(Personaje), backup(Alguien).


*/
puedeAlegrar(Pj, P):- sueniaCon(P,_),
					  tieneQuimica(Pj,P),
					  not(enfermo(Pj)).

puedeAlegrar(Pj, P):- sueniaCon(P,_),
					  tieneQuimica(Pj,P),
					  esAmigoRecursivo(Pj, X), not(enfermo(X)).

esAmigoRecursivo(Pj1, Pj2) :- esAmigo(Pj1,Pj2).
esAmigoRecursivo(Pj1, Pj2) :- esAmigo(Pj1,X),
							  esAmigoRecursivo(X,Pj2).


/*
puedeAlegrar(Pj,P):- sueniaCon(P,_),
					 tieneQuimica(Pj,P),
					 vivira(Pj).


vivira(Pj):- not(enfermo(Pj)).
vivira(Pj):- esAmigo(Pj, Pj1),
		 	 enfermo(Pj),
		 	 vivira(Pj1).
















