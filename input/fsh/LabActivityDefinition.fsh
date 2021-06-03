Profile: LabActivityDefinition
Parent: ActivityDefinition
Id: lab-activity
Title: "Lab Test Activity"
Description: "A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes."

* kind = #ServiceRequest
* observationResultRequirement = Reference(LabObservationDefinition)

Instance: act-neutrophils-in-blood
InstanceOf: LabActivityDefinition

Title: "Neutrophils in blood ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/751-8"
* status = #draft
* description = "Neutrophils in blood measurement"
* kind = #ServiceRequest
* code = LOINC#751-8 "Neutrophils in blood"
* observationRequirement.reference = "#loinc-751-8"