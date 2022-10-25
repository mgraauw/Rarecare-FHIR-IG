Alias: ATC = http://www.whocc.no/atc

Profile: MedActivityDefinition
Parent: ActivityDefinition
Id: med-activity
Title: "Medication Administration Activity"
Description: "A Disease is treated with medication."
* kind = #MedicationRequest

Mapping: RareCareMedicationToActivityDefinition
Source: MedActivityDefinition
Target: "RareCareDataModel"
Title: "Rare Care Data Model"
* -> "Medication"
* code.coding.code -> "Medication.ATC.code"
* code.coding.display -> "Medication.ATC.name"

Instance: act-pancreatine
InstanceOf: MedActivityDefinition
Title: "Pancreatine"
Usage: #example
* url = "https://rarecare.world/fhir/MedActivityDefinition/A09AA02"
* status = #draft
* description = "Pancreatine"
* kind = #MedicationRequest
* code = ATC#A09AA02 "MULTI-ENZYMEN (LIPASE, PROTEASE, ENZ)"