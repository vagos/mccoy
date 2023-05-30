import os
import csv

DATASET = "../data/dataset.csv"

# read data from csv file
def read_data():
    with open(DATASET, 'r') as f:
        reader = csv.reader(f)
        data = list(reader)
    return data


data = read_data()

class Patient:

    def __init__(self, symptoms, diagnosis):
        self.symptoms = symptoms
        self.diagnosis = diagnosis

    def __repr__(self):
        return f"Patient(Diagnosis: {self.diagnosis}, Symptoms: {self.symptoms})"

def get_patients():
    patients = []
    
    for row in data[1:]:
        diagnosis = row[0].strip().lower().replace(' ', '')
        symptoms = [d.strip() for d in row[1:]]
        symptoms = [d for d in symptoms if d != '']
        patients.append(Patient(symptoms, diagnosis))
    return patients

def create_knowledge_base():
    with open('knowledge_base.pl', 'w') as outfile:
        for fname in os.listdir('clingo'):
            if fname.endswith('.pl'):
                with open(f'clingo/{fname}') as infile:
                    outfile.write(f"% {fname}\n")
                    outfile.write(infile.read())
