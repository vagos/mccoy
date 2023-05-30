% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7112285/
% https://www.lung.org/lung-health-diseases/lung-disease-lookup/pneumonia/symptoms-and-diagnosis

% Symptoms of Pneumonia

symptom(cough).
symptom(cough_with_mucus).
symptom(chest_pain).
symptom(headache).
symptom(arthralgia).
symptom(nausea).
symptom(vomiting).
symptom(abdominal_pain).
symptom(fever).
symptom(tachypnea).
symptom(labored_breathing).
symptom(shortness_of_breath).
symptom(loss_of_appetite).
symptom(low_energy).
symptom(fatigue).
symptom(rhonchi).
symptom(crackles).
symptom(wheezing).
symptom(grunting).
symptom(nasal_flaring).
symptom(chest_retractions).
symptom(sweating).

has(symptom(cough)) :- has(symptom(cough_with_mucus)).

% Diagnosis of pneumonia
diagnosis(pneumonia) :- has(symptom(cough)),
                        has(symptom(chest_pain)),
                        has(symptom(headache)),
                        has(symptom(arthralgia)),
                        has(symptom(nausea)),
                        has(symptom(vomiting)),
                        has(symptom(abdominal_pain)),
                        has(symptom(fever)),
                        has(symptom(tachypnea)),
                        has(symptom(labored_breathing)),
                        has(symptom(shortness_of_breath)),
                        has(symptom(loss_of_appetite)),
                        has(symptom(low_energy)),
                        has(symptom(fatigue)),
                        has(symptom(rhonchi)),
                        has(symptom(crackles)),
                        has(symptom(wheezing)),
                        has(symptom(grunting)),
                        has(symptom(nasal_flaring)),
                        has(symptom(chest_retractions)),
                        has(symptom(sweating)).
