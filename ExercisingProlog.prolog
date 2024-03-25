fat(0,1). 

fat(N,F) :-
   N>0,
   N1 is N-1,
   fat(N1,F1),
   F is N * F1.

custo(a, b, 5).
custo(a, f, 5).
custo(a, g, 35).
custo(a, c, 10).
custo(b, f, 5). 
custo(b, e, 25).
custo(c, d, 10).
custo(d, e, 5).
custo(e, f, 5).
custo(g, f, 20).
% Caso base: o caso base basicamente é o custo direto de um vertice A para um vertice B
custo_total(Origem, Destino, CustoTotal) :-
 custo(Origem, Destino, CustoTotal).

custo_total(Origem, Destino, CustoTotal) :-
 custo(Origem, Intermedio, Custo1), % Acha um vértice intermediário
 custo_total(Intermedio, Destino, Custo2), 
 CustoTotal is Custo1 + Custo2. % Soma o custo

mdc(X, 0, X) :- X > 0.
mdc(X, Y, Z) :- Y > 0, Resto is X mod Y, mdc(Y, Resto, Z),!.

s(1,1).
s(X,Y) :- X > 0,
    	  X1 is X-1,
    	  s(X1,Y1),!,
    	  Y is X+Y1.

pot(X,1,X).
pot(Base, Expo, R) :- Base > 0, Expo > 0, Expo1 is Expo-1,
    pot(Base, Expo1, R1), R is R1*Base.

deCarro(auckland,hamilton).
deCarro(hamilton, raglan).
deCarro(valmont, saarbruecken).
deCarro(valmont, metz).
deTrem(saarbruecken, frankfurt).
deTrem(metz, frankfurt).
deTrem(metz, paris).
deTrem(saarbruecken, paris).
deAviao(frankfurt, bangkok).
deAviao(frankfurt, singapore).
deAviao(paris, losAngeles).
deAviao(bangkok, auckland).
deAviao(losAngeles, auckland).

viagem(X,Y) :- deCarro(X,Y); deTrem(X,Y); deAviao(X,Y),!.
viagem(X,Z) :- deCarro(X,Y), viagem(Y,Z),!.
viagem(X,Z) :- deTrem(X,Y), viagem(Y,Z),!.
viagem(X,Z) :- deAviao(X,Y), viagem(Y,Z),!.

