% simula uma arvore genealogica

pai(joao,joaquim).% joao eh pai de joaquim.
pai(joao,lucas).
pai(pedro,silvia).
pai(joaquim,bruno).
mae(maria,joaquim). % maria eh mae de joaquim .
mae(maria,lucas) .
mae(laura,silvia) .
mae(silvia,bruno) .
irmao(X,Y):-pai(K,X),pai(K,Y),X\=Y;mae(L,X),mae(L,Y),X\=Y.
tio(X,Y):-pai(L,Y),irmao(X,L);mae(K,Y),irmao(X,K).

% comprimento de uma lista
comprimento(0,[]).
comprimento(X,[_|Y]):- comprimento(X1,Y), X is X1 +1.

% acha o n-esimo numero de uma lista
nesimo(1,[X|_],X).
nesimo(Y,[_|Z],X):- Y1 is Y - 1, nesimo(Y1,Z,X).

% concatena duas listas
ap([],L,L).
ap([X|L1], L2, [X|L3]) :- ap(L1, L2, L3).

% apaga um item de uma lista
apaga(X,[X|Y],Y).
apaga(X,[Y|Z],[Y|Z1]) :- apaga(X, Z, Z1).

% acha o maximo de uma lista
maximo(X,[X]).
maximo(X,[X|C]):- maximo(Y,C), X > Y,!.
maximo(Y,[_|C]):- maximo(Y,C).

% a soma total de uma lista
total([],0).
total([X|Y],K):-total(Y,A), K is X + A.


% COMEÇO DOS EXERICICIOS 

% Exercicio 1
analisa_lista([X|Y]):-write('a cabeca da lista eh '),write(X),write('\na cauda da lista eh '),write(Y).
analisa_lista([]):-write('Lista vazia').

% exercicio 2
pertence(X,[X|_]).
pertence(X,[_|B]):-pertence(X,B).

remove_duplicados([],[]).
remove_duplicados([A|B],L):-pertence(A,B),remove_duplicados(B,L).
remove_duplicados([A|B],[A|L]):- not(pertence(A,B)),remove_duplicados(B,L).


% exercicio 3
troca([],_,_,[]).
troca([X|K],X,Y,[Y|L]):-troca(K,X,Y,L).
troca([Z|K],X,Y,[Z|L]):- Z \== X ,troca(K,X,Y,L).

% exercicio 4
subconjunto([],[]).
subconjunto([A|B],[A|C]):- subconjunto(B,C).
subconjunto([_|B],C):- subconjunto(B,C).

potencia(X,Y):- findall(L,subconjunto(X,L),Y).

% exercicio 5
mais_longa([_],[]).
mais_longa([_|X],[_|Y]):-mais_longa(X,Y).


% exercicio 6
distancia((A,B),(C,D),X):- S is (C - A) * (C - A) + (D - B) * (D - B), X is sqrt(S).


% exercicio 7
linha(0,_):- nl, !.
linha(N,C):- write(C), write(' '), N1 is N - 1, linha(N1,C).

quadro(0,_,_):- !.
quadro(N,M,C):- linha(M,C), N1 is N - 1, quadro(N1,M,C),!.

quadrado(N,C):- quadro(N,N,C).

% exercicio 8
elemento_n([X|_],1,X).
elemento_n([_|Z],Y,X):- Y1 is Y - 1, elemento_n(Z,Y1,X).


% exercicio 9
soman([],0).
soman([X|Y],R):-soman(Y,L1), R is L1 + X.

% usa a funcao comprimento ja escrita

media([],0).
media(X,R):- soman(X,A) , comprimento(B,X), R is A/B.

% exercicio 10
minimo([A],A):- !.
minimo([A|B],A):- minimo(B,C), A < C, !.
minimo([_|B],C):- minimo(B,C).

% exercicio 11
intervalo(X,X,[X]):-!.
intervalo(X,Y,[X|Z]):- X < Y, X1 is X + 1, intervalo(X1,Y,Z).

% exercicio 12
mdc(X,X,X).
mdc(X,Y,D) :- X < Y, Y1 is Y - X, mdc(X,Y1,D).
mdc(X,Y,D) :- Y < X, mdc(Y,X,D).

% exercicio 13
ocorrencia(_,[],0) :- !.
ocorrencia(X,[X|Y],C) :- ocorrencia(X,Y,C1), C is C1 + 1, !.
ocorrencia(X,[_|Y],C) :- ocorrencia(X,Y,C).

% exercicio 14
divisores(N,L):- findall(X,(between(1,N,X),N mod X =:= 0),L).

