/*
Trabalho realizado por:
    Felipe Canabarro Grafunder - 12011BCC038
    Gabriel Henrique de Oliveira - 12021BCC036
    Guilherme Duarte Toffoli - 12021BCC011
    Guilherme Henrique Otoni - 12021BCC009
*/


%1) a)
 
progenitor(jose,joao).
progenitor(jose,ana).
progenitor(jose,jessica).
progenitor(jose,lucas).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(maria,jessica).
progenitor(maria,lucas).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joana,antonio).
progenitor(joana,juares).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).
progenitor(jessica,heloisa).
progenitor(lucas,fagundes).
progenitor(lucas,marcia).
progenitor(lucas,julio).
progenitor(marcia,luciano).
progenitor(rodrigo,luciano).
 
%b)
masculino(jose).
masculino(joao).
masculino(lucas).
masculino(antonio).
masculino(juares).
masculino(mario).
masculino(carlos).
masculino(fagundes).
masculino(julio).
masculino(rodrigo).
masculino(luciano).
feminino(ana).
feminino(jessica).
feminino(maria).
feminino(helena).
feminino(joana).
feminino(heloisa).
feminino(marcia).
 
irmao(X,Y) :- X\=Y, progenitor(Z,X), progenitor(Z,Y),
    masculino(Y).
 
irma(X,Y) :- X\=Y, progenitor(Z,X), progenitor(Z,Y),
    feminino(Y).
 
descendente(X,Y) :- progenitor(X,Y), X\=Y.
descendente(X,Y) :- progenitor(X,W), descendente(W,Y), X\=Y. 
 
mae(X,Y) :- progenitor(X,Y), feminino(X).
 
pai(X,Y) :- progenitor(X,Y), masculino(X).
 
avo(X,Y) :- progenitor(W,Y), pai(X,W),!.
 
tio(X,Y) :- progenitor(W,Y), irmao(X,W), masculino(X).
 
primo(X,Y) :- progenitor(W,Y), progenitor(Z,X),
        (irmao(W,Z);irma(W,Z)).

%c)
%
% 1. ?- pai(jose,joao).
%  true
%
% 2. ?- mae(maria,X).
%  X = joao  X = ana  X = jessica  X = lucas
%
% 3. ?- primo(mario,X).
%  X = helena ; X = joana ;X = heloisa ;X = fagundes ;X = marcia ;X = julio ;
%
% 4. ?- tio(,Y).
%
% 5. ?- descendente(X,carlos).
%  X = helena ; X = mario ; X = jose ; X = maria ; X = ana ; X = joao ;
%
% 6. ?- irmao(helena,X). X = false
%    ?- irma(helena,X). X = joana
%
% 7. ?- avo(X,luciano). X = lucas
%
% 8. ?- avo(X,_).
%

%2)
%a)
adiciona(X, R, [X|R]).
 
%b)
apaga(_,[],[]) :- !.
apaga(E,[E|B],L) :- apaga(E, B, L).
apaga(E, [Y|B], [Y|L]) :-
    E \= Y,
    apaga(E, B, L).

%c)
membro(X,[X|_]) :- !.
membro(X,[_|Y]) :- membro(X, Y).
 
%d) 
concatena([],L,L) :- !.
concatena([X|Y],L,[X|R]) :-
    concatena(Y, L, R).
    
%e)
comprimento(1,[_]) :- !.
comprimento(C,[_|Y]) :- comprimento(C1, Y), C is C1+1.
 
%f)
maximo(X,[X]) :- !.
maximo(M,[X|Y]) :- maximo(MaiorResto, Y),
                   M is max(X, MaiorResto).
 
%g)
soma(X,[X]) :- !.
soma(S, [X|Y]) :- soma(S1, Y), S is X+S1.
 
media(X,L) :- soma(S,L),comprimento(C,L), 
              X is S/C.
 
%h)
ordenada([_]) :- !.
ordenada([X1,X2|Y]) :- ordenada([X2|Y]), X1 < X2. 

%3)
d(0,zero).
d(1,um).
d(2,dois).
d(3,tres).
d(4,quatro).
d(5,cinco).
d(6,seis).
d(7,sete).
d(8,oito).
d(9,nove).
d(10,dez).

txt([X],[P]) :- d(X,P), !.
txt([X|Y],[V|W]) :- d(X,V),
    txt(Y, W).

%4)
quadrado :- write('Escreva um numero ou stop: '),
    read(X),
    (X =@= 'stop' -> true;   
    	X1 is X*X,
        format('~w^2 é igual a ~w',[X,X1]), nl,
        quadrado
    ).

%5)
%a)
estrada(a, cidadeB, cidadeA, 150).
estrada(b, cidadeA, cidadeB, 90).
estrada(c, cidadeB, cidadeC, 211).
estrada(d, cidadeG, cidadeA, 300).
estrada(e, cidadeB, cidadeD, 50).
estrada(f, cidadeB, cidadeE, 89).
estrada(g, cidadeA, cidadeG, 187).
estrada(h, cidadeD, cidadeH, 254).
estrada(i, cidadeF, cidadeI, 621).
estrada(j, cidadeC, cidadeJ, 300).
estrada(k, cidadeI, cidadeJ, 41).
estrada(l, cidadeD, cidadeL, 99).
estrada(m, cidadeH, cidadeM, 148).
estrada(n, cidadeP, cidadeM, 163).
estrada(o, cidadeA, cidadeO, 69).
estrada(p, cidadeK, cidadeL, 10).
estrada(q, cidadeJ, cidadeL, 364).
estrada(r, cidadeR, cidadeL, 79).
estrada(s, cidadeL, cidadeO, 193).
estrada(t, cidadeK, cidadeR, 311).
estrada(u, cidadeK, cidadeU, 577).
estrada(v, cidadeN, cidadeP, 150).
estrada(x, cidadeA, cidadeD, 100).

conectado(X, Y, Custo) :- estrada(_, X, Y, Custo).

%b)
rota(A, B, R, C) :- rota_aux(A, B, [A], R, 0, C).

rota_aux(A, A, Acc, Acc, Custo, Custo).

rota_aux(A, B, Acc, R, CustoAtual, CustoTotal) :-
    conectado(A, X, Custo),
    \+ member(X, Acc), 
    NovoCustoAtual is CustoAtual + Custo,
    rota_aux(X, B, [X | Acc], R, NovoCustoAtual, CustoTotal).

%c)
rotaC(A, R, C) :- rotaCAux(A, [A], R, 0, C).

rotaCAux(A, [A | Acc], [A | Acc], CustoAtual, CustoAtual).

rotaCAux(A, Acc, R, CustoAtual, CustoTotal) :-
    conectado(X, A, Custo),
    \+ member(X, Acc), 
    NovoCustoAtual is CustoAtual + Custo,
    rotaCAux(X, [X | Acc], R, NovoCustoAtual, CustoTotal).

%d)
rotaS(A, R, C) :- rotaSAux(A, [A], R, 0, C).

rotaSAux(A, [A | Acc], [A | Acc], CustoAtual, CustoAtual).

rotaSAux(A, Acc, R, CustoAtual, CustoTotal) :-
    conectado(A, X, Custo),
    \+ member(X, Acc),
    NovoCustoAtual is CustoAtual + Custo,
    rotaSAux(X, [X | Acc], R, NovoCustoAtual, CustoTotal).

%e)
rotaM(B, R, CustoLimite) :- rotaMAux(B, [B], R, 0, CustoLimite).

rotaMAux(B, [B | Acc], [B | Acc], CustoAtual, CustoLimite) :-
    CustoAtual < CustoLimite.

rotaMAux(B, Acc, R, CustoAtual, CustoLimite) :-
    conectado(X, B, Custo),
    \+ member(X, Acc),
    NovoCustoAtual is CustoAtual + Custo,
    NovoCustoAtual < CustoLimite,
    rotaMAux(X, [X | Acc], R, NovoCustoAtual, CustoLimite).

%6)
main6 :-
    write('Digite o termo a ser procurado: '),
    read(Termo),
    achaTermo(Termo).

achaTermo(Termo) :-
    open('Teste.txt', read, X),
    repeat,
    read(X, TermoArquivo),
    ( TermoArquivo == end_of_file -> close(X), ! ; 
        TermoArquivo == Termo, write(TermoArquivo), close(X),!
    ).

%7)
main7 :-
    write('Digite o termo a ser procurado: '),
    read(Termo),
    achaTodos(Termo).

achaTodos(Termo) :-
    open('Teste.txt', read, X),
    repeat,
    read(X, TermoArquivo),
    ( TermoArquivo == end_of_file -> close(X), ! ; 
        TermoArquivo == Termo,write(TermoArquivo), nl, fail
    ).

%8)

relatorio :- open('clientes.txt', read, S),
    X is 1,
    tabela,
    lerLinha(S, X),
    close(S).

lerLinha(Str, X) :- 
    (at_end_of_stream(Str) -> true;   
    read(Str, cliente(Nome, End, Nro)), tab(3),
    write(X),tab(5),
    write(Nome), tab(4),
    write(End), tab(6),
    write(Nro), nl,
    X1 is X + 1,
    lerLinha(Str,X1)).

tabela :-
    write('Cliente'), tab(4),
    write('Nome'), tab(5),
    write('Endereço'), tab(3),
    write('Telefone'), nl.