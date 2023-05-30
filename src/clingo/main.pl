% Final medical knowledge base in clingo

{ add(symptom(S)) : symptom(S) }.

has(symptom(S)) :- add(symptom(S)).

has(symptom(S2)) :- has(symptom(S1)),
                    linked_symptom(S1, S2).

:- not diagnosis(_).

#minimize { 1, S : has(S) }.

%!show_trace diagnosis(D).
