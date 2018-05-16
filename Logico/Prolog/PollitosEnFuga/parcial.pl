/*
Lucas: Hola chicos, en este programa van a ver la resolucion del parcial POLLITOS EN FUGA. Alta peli no Grego?
Grego: No, no la vi.
Lucas: Emmm, bueno... No importa. Le presentamos el codigo de la siguiente manera. Grego, queres explicarles a los chicos?
Grego: Como podran ver el parcial esta resuelto de dos maneras diferentes (Esta el Greg Code y el Lucas Code)
Grego: Ambos funcionan, pero les puede servir para que vean ciertas maneras de encararlos.
Lucas: Si desean realizar consultas, claramente deben comentar uno de los dos codigos. No sean bobos.
Grego: Eso ya lo saben.
Lucas: Y si no lo sabian?
Grego: Bueeeeno. Como dijo Lucas, deben comentar uno de los dos codigos para ver el funcionamiento de los mismos.
Grego: Podran hacerlo colocando al comienzo del codigo (barra)(asterisco) y al final (asterisco)(barra)
Grego: Espero que les sriva, cualquier duda nos consultan. :) 
Lucas: Que tengan un lindo dia! :D 
*/

animal(ginger,gallina(10,5)).
animal(babs,gallina(15,2)).
animal(bunty,gallina(23,6)).
animal(mac,gallina(8,7)).
animal(turuleca,gallina(15,1)).
animal(rocky,gallo(animalDeCirco)).
animal(fowler,gallo(piloto)).
animal(oro,gallo(arrocero)).
animal(nick,rata).
animal(fetcher,rata).

animal(lucia,zorrrrra).
animal(pato,pato).
animal(lucas,perro).
animal(emi,gato).
animal(grego,vaca).

granja(tweedys, [ginger,bubs,bunty,mac,fowler]).
granja(delSol, [turuleca, oro, nick, fetcher]).


% ------------------- Greg Code -----------------------
% 1)

puedeCederle(G1, G2) :- animal(G1, gallina(_,7)),
						animal(G2, gallina(_, C)),
						C < 3.

% 2) 
animalLibre(A) :- animal(A, _),
				  not(perteneceAGranja(A,_)).

% 3)
valoracionDeGranja(G,V) :- granja(G,L),
						   findall(Va,(animal(A,E),member(A,L),cuantoVale(E,Va)),Vs),
						   sumlist(Vs,V).

cuantoVale(rata,0).
cuantoVale(gallina(P,H),V) :- V is P * H.
cuantoVale(gallo(piloto),50).
cuantoVale(gallo(animalDeCirco),50).
cuantoVale(gallo(_),25).

% 4)
granjaDeluxe(G) :- granja(G,L),
				   not(tieneRatas(L)),
				   tieneMasDe50Animales(L).

granjaDeluxe(G) :- granja(G,L),
				   not(tieneRatas(L)),
				   valoracionDeGranja(G,1000).

tieneRatas(L) :- granja(_,L),
				 forall((animal(N,E), member(N,L)), E \= rata).

tieneMasDe50Animales(L) :- granja(_,L),
						   length(L,T),
						   T > 50.

% 5)
perteneceAGranja(A,G) :- animal(A,_), 
				         granja(G,As),
				         member(A,As).


lePuedeCederUnaALaOtra(A1,A2) :- puedeCederle(A1,A2).
lePuedeCederUnaALaOtra(A1,A2) :- puedeCederle(A2,A1).

sabeVolar(A) :- animal(A,gallo(piloto)).
sabeVolar(A) :- animal(A,gallo(animalDeCirco)).

soloUnoSabeVolar(A1,A2) :- animal(A2,_), 
						   sabeVolar(A1), 
						   not(sabeVolar(A2)).

soloUnoSabeVolar(A1,A2) :- animal(A1,_), 
						   sabeVolar(A2), 
						   not(sabeVolar(A1)).
% gallina
buenaPareja(A1, A2) :- perteneceAGranja(A1, G),
					   perteneceAGranja(A2, G),
					   animal(A1, gallina(P,_)),
					   animal(A2, gallina(P,_)),
					   lePuedeCederUnaALaOtra(A1,A2),
					   A1 \= A2.

% gallo
buenaPareja(A1, A2) :- perteneceAGranja(A1, G),
					   perteneceAGranja(A2, G),
					   animal(A1, gallo(_)),
					   animal(A2, gallo(_)),
					   soloUnoSabeVolar(A1,A2),
					   A1 \= A2.

% rata
buenaPareja(A1, A2) :- perteneceAGranja(A1, G),
					   perteneceAGranja(A2, G),
					   animal(A1, rata),
					   animal(A2, rata),
					   A1 \= A2.

%6) 
escapePerfecto(G) :- todasSusGallinasPonenMasDe5HuevosPorSemana(G),
					 todosSusAnimalesHacenBuenaParejaConAlgunOtro(G).

todasSusGallinasPonenMasDe5HuevosPorSemana(G) :- granja(G,_),
											     forall((animal(N,gallina(_,H)),perteneceAGranja(N,G)),H > 5).
todosSusAnimalesHacenBuenaParejaConAlgunOtro(G) :- granja(G,_),
  												   forall((perteneceAGranja(N,G)),buenaPareja(N,_)).


% --------------- Lucas Code ---------------------
% 1)

gallinaTrabajadora(G) :- animal(G, gallina(_,7)).
gallinaHaragana(G) :- animal(G, gallina(_, H)),
					  H < 3.

puedeCederle(G1, G2) :- gallinaTrabajadora(G1),
						gallinaHaragana(G2).

puedeCederle(G1, G2) :- gallinaTrabajadora(G2),
						gallinaHaragana(G1).

% 2)
animalLibre(A) :- animal(A, _),
				  not(pertenece(A,_)).

% 3)
pertenece(A,G) :- animal(A, _), 
				  granja(G,As),
				  member(A,As).

sabeVolar(A) :- animal(A,gallo(piloto)).
sabeVolar(A) :- animal(A,gallo(animalDeCirco)).

valoracionAnimal(A,0) :- animal(A,rata).
valoracionAnimal(A,50) :- sabeVolar(A).
valoracionAnimal(A,25) :- animal(A,gallo(_)), 
					      not(sabeVolar(A)).
valoracionAnimal(A,V) :- animal(A,gallina(P,H)), 
						 V is P * H.

valoracionDeGranja(G,V) :- granja(G,_),
						   findall(S,(pertenece(A,G),valoracionAnimal(A,S)),Vs),
						   sumlist(Vs,V).

% 4)
libreDeRatas(G) :- granja(G,_),
				   animal(A,rata),
				   not(pertenece(A,G)).

muchosAnimales(G) :- granja(G,As),
					 length(As,C),
					 C > 50.

granjaDeluxe(G) :- libreDeRatas(G),
				   valoracionDeGranja(G,1000).

granjaDeluxe(G) :- libreDeRatas(G),
				   muchosAnimales(G).

% 5)
soloUnoSabeVolar(A1,A2) :- animal(A2,_), 
						   sabeVolar(A1), 
						   not(sabeVolar(A2)).

soloUnoSabeVolar(A1,A2) :- animal(A1,_), 
						   sabeVolar(A2), 
						   not(sabeVolar(A1)).

vivenJuntos(A1,A2,G) :- pertenece(A1, G),
					    pertenece(A2, G),
					    A1 \= A2.
% gallina
buenaPareja(A1, A2) :- granja(G,_),
					   vivenJuntos(A1,A2,G),
					   animal(A1, gallina(P,_)),
					   animal(A2, gallina(P,_)),
					   puedeCederle(A1,A2),
					   A1 \= A2.

% gallo
buenaPareja(A1, A2) :- granja(G,_),
   					   vivenJuntos(A1,A2,G),
					   soloUnoSabeVolar(A1,A2),
					   A1 \= A2.

% rata
buenaPareja(A1, A2) :- granja(G,_),
                       vivenJuntos(A1,A2,G),
					   animal(A1, rata),
					   animal(A2, rata),
					   A1 \= A2.

%6) 
escapePerfecto(G) :- granja(G,_),
					 forall((pertenece(A,G)),buenaPareja(A,_)),
					 forall((pertenece(animal(A,gallina(_,H)),G)), H > 5).

















































