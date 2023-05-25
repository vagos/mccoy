% Data taken from: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6318240/

% Symptoms
symptom(fatigue).
symptom(pain).
symptom(cough).
symptom(lack_of_appetite).
symptom(insomnia).
symptom(dyspnea).
symptom(poor_outlook).
symptom(weight_loss).
symptom(hunger).
symptom(nausea).
symptom(appetite_disturbance).
symptom(symptom_distress).
symptom(hemoptysis).
symptom(chest_pain).
symptom(malaise).
symptom(breathlessness).

% Medical Indicators
medical_indicator(weight_change).
medical_indicator(kilocalorie_intake).
medical_indicator(nutritional_status).
medical_indicator(chronic_respiratory_disease).
medical_indicator(previous_chemotherapy).
medical_indicator(recurrent_disease).
medical_indicator(no_surgical_treatment).
medical_indicator(low_income).
medical_indicator(age_less_than_65).
medical_indicator(small_cell_lung_cancer).
medical_indicator(chemotherapy).
medical_indicator(supportive_care).

% Diagnosis
diagnosis(lung_cancer).
diagnosis(small_cell_lung_cancer).

% Rule for lung cancer symptoms
lung_cancer_symptom(X) :-
  symptom(X),
  diagnosis(lung_cancer).

% Rule for small cell lung cancer symptoms
small_cell_lung_cancer_symptom(X) :-
  symptom(X),
  diagnosis(small_cell_lung_cancer).

% Rule for medical indicators related to lung cancer
related_medical_indicator(X) :-
  medical_indicator(X),
  diagnosis(lung_cancer).

% Rule for medical indicators related to small cell lung cancer
related_medical_indicator(X) :-
  medical_indicator(X),
  diagnosis(small_cell_lung_cancer).
