% Data taken from: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3685880/

% Symptoms of anemia
symptom(fatigue).
symptom(weakness).
symptom(pale_skin).
symptom(shortness_of_breath).
symptom(chest_pain).
symptom(dizziness).
symptom(cold_hands_feet).
symptom(headache).
symptom(irregular_heartbeat).
symptom(pica).

% Medical indicators of anemia
indicator(low_hemoglobin).
indicator(low_hematocrit).
indicator(low_MCV).
indicator(low_MCH).
indicator(low_MCHC).
indicator(low_serum_iron).
indicator(low_ferritin).
indicator(high_TIBC).

% Rules for diagnosing anemia
diagnosis(anemia) :-
  symptom(fatigue),
  symptom(weakness),
  symptom(pale_skin),
  indicator(low_hemoglobin),
  indicator(low_hematocrit),
  indicator(low_MCV),
  indicator(low_MCH),
  indicator(low_MCHC).

diagnosis(anemia) :-
  symptom(shortness_of_breath),
  symptom(chest_pain),
  symptom(dizziness),
  symptom(cold_hands_feet),
  symptom(headache),
  symptom(irregular_heartbeat),
  symptom(pica),
  indicator(low_hemoglobin),
  indicator(low_hematocrit),
  indicator(low_MCV),
  indicator(low_MCH),
  indicator(low_MCHC),
  indicator(low_serum_iron),
  indicator(low_ferritin),
  indicator(high_TIBC).
