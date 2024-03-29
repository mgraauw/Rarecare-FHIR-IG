Alias: SCT = http://snomed.info/sct
Alias: ORPHA = http://www.orpha.net

Profile: RareCarePlanDefinition
Parent: DiseasePlanDefinition
Id: rare-care-plan
Title: "Rare Condition Management Plan"
Description: "The PlanDefinition for a rare conditions refers to PlanDefinitions of other diseases, 
i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia. A code from Orphanet is required."

// * relatedArtifact 1..* "Link to General Medical Guideline or Patient Organization, or other resources."
* goal.addresses from ORPHA
// Sushi bug, see: https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Setting.20canonical.20values
// * action.definition[x] only PlanDefinition

Mapping: RareConditiontoPlanDefinition
Source: RareCarePlanDefinition
Target: "RareCareDataModel"
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

* url = "https://rarecare.world/fhir/PlanDefinition/shwachman-diamond-syndrome"
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
* action[=].definitionCanonical = "https://rarecare.world/fhir/PlanDefinition/neutropenia"
* action[+].title = "Pancreas Insufficiency"
* action[=].definitionCanonical = "https://rarecare.world/fhir/PlanDefinition/pancreas-insufficiency"
* action[+].title = "Developmental disability"
* action[=].definitionCanonical = "https://rarecare.world/fhir/PlanDefinition/developmental-disability"
* action[+].title = "Vragenlijst participatie voor Shwachman Diamond Syndroom"
* action[=].definitionCanonical = "https://rarecare.world/fhir/Questionnaire/shwachman-diamond-syndrome"
