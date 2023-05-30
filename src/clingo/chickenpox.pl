% https://www.ncbi.nlm.nih.gov/books/NBK448191/

% Symptoms of Chickenpox

symptom(aching_muscles).
symptom(nausea).
symptom(decreased_appetite).
symptom(headache).
symptom(rash).
symptom(oral_sores).
symptom(malaise).
symptom(low_grade_fever).
symptom(small_red_dots).
symptom(bumps).
symptom(blisters).
symptom(pustules).
symptom(scabs).
symptom(ulcers_in_oral_cavity).

% Diagnosis of chickenpox
dagnosis(chickenpox) :- has(symptom(rash)),
                  has(symptom(oral_sores)),
                  has(symptom(ulcers_in_oral_cavity)),
                  has(symptom(small_red_dots)),
                  has(symptom(bumps)),
                  has(symptom(blisters)),
                  has(symptom(pustules)),
                  has(symptom(scabs)),
                  has(symptom(malaise)).

diagnosis(chickenpox) :- has(symptom(itching)),
                        has(symptom(fatigue)),
                        has(symptom(lethargy)),
                        has(symptom(high_fever)),
                        has(symptom(loss_of_appetite)),
                        has(symptom(mild_fever)),
                        has(symptom(swelled_lymph_nodes)),
                        has(symptom(malaise)),
                        has(symptom(red_spots_over_body)).

diagnosis(chickenpox) :- has(symptom(itching)),
                        has(symptom(skin_rash)),
                        has(symptom(fatigue)),
                        has(symptom(high_fever)),
                        has(symptom(loss_of_appetite)),
                        has(symptom(mild_fever)),
                        has(symptom(swelled_lymph_nodes)),
                        has(symptom(malaise)),
                        has(symptom(red_spots_over_body)).

diagnosis(chickenpox) :- has(symptom(itching)),
                        has(symptom(fatigue)),
                        has(symptom(lethargy)),
                        has(symptom(high_fever)),
                        has(symptom(headache)),
                        has(symptom(loss_of_appetite)),
                        has(symptom(mild_fever)),
                        has(symptom(swelled_lymph_nodes)),
                        has(symptom(malaise)),
                        has(symptom(red_spots_over_body)).

linked_symptom(skin_rash, red_spots_over_body).
linked_symptom(itching, red_spots_over_body).

linked_symptom(skin_rash, lethargy).
linked_symptom(fatigue, lethargy).

linked_symptom(skin_rash, headache).
linked_symptom(high_fever, headache).

linked_symptom(skin_rash, mild_fever).
linked_symptom(loss_of_appetite, mild_fever).

linked_symptom(skin_rash, swelled_lymph_nodes).
linked_symptom(fatigue, swelled_lymph_nodes).

linked_symptom(skin_rash, malaise).
linked_symptom(fatigue, malaise).

linked_symptom(mild_fever, high_fever).
linked_symptom(high_fever, mild_fever).
linked_symptom(mild_fever, fever).
