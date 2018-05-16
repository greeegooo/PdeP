humano(socrates).
mortal(X) :- humano(X).
mortal(X) :- padre(X,_).
mortal(X) :- padre(_,X).
mortal(fido).

padre(abrahan,homero).
padre(homero,lisa).
padre(homero,bart).
padre(homero,maggie).
padre(bart, bartJr).

laCague(grego).