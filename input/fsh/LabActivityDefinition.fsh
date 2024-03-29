Alias: LOINC = http://loinc.org

Profile: LabActivityDefinition
Parent: ActivityDefinition
Id: lab-activity
Title: "Lab Test Activity"
Description: "A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes."
* kind = #ServiceRequest
* observationResultRequirement only Reference(LabObservationDefinition)

Instance: act-neutrophils-in-blood
InstanceOf: LabActivityDefinition
Title: "Neutrophils in blood ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/fhir/LabActivityDefinition/751-8"
* status = #draft
* description = "Neutrophils in blood measurement"
* kind = #ServiceRequest
* code = LOINC#751-8 "Neutrophils in blood"
* observationResultRequirement = Reference(ObservationDefinition/obs-neutrophils-in-blood)

Mapping: RareCareLabToActivityDefinition
Source: LabActivityDefinition
Target: "RareCareDataModel"
Title: "Rare Care Data Model"
* -> "Test"
* code.coding.code -> "Test.LOINC.code"
* code.coding.display -> "Test.LOINC.name"

Instance: act-retinol-in-serum-plasma
InstanceOf: LabActivityDefinition
Title: "Retinol (Vitamin A) in serum/plasma ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/fhir/LabActivityDefinition/14905-4"
* status = #draft
* description = "Retinol (Vitamin A) in serum/plasma"
* kind = #ServiceRequest
* code = LOINC#751-8 "Retinol (Vitamin A) in serum/plasma"
* observationResultRequirement = Reference(bservationDefinition/obs-retinol-in-serum-plasma)

Instance: act-calcidiol-in-serum-plasma
InstanceOf: LabActivityDefinition
Title: "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma ActivityDefinition"
Usage: #example

* url = "https://rarecare.world/fhir/LabActivityDefinition/14635-7"
* status = #draft
* description = "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* kind = #ServiceRequest
* code = LOINC#14635-7 "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* observationResultRequirement = Reference(ObservationDefinition/obs-calcidiol-in-serum-plasma)