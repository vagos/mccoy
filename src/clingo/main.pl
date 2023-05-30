% Final medical knowledge base in clingo

symptom(s1).
symptom(s2).
symptom(s3).

indicator(i1).
indicator(i2).
indicator(i3).

{ add(symptom(S)) : symptom(S) }.

has(symptom(S)) :- add(symptom(S)).

diagnosis(disease1) :- 
    has(symptom(s1)).

diagnosis(disease2) :- 
    has(symptom(s2)),
    has(indicator(i1)).

diagnosis(disease3) :- 
    has(symptom(s1)),
    has(symptom(s2)),
    has(indicator(i1)).

diagnosis(disease4) :- 
    has(symptom(s2)).

:- not diagnosis(_).

#minimize { 1, S : has(S) }.

%!show_trace diagnosis(D).

#show diagnosis/1.
#show has/1.
