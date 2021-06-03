Alias: LOINC = http://loinc.org

Profile: LabObservationDefinition
Parent: ObservationDefinition
Id: lab-observation
Title: "Lab Test Observation"
Description: "A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes."

* code from LOINC

Instance: obs-neutrophils-in-blood
InstanceOf: ObservationDefinition

Title: "Neutrophils in blood ObservationDefinition"
Usage: #example

* code = LOINC#751-8 "Neutrophils in blood"