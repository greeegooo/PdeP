module Bazas where

nomJug (a,_,_) = a
bazasPedidas (_,b,_) = b
bazasGanadas (_,_,c) = c

tercerParametro = bazasGanadas

puntosGanados mano | bazasPedidas mano == bazasGanadas mano = (bazasGanadas mano) + 10 | otherwise = bazasGanadas mano

leGana c1 c2 triunfo | snd c1 == snd c2 = c1 > c2 | snd c2 == triunfo = False | otherwise = True

manosTranscurridas = [(1, [("Maiu",0,1), ("Guille",1,0), ("Nico",0,0), ("Adriel",1,0)]),(3, [("Maiu",1,1), ("Guille",1,2), ("Nico",1,0), ("Adriel",1,0)]),(5, [("Maiu",2,1), ("Guille",1,1), ("Nico",2,2), ("Adriel",1,1)]),(7, [("Maiu",3,5), ("Guille",1,0), ("Nico",0,0), ("Adriel",1,0)]),(9, [("Maiu",4,4), ("Guille",2,1), ("Nico",2,3), ("Adriel",1,1)]),(11,[("Maiu",5,5), ("Guille",4,5), ("Nico",1,1), ("Adriel",0,0)]),(10,[("Maiu",3,1), ("Guille",2,3), ("Nico",7,6), ("Adriel",2,0)]),(8, [("Maiu",2,2), ("Guille",1,1), ("Nico",2,3), ("Adriel",1,2)]),(6, [("Maiu",0,1), ("Guille",1,3), ("Nico",2,2), ("Adriel",1,0)])]

manoActual = ("oro", (4,[("Maiu",1,[(8,"basto"),(1,"oro"),(2,"oro"),(2,"copa")]),("Guille",2,[(1,"basto"),(4,"oro"),(5,"copa"),(12,"espada")]),("Nico",0, [(2,"espada"),(3,"copa"),(2,"copa"),(7,"basto")]),("Adriel",1,[(10,"basto"),(9,"oro"),(7,"oro"),(6,"espada")])]))


resultadosJugador nombre = (filter (\mano -> nomJug mano == nombre)).concat.(map snd)

puntos nombre = sum.(map puntosGanados).(resultadosJugador nombre)

manoMalPedida mano = fst mano == sumBazasPedidas mano 

sumBazasPedidas = sum.(map bazasPedidas).snd

cartas nombre = tercerParametro.head.(filter (\jugador -> nomJug jugador == nombre)).snd.snd

tieneTriunfo nombre manoActual = any (\x -> snd x == fst manoActual) (cartas nombre manoActual)