Alias: SCT = http://snomed.info/sct
Alias: ORPHA = http://www.orpha.net

Profile: RareCarePlanDefinition
Parent: disease-plan
Id: rare-care-plan
Title: "Rare Condition Management Plan"
Description: "The PlanDefinition for a rare conditions refers to PlanDefinitions of other diseases, 
i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia. A code from Orphanet is required."

* goal.addresses from ORPHA
* action.definition[x] = Canonical(DiseasePlanDefinition)

Instance: plan-sds
InstanceOf: RareCarePlanDefinition

Title: "Shwachman Diamond Syndrome PlanDefinition"
Usage: #example

//* url = "http://rarecare.world/PlanDefinition/shwachman-diamond-syndrome"
//* identifier.use = #official"
//* identifier.value ="shwachman-diamond-syndrome-plan"
* status = #draft
* version = "0.1"
* title = "Shwachman Diamond Syndrome Management"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* date = 2021-01-14
* publisher = "Stichting Rare Care World"
* description = "Shwachman Diamond Syndrome personal management plan."
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* relatedArtifact.type = #justification 
* relatedArtifact.url = "https://rarecare.world/general-medical-guideline/shwachman-diamond-syndrome"
* relatedArtifact.type = #justification
* relatedArtifact.url = "https://rarecare.world/patient-organisation/shwachman-syndrome-support-holland"
// * goal.description ="Shwachman Diamond Syndrome management"
// * goal.addresses.coding = ORPHA#ORPHA:811 "Shwachman-Diamond syndrome"
// * action.title ="Neutropenia"
// * action.definitionCanonical ="http://rarecare.world/PlanDefinition/neutropenia"