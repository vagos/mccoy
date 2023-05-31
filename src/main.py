import clorm
import clorm.clingo as clingo
import xclingo

import argparse
import sys
import difflib
import os

import data

class Diagnosis(clorm.Predicate):
    name=clorm.ConstantField

class Symptom(clorm.Predicate):
    name=clorm.ConstantField

class Indicator(clorm.Predicate):
    name=clorm.ConstantField

class HasSymptom(clorm.Predicate):
    symptom=Symptom.Field

    class Meta:
        name="has"

class HasIndicator(clorm.Predicate):
    indicator=Indicator.Field

    class Meta:
        name="has"

known_diseases = ["chickenpox", "pneumonia"]

def explain(symptoms):
    knowledge_base_file = "knowledge.pl"
    data.create_knowledge_base(knowledge_base_file)

    with open(knowledge_base_file, 'a') as kb_file:
        for s in symptoms:
            kb_file.write(f"{str(s)}.\n")

    output = os.popen(f"./util/xclingo.sh {knowledge_base_file}").read()
    return output

def get_knowledge_base(n=0):
    ctrl = clingo.Control(arguments=[f"-n {n}"], unifier=[Diagnosis, Symptom, Indicator])
    
    for d in known_diseases:
        ctrl.load("clingo/{}.pl".format(d))
    ctrl.load("clingo/main.pl")

    return ctrl

def diagnose(symptoms):

    ctrl = get_knowledge_base()

    instace = clorm.FactBase(symptoms)

    ctrl.add_facts(instace)
    ctrl.ground([("base",[])])

    possible_diagnosis = []

    def on_model(model):
        solution = model.facts(atoms=True)
        query=solution.query(Diagnosis)

        for q in query.all():
            possible_diagnosis.append(q.name)

        query=solution.query(HasSymptom)

    ctrl.solve(on_model=on_model)

    return possible_diagnosis

def get_symptoms():

    symptoms = set()

    def on_model(model):
        solution = model.facts(atoms=True)
        query=solution.query(Symptom)
        for q in query.all():
            symptoms.add(q.name)
    
    ctrl = get_knowledge_base(1)
    ctrl.ground([("base",[])])

    ctrl.solve(on_model=on_model)

    return symptoms

def main_cli():

    parser = argparse.ArgumentParser(description='Diagnostic tool', 
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--symptoms', nargs='+', help='Patient Symptoms', required=False)
    parser.add_argument('--indicators', nargs='+', help='Patient Indicators', required=False)
    args = parser.parse_args()
    symptoms = args.symptoms

    print("Symptoms: ", symptoms, file=sys.stderr)
    print("Indicators: ", args.indicators, file=sys.stderr)

    patient_facts = []
    for symptom in symptoms or []:
        patient_facts.append(HasSymptom(Symptom(symptom)))

    for indicator in args.indicators or []:
        patient_facts.append(HasIndicator(Indicator(indicator)))

    diagnose(patient_facts)

def get_close_word(word, words):
    close_words = difflib.get_close_matches(word, words, n=1)
    if close_words:
        return close_words[0]
    return word

TESTING_DISEASE = ['pneumonia', 'chickenpox']

def test():
    patients = data.get_patients()
    patients = [p for p in patients if p.diagnosis in TESTING_DISEASE]

    accuracy = 0
    
    all_symptoms = get_symptoms()
    print("All symptoms: ", all_symptoms, file=sys.stderr)

    for p in patients:
        patient_facts = []
        for s in p.symptoms:
            # s = get_close_word(s, all_symptoms) # Sometimes makes incorrect predictions, will fix.
            patient_facts.append(HasSymptom(Symptom(s)))
        
        diagnosis = diagnose(patient_facts)
        explanation = explain(patient_facts)
        diagnosis = diagnosis[-1]
        print(f"Diagnostics: {diagnosis} Real: {p.diagnosis}")

        accuracy += 1 if diagnosis == p.diagnosis else 0

    print(f"Accuracy: {accuracy / len(patients)}")

if __name__ == '__main__':
    test()
