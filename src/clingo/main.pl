% Final medical knowledge base in clingo

{ add(symptom(S)) : symptom(S) }.

has(symptom(S)) :- add(symptom(S)).

:- not diagnosis(_).

#minimize { 1, S : has(S) }.

%!show_trace diagnosis(D).

#show diagnosis/1.
#show has/1.
