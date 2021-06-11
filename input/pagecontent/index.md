# Rarecare-FHIR-IG

This repository contains the FHIR resources for the "Een PGO voor iedereen" ("A personal healthcare environment for everyone") project.

Note: *All example content is example only!* It is based on Shwachman Diamond Syndrome data from rarecare.world, but for brevity it is much shorter than the actual data would be.

## MedMij and the "PGO for everyone" project
The Netherlands has a national effort, MedMij, to provide all Dutch citizens with a personal healthcare 
environment, web or mobile. However, persons with rare diseases have trouble seeing their condition properly represented. Due to
the rare nature of their condition, vendors are hesitant to invest in small populations. Having a machine-readable Rare Condition
profile would enable vendors to simply read the necessary data to provide those persons with customized dashboards, graphs and questionnaires to address their conditions properly. Moreover, healthcare professionals, patient organizations and researchers could all benefit from the structured collection of data.

The "PGO for everyone" project aims to provide such a machine-readable API for PGO's. The definitions for specific rare conditions are published as FHIR resources. PGO's can pull those in with an API, and use the definitions to provide disease-specific dashboards and questionnaires for those rare conditions.

## The RareCare Data Model
The Rare Care models are maintained at:

https://rarecare.world

and (only partially complete yet):

https://decor.nictiz.nl/art-decor/decor-datasets--zaz-

From those resources FHIR profiles are generated.

The basis is a Data Model of Rare Conditions:
![alt text](Rare%20Care%208.png "Rare Care Data Model")

A Rare Condition IS_A Disease, but will also be composed of diseases: i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia, Pancreas Insufficiency etc.
A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes. Symptoms may also be HPO-coded phenotypical abnormalities.
A Disease is associated with Medication, here represented with ATC coding.
Diseases are also associated with ICF impairments in functioning (b.xxx codes) or activity and particapation (d.xxx codes).

## The FHIR profiles
The RareCare datamodel for Rare Conditions is implemented using [FHIR](http://hl7.org/fhir/definition.html).
The FHIR profiles contain a mapping to the data model (see tab 'Mapping' in each profile).

There are 3 kinds of FHIR resources: Event, Request and Definition. 
* Requests ask for or express a desire/intention for something to be done
* Events express that something has been done and which can potentially be done because of a request
* Definitions define something that can potentially happen in a patient and time-independent manner
I.e. a MedicationRequest (a Request resource) can be a request to administer some medication to a hospitalized COVID-19 patient; MedicationAdministration (an Event Resource) captures the actual administration of the medication to tha patient; ActivityDefinition states that alle or some COVID-19 patients should take some medication.

The Definition resources fit the RareCare Datamodel very nicely. The data model does not say anything about specific patients, only something about all (or most) patients with a particular Rare Condition.

The mapping from data model to FHIR resource types is as follows:

| Data model    | FHIR resource type | RareCare IG FHIR profile | Coding  |
|:-------------|:-------------|:-----|:------|
| Rare Condition | PlanDefinition | RareCarePlanDefinition | Orpha, Snomed CT, ICD-10 |
| Disease | PlanDefinition | DiseasePlanDefinition | Snomed CT, ICD-10 |
| Symptom (only lab tests now) | ActivityDefinition, ObservationDefinition | LabActivityDefinition, ObservationDefinition | LOINC |
| Medication  | ActivityDefinition with product | MedActivityDefinition | ATC |
| Function, Participation | Questionnaire | FunctioningQuestionnaire, ParticipationQuestionnaire |  ICF-b, ICF-d |

### PlanDefinition
A [PlanDefinition](http://hl7.org/fhir/plandefinition.html) is a general disease management plan, i.e. not a plan for a particular patient, but a generic plan
to be rolled out when a particular patient enters care. When that is the case, a CarePlan based on the generic PlanDefinition 
can be made.

![](action-and-activity-definition.png) "Action and ActivityDefinition"  

A PlanDefinition can consist of many subplans. A plan for Shwachman Diamond Syndrome would, for instance, contain PlanDefinitions for Neutropenia management, Pancreas Insufficiency etc.

The RareCare PlanDefinitions are the FHIR way to define actions to be taken for a particular rare disease:
* laboratory outcomes to be followed
* medication which may be taken
* functioning which needs to be monitored
* social support which may be required

These actions are defined using ActivityDefinitions.
### ActivityDefinition 
An [ActivityDefinition](http://hl7.org/fhir/activitydefinition.html) describes request resources such as ServiceRequest and MedicationRequest. So an ActivityDefinition may describe some lab test which can be performed or some medication which may be taken.

## The API
