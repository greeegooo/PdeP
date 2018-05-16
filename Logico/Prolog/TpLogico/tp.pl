sabeProgramar(fernando, cobol).
sabeProgramar(fernando, visualBasic).
sabeProgramar(fernando, java).
sabeProgramar(julieta, java).
sabeProgramar(marcos, java).
sabeProgramar(santiago, ecmascript).
sabeProgramar(santiago, java).


rol(fernando, analistaFuncional).
rol(andres, projectLeader).

programador(Persona):-sabeProgramar(Persona,_).

/* a.¿Qué lenguajes sabe programar Fernando?
?- sabeProgramar(fernando, Lenguajes).

b.¿Quiénes programan en Java?
?- sabeProgramar (Programadores, java).

c.¿Existe algún programador de Assembler?
?- sabeProgramar (_, assembler).

d.Fernando, ¿es programador?
?- programador (fernando).

e.¿Qué roles cumple Fernando?
rol(fernando, Roles).

f.¿Quiénes son programadores?
programador(X).

g.¿Existe algún project leader?
rol(_,projectLeader).
*/

/*

El unico punto que no consideramos en la base de conocimiento es el de si julieta
programa en Go, ya que como afirma que no lo sabemos no podemos establecer una verdad
sobre la relacion entre Julieta y su capacidad de programar en dicho lenguaje.

*/

necesita(sumatra, java).
necesita(sumatra, net).
necesita(prometeus,cobol).

trabaja(fernando,prometeus).
trabaja(santiago,prometeus).
trabaja(julieta,sumatra).
trabaja(marcos,sumatra).
trabaja(andres,sumatra).

estaBienAsignado(Persona,Proyecto):-trabaja(Persona,Proyecto),
									necesita(Proyecto,Lenguaje),
									sabeProgramar(Persona,Lenguaje). 

estaBienAsignado(Persona,Proyecto):- trabaja(Persona,Proyecto),rol(Persona,analistaFuncional).

estaBienAsignado(Persona,Proyecto):- trabaja(Persona,Proyecto),rol(Persona,projectLeader).


bienDefinido(Proyecto):-trabaja(_,Proyecto),
						forall( trabaja(Programador,Proyecto),
						        estaBienAsignado(Programador,Proyecto)),
						rol(P1,projectLeader),
						not(rol(P2,projectLeader)),
						P1 \= P2.


copado(fernando,santiago).
copado(santiago,julieta).
copado(santiago,marcos).
copado(julieta,andres).

tarea(fernando, evolutiva(compleja)).  
tarea(fernando, correctiva(8, brainfuck)).
tarea(fernando, algoritmica(150)).
tarea(marcos, algoritmica(20)).
tarea(julieta, correctiva(412, cobol)).
tarea(julieta, correctiva(21, go)).
tarea(julieta, evolutiva(simple)). 

copadoRecursivo(Alguien, Otro):- copado(Alguien,Otro).
copadoRecursivo(Alguien,Otro):- copado(Alguien, X),
								copadoRecursivo(X,Otro).

lePuedeEnseniar(M, L, D):- sabeProgramar(M, L),
						   copadoRecursivo(M,D),
						   not(sabeProgramar(D,L)).

seniority(P,S):- tarea(P,_),
				 findall(T, (tarea(P,X),calcularTarea(X,T)), Ts),
				 sumlist(Ts,S).

seniority(santiago,0).
seniority(andres,0).				      
			     
calcularTarea(evolutiva(simple),3).
calcularTarea(evolutiva(compleja),5).

calcularTarea(correctiva(_,brainfuck),4).
calcularTarea(correctiva(C,_),4):- C > 50.

calcularTarea(algoritmica(C),T):- C > 0,
								  T is C // 10.




						