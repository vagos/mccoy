import clorm
import clorm.clingo as clingo

class Diagnosis(clorm.Predicate):
    name=clorm.ConstantField

class Symptom(clorm.Predicate):
    name=clorm.ConstantField

class Indicator(clorm.Predicate):
    name=clorm.ConstantField

ctrl = clingo.Control(arguments=[], unifier=[Diagnosis, Symptom, Indicator])
ctrl.load("clingo/main.pl")

instace = clorm.FactBase()

ctrl.add_facts(instace)
ctrl.ground([("base",[])])

def on_model(model):
    solution = model.facts(atoms=True)
    query=solution.query(Diagnosis)

    print("Diagnosis: ")
    for q in query.all():
        print("* ", q.name)

ctrl.solve(on_model=on_model)
