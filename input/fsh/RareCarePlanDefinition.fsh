Alias: SCT = http://snomed.info/sct
Alias: ORPHA = http://www.orpha.net

Profile: RareCarePlanDefinition
Parent: disease-plan
Id: rare-care-plan
Title: "Rare Condition Management Plan"
Description: "The PlanDefinition for a rare conditions refers to PlanDefinitions of other diseases, 
i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia. A code from Orphanet is required."

* goal.addresses from ORPHA
// * action.definition[x] = Canonical(DiseasePlanDefinition)

Mapping: RareCareFHIRtoDataModel
Source: RareCarePlanDefinition
Target: "Rare Care Data Model"
Title: "Rare Care Data Model"
* -> "RareCondition"
* description -> "RareCondition.name + 'management'"
* relatedArtifact.url -> "https://rarecare.world/fhir/rarecondition/ + RareCondition.name"
* relatedArtifact -> "General Medical Guideline"
* relatedArtifact -> "Patient Organization"
* goal.addresses -> "RareCondition.ORPHA.code"
* goal.description.text -> "RareCondition.name + 'management plan'"
* action -> "Disease related to RareCondition"

Instance: plan-sds
InstanceOf: RareCarePlanDefinition
Title: "Shwachman Diamond Syndrome PlanDefinition"
Usage: #example

* url = "http://rarecare.world/fhir/PlanDefinition/shwachman-diamond-syndrome"
* status = #draft
* version = "0.1"
* title = "Shwachman Diamond Syndrome Management"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* date = 2021-01-14
* publisher = "Stichting Rare Care World"
* description = "Shwachman Diamond Syndrome management plan."
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* relatedArtifact.type = #documentation 
* relatedArtifact.url = "https://rarecare.world/rare-condition/shwachman-diamond-syndrome"
* relatedArtifact.type = #justification 
* relatedArtifact.url = "https://rarecare.world/general-medical-guideline/shwachman-diamond-syndrome"
* relatedArtifact.type = #justification
* relatedArtifact.url = "https://rarecare.world/patient-organisation/shwachman-syndrome-support-holland"
* goal.description.text = "Shwachman Diamond Syndrome management"
* goal.addresses = ORPHA#ORPHA:811 "Shwachman-Diamond syndrome"
* action[+].title = "Neutropenia"
* action[=].definitionCanonical = "http://rarecare.world/fhir/PlanDefinition/neutropenia"
* action[+].title = "Pancreas Insufficiency"
* action[=].definitionCanonical = "http://rarecare.world/fhir/PlanDefinition/pancreas-insufficiency"
* action[+].title = "Developmental disability"
* action[=].definitionCanonical = "http://rarecare.world/fhir/PlanDefinition/developmental-disability"
* action[+].title = "Vragenlijst participatie voor Shwachman Diamond Syndroom"
* action[=].definitionCanonical = "http://rarecare.world/fhir/Questionnaire/shwachman-diamond-syndrome"
