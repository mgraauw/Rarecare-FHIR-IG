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


Instance: plan-neutropenia
InstanceOf: DiseasePlanDefinition

Title: "Neutropenia PlanDefinition"
Usage: #example

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
//    <topic>
//       <coding>
//          <system ="http://terminology.hl7.org/CodeSystem/definition-topic"
//          <code ="assessment"
//          <display ="Assessment"
//       </coding>
//    </topic>
* relatedArtifact.type = http://hl7.org/fhir/related-artifact-type#documentation
* relatedArtifact.url = "https://rarecare.world/disease/neutropenia"
* goal.description.text = "Neutropenia management"
* goal.addresses = http://hl7.org/fhir/sid/icd-10#D70.9 "Neutropenia, unspecified"
* action.title = "Neutrophils in blood"
* action.definitionCanonical = "act-neutrophils-in-blood"