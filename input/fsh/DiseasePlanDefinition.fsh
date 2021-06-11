Alias: SCT = http://snomed.info/sct
Alias: ORPHA = http://www.orpha.net
Alias: ICD10 = http://hl7.org/fhir/sid/icd-10

Profile: DiseasePlanDefinition
Parent: PlanDefinition
Id: disease-plan
Title: "Disease Management Plan"
Description: "The PlanDefinition for a rare conditions refers to PlanDefinitions of other diseases, 
i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia. The disease plan refers to 
medication, lab tests and other items for management of the disease."

* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* publisher = "Stichting Rare Care World"
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* action.definition[x] only canonical

Mapping: RareCareFHIRtoDataModel
Source: DiseasePlanDefinition
Target: "Rare Care Data Model"
Title: "Rare Care Data Model"
* -> "Disease"
* description -> "Disease.name + 'management'"
* relatedArtifact.url -> "https://rarecare.world/disease/ + Disease.name"
* goal.addresses -> "Disease.ICD10.code"
* goal.description.text -> "Disease.name + 'management plan'"
* action -> "Test or Medication for Disease"

Instance: plan-neutropenia
InstanceOf: DiseasePlanDefinition
Title: "Neutropenia PlanDefinition"
Usage: #example

* url = "http://rarecare.world/fhir/PlanDefinition/neutropenia"
* status = #draft
* version = "0.1"
* title = "Neutropenia Management"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* publisher = "Stichting Rare Care World"
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* date = 2021-01-14
* publisher = "Stichting Rare Care World"
* description = "Neutropenia management plan."
* relatedArtifact.type = http://hl7.org/fhir/related-artifact-type#documentation
* relatedArtifact.url = "https://rarecare.world/disease/neutropenia"
* goal.description.text = "Neutropenia management"
* goal.addresses = http://hl7.org/fhir/sid/icd-10#D70.9 "Neutropenia, unspecified"
* action.title = "Neutrophils in blood"
* action.definitionCanonical = "https://rarecare.world/fhir/LabActivityDefinition/751-8"

Instance: plan-pancreas-insufficiency
InstanceOf: DiseasePlanDefinition
Title: "Pancreas Insufficiëntie PlanDefinition"
Usage: #example

* url = "http://rarecare.world/fhir/PlanDefinition/pancreas-insufficiency"
* status = #draft
* version = "0.1"
* title = "Pancreas Insufficiëntie"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* publisher = "Stichting Rare Care World"
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* date = 2021-01-14
* publisher = "Stichting Rare Care World"
* description = "Pancreas Insufficiëntie management plan."
* relatedArtifact.type = http://hl7.org/fhir/related-artifact-type#documentation
* relatedArtifact.url = "https://rarecare.world/disease/pancreas-insufficiency"
* goal.description.text = "Pancreas Insufficiëntie management"
* goal.addresses = http://hl7.org/fhir/sid/icd-10#K86.81 "Exocrine pancreatic insufficiency"
* action[+].title = "Retinol (Vitamin A) in serum/plasma"
* action[=].definitionCanonical = "https://rarecare.world/fhir/LabActivityDefinition/14905-4"
* action[+].title = "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* action[=].definitionCanonical = "https://rarecare.world/fhir/LabActivityDefinition/14635-7"
* action[+].title = "Calcidiol (25-hydroxy-Vitamin D3) in serum/plasma"
* action[=].definitionCanonical = "https://rarecare.world/fhir/LabActivityDefinition/14635-7"

Instance: plan-developmental-disability
InstanceOf: DiseasePlanDefinition

Title: "Ontwikkelingsstoornis PlanDefinition"
Usage: #example

* url = "http://rarecare.world/fhir/PlanDefinition/developmental-disability"
* status = #draft
* version = "0.1"
* title = "Ontwikkelingsstoornis"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#clinical-protocol
* subjectCodeableConcept = http://hl7.org/fhir/resource-types#Patient
* publisher = "Stichting Rare Care World"
* topic = http://terminology.hl7.org/CodeSystem/definition-topic#treatment
* date = 2021-01-14
* publisher = "Stichting Rare Care World"
* description = "Neutropenia management plan."
* relatedArtifact.type = http://hl7.org/fhir/related-artifact-type#documentation
* relatedArtifact.url = "https://rarecare.world/disease/neutropenia"
* goal.description.text = "Neutropenia management"
* goal.addresses = http://hl7.org/fhir/sid/icd-10#D70.9 "Neutropenia, unspecified"
* action.title = "Neutrophils in blood"
* action.definitionCanonical = "act-neutrophils-in-blood"