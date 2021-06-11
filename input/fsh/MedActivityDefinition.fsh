Alias: ATC = http://www.whocc.no/atc

Profile: MedActivityDefinition
Parent: ActivityDefinition
Id: med-activity
Title: "Medication Administration Activity"
Description: "A Disease is treated with medication."

* kind = #MedicationRequest

Instance: act-pancreatine
InstanceOf: MedActivityDefinition
Title: "Pancreatine"
Usage: #example

* url = "https://rarecare.world/fhir/MedActivityDefinition/A09AA02"
* status = #draft
* description = "Pancreatine"
* kind = #MedicationRequest
* code = ATC#A09AA02 "MULTI-ENZYMEN (LIPASE, PROTEASE, ENZ)"