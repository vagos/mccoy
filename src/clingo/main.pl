% Final medical knowledge base in clingo

symptom(s1).
symptom(s2).
symptom(s3).

indicator(i1).
indicator(i2).
indicator(i3).

1 { add(symptom(S)) : symptom(S) } 1.

has(symptom(S)) :- add(symptom(S)).

diagnosis(disease1) :- 
    has(symptom(s1)).

diagnosis(disease2) :- 
    has(symptom(s2)),
    has(indicator(i1)).

#maximize { 1, D : diagnosis(D) }.

:- not diagnosis(_).

%!show_trace diagnosis(D).
