Alias: LOINC = http://loinc.org

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

* url = "https://rarecare.world/fhir/LabActivityDefinition/751-8"
* status = #draft
* description = "Neutrophils in blood measurement"
* kind = #ServiceRequest
* code = LOINC#751-8 "Neutrophils in blood"
* observationRequirement.reference = "#loinc-751-8"

Mapping: RareCareFHIRtoDataModel
Source: LabActivityDefinition
Target: "Rare Care Data Model"
Title: "Rare Care Data Model"
* -> "Test"
* code -> "Test.LOINC.code"

Instance: act-retinol-in-serum-plasma
InstanceOf: LabActivityDefinition
Title: "Retinol (Vitamin A) in serum/plasma ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/fhir/LabActivityDefinition/14905-4"
* status = #draft
* description = "Retinol (Vitamin A) in serum/plasma"
* kind = #ServiceRequest
* code = LOINC#751-8 "Retinol (Vitamin A) in serum/plasma"
* observationRequirement.reference = "#loinc-14905-4"

Instance: act-calcidiol-in-serum-plasma
InstanceOf: LabActivityDefinition
Title: "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/fhir/LabActivityDefinition/14635-7"
* status = #draft
* description = "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* kind = #ServiceRequest
* code = LOINC#14635-7 "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* observationRequirement.reference = "#loinc-14635-7"