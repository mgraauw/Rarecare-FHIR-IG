Alias: LOINC = http://loinc.org

Profile: LabObservationDefinition
Parent: ObservationDefinition
Id: lab-observation
Title: "Lab Test Observation"
Description: "A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes."

Mapping: RareCareLabToObservationDefinition
Source: LabObservationDefinition
Target: "RareCareDataModel"
Title: "Rare Care Data Model"
* -> "Test"
* code.coding.code -> "Test.LOINC.code"
* code.coding.display -> "Test.LOINC.name"

Instance: obs-neutrophils-in-blood
InstanceOf: LabObservationDefinition
Title: "Neutrophils in blood ObservationDefinition"
Usage: #example
* code = LOINC#751-8 "Neutrophils in blood"

Instance: obs-retinol-in-serum-plasma
InstanceOf: LabObservationDefinition
Title: "Retinol (Vitamin A) in serum/plasma ActivityDefinition"
Usage: #example
* code = LOINC#751-8 "Retinol (Vitamin A) in serum/plasma"

Instance: obs-calcidiol-in-serum-plasma
InstanceOf: LabObservationDefinition
Title: "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma ActivityDefinition"
Usage: #example
* code = LOINC#14635-7 "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"