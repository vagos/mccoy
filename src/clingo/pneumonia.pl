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

% Rules linking symptoms

linked_symptom(phlegm, cough_with_mucus).
linked_symptom(breathlessness, shortness_of_breath).

% Cough with mucus can be associated with wheezing and shortness of breath
linked_symptom(cough_with_mucus, wheezing).
linked_symptom(cough_with_mucus, shortness_of_breath).

% Chest pain can be associated with cough and shortness of breath
linked_symptom(chest_pain, cough).
linked_symptom(chest_pain, shortness_of_breath).

% Headache can be associated with fatigue
linked_symptom(headache, fatigue).

% Fever can be associated with fatigue and loss of appetite
linked_symptom(fever, fatigue).
linked_symptom(fever, loss_of_appetite).

% Tachypnea can be associated with labored breathing and shortness of breath
linked_symptom(tachypnea, labored_breathing).
linked_symptom(tachypnea, shortness_of_breath).

% Rhonchi can be associated with wheezing and crackles
linked_symptom(rhonchi, wheezing).
linked_symptom(rhonchi, crackles).

% Grunting can be associated with chest retractions
linked_symptom(grunting, chest_retractions).

% Nasal flaring can be associated with chest retractions
linked_symptom(nasal_flaring, chest_retractions).

% Diagnosis of Pneumonia
diagnosis(pneumonia) :- has(symptom(cough)),
                        has(symptom(cough_with_mucus)),
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

% Alternative Diagnoses for Pneumonia
diagnosis(pneumonia) :- has(symptom(cough_with_mucus)),
                        has(symptom(chest_pain)),
                        has(symptom(fever)),
                        has(symptom(labored_breathing)),
                        has(symptom(shortness_of_breath)).

diagnosis(pneumonia) :- has(symptom(cough_with_mucus)),
                        has(symptom(fever)),
                        has(symptom(rhonchi)),
                        has(symptom(grunting)),
                        has(symptom(nasal_flaring)),
                        has(symptom(chest_retractions)).

diagnosis(pneumonia) :- has(symptom(cough_with_mucus)),
                        has(symptom(fever)),
                        has(symptom(tachypnea)),
                        has(symptom(shortness_of_breath)),
                        has(symptom(sweating)).
