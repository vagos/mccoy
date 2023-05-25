% https://www.cdc.gov/malaria/about/faqs.html
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3375727/

% Symptoms of Malaria

symptom(fever).
symptom(flu_like_illness).
symptom(shaking_chills).
symptom(headache).
symptom(muscle_aches).
symptom(tiredness).
symptom(nausea).
symptom(vomiting).
symptom(diarrhea).
symptom(anemia).
symptom(jaundice).
symptom(kidney_failure).

% Indication of having malaria
diagnosis(malaria) :- has(symptom(fever)),
               has(symptom(flu_like_illness)),
               has(symptom(shaking_chills)),
               has(symptom(headache)),
               has(symptom(muscle_aches)),
               has(symptom(nausea)),
               has(symptom(vomiting)).

% Check if someone has malaria or not
:- not diagnosis(malaria).
