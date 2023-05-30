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
