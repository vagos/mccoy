% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7152197/

% Symptoms of the Common Cold

symptom(runny_nose).
symptom(stuffy_nose).
symptom(sneezing).
symptom(sore_throat).
symptom(cough).
symptom(headache).
symptom(fatigue).
symptom(body_aches).
symptom(watery_eyes).
symptom(low_grade_fever).

% Rules linking symptoms
linked_symptom(runny_nose, stuffy_nose).
linked_symptom(runny_nose, sneezing).
linked_symptom(stuffy_nose, headache).
linked_symptom(cough, sore_throat).
linked_symptom(cough, headache).
linked_symptom(fatigue, body_aches).
linked_symptom(fatigue, headache).
linked_symptom(sore_throat, watery_eyes).

has(symptom(Symptom2)) :- has(symptom(Symptom1)), linked_symptom(Symptom1, Symptom2).

% Diagnosis of the Common Cold
diagnosis(common_cold) :- has(symptom(runny_nose)),
                          has(symptom(stuffy_nose)),
                          has(symptom(sneezing)),
                          has(symptom(sore_throat)),
                          has(symptom(cough)),
                          has(symptom(headache)),
                          has(symptom(fatigue)),
                          has(symptom(body_aches)),
                          has(symptom(watery_eyes)).

diagnosis(sinusitis) :- has(symptom(stuffy_nose)),
                        has(symptom(headache)).

diagnosis(common_cold) :- has(symptom(runny_nose)),
                          has(symptom(sneezing)),
                          has(symptom(watery_eyes)).

diagnosis(common_cold) :- has(symptom(fever)),
                          has(symptom(body_aches)),
                          has(symptom(cough)).

diagnosis(common_cold) :- has(symptom(sore_throat)),
                          has(symptom(fatigue)).

diagnosis(common_cold) :- has(symptom(runny_nose)),
                          has(symptom(stuffy_nose)),
                          has(symptom(sneezing)),
                          has(symptom(headache)).

:- not diagnosis(common_cold).