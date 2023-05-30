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
  has(symptom(fatigue)),
  has(symptom(weakness)),
  has(symptom(pale_skin)),
  has(indicator(low_hemoglobin)),
  has(indicator(low_hematocrit)),
  has(indicator(low_MCV)),
  has(indicator(low_MCH)),
  has(indicator(low_MCHC)).

diagnosis(anemia) :-
  has(symptom(shortness_of_breath)),
  has(symptom(chest_pain)),
  has(symptom(dizziness)),
  has(symptom(cold_hands_feet)),
  has(symptom(headache)),
  has(symptom(irregular_heartbeat)),
  has(symptom(pica)),
  has(indicator(low_hemoglobin)),
  has(indicator(low_hematocrit)),
  has(indicator(low_MCV)),
  has(indicator(low_MCH)),
  has(indicator(low_MCHC)),
  has(indicator(low_serum_iron)),
  has(indicator(low_ferritin)),
  has(indicator(high_TIBC)).
