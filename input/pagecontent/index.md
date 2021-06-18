This repository contains the FHIR resources for the "Een PGO voor iedereen" ("A personal healthcare environment for everyone") project.

Note: *All example content is example only!* It is based on Shwachman Diamond Syndrome (SDS) data from rarecare.world, but for brevity it is much shorter than the actual data would be.

### MedMij and the "PGO for everyone" project
The Netherlands has a national effort, [MedMij](https://www.medmij.nl/en/), to provide all Dutch citizens with a personal healthcare 
environment, web or mobile. However, persons with rare diseases have trouble seeing their condition properly represented. Due to
the rare nature of their condition, vendors are hesitant to invest in small populations. Having a machine-readable Rare Condition
profile would enable vendors to simply read the necessary data to provide those persons with customized dashboards, graphs and questionnaires to address their conditions properly. Moreover, healthcare professionals, patient organizations and researchers could all benefit from the structured collection of data.

The "PGO for everyone" project aims to provide such a machine-readable API for PGO's. The definitions for specific rare conditions are published as FHIR resources. PGO's can pull those in with an API, and use the definitions to provide disease-specific dashboards and questionnaires for those rare conditions.

### The RareCare Data Model
The Rare Care models are maintained at [https://rarecare.world](https://rarecare.world)

and (only partially complete yet) [https://decor.nictiz.nl/art-decor/decor-datasets--zaz-](https://decor.nictiz.nl/art-decor/decor-datasets--zaz-)

From those resources FHIR profiles are generated. The basis is a Data Model of Rare Conditions:

![alt text](Rare%20Care%208.png "Rare Care Data Model")

A Rare Condition IS_A Disease, but will also be composed of diseases: i.e. Shwachman-Diamond Syndrome is typically associated with Neutropenia, Pancreas Insufficiency etc.
A Disease is associated with Symptoms, which may be abnormal lab values, represented by LOINC codes. Symptoms may also be HPO-coded phenotypical abnormalities.
A Disease is associated with Medication, here represented with ATC coding.
Diseases are also associated with ICF impairments in functioning (b.xxx codes) or activity and particapation (d.xxx codes).

### The RareCare FHIR profiles
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

The FHIR profiles are under 'Artifacts'. Under each profile are:
* Profile description. See "Differential Table" for the difference with the - often big - standard FHIR profiles. 
* Examples: See under the JSON tab for code-level examples. We do not use the XML format.
* Mapping to Rare Care Data Model. See tab "Mapping", the very lowest mapping.
#### PlanDefinition
A [PlanDefinition](http://hl7.org/fhir/plandefinition.html) is a general disease management plan, i.e. not a plan for a particular patient, but a generic plan to be rolled out when a particular patient enters care. When that is the case, a CarePlan based on the generic PlanDefinition 
can be made.

![](action-and-activity-definition.png "Action and ActivityDefinition")

We have two subtypes of PlanDefinition:
* RareCarePlanDefinition
* DiseasePlanDefinition

The RareCarePlanDefinition are the FHIR way to define actions to be taken for a particular rare disease. They contain references to:
* DiseasePlanDefinitions for associated diseases (i.e. the plan for Shwachman Diamond Syndrome contains DiseasePlanDefinitions for Neutropenia management, Pancreas Insufficiency etc.)
* Questionnaires for social support which may be required

The related DiseasePlanDefinitions contain references to:
* ActivityDefinitions for laboratory outcomes to be followed
* ActivityDefinitions for medication which may be taken
* Questionnaires functioning which needs to be monitored

#### ActivityDefinition 
An [ActivityDefinition](http://hl7.org/fhir/activitydefinition.html) describes request resources such as ServiceRequest and MedicationRequest. So an ActivityDefinition may describe some lab test which can be performed or some medication which may be taken.

We have two subtypes of ActivityDefinition:
* LabActivityDefinition for LOINC tests
* MedActivityDefinition for medication by ATC code

#### ObservationDefinition 
An [ObservationDefinition](http://hl7.org/fhir/observationdefinition.html) describes an Observation in detail.

We have one two subtype of ObservationDefinition:
* LabObservationDefinition for LOINC tests

#### Questionnaire
An [Questionnaire](http://hl7.org/fhir/questionnaire.html) describes a Questionnaire in detail.

We have one two subtypes of Questionnaire:
* FunctioningQuestionnaire for ICF-b Functioning
* ParticipationQuestionnaire for ICF-d Participation and Activities

### The RareCare FHIR API
Of the [FHIR Restful API](http://hl7.org/fhir/http.html) we only use the `read` interaction, which has this base syntax.
```
GET [base]/[type]/[id] {?_format=[mime-type]}
```
For our API, the base is `https://rarecare.world/fhir`:
```
GET https://rarecare.world/fhir/[type]/[id] 
```
[type] is one of:
* PlanDefinition
* ActivityDefinition
* ObservationDefinition
* Questionnaire

[id] can be found in the references in the instances. For instance the PlanDefinition for SDS contains actions with a URI in definitionCanonical:
```
  "action" : [
    {
      "title" : "Neutropenia",
      "definitionCanonical" : "http://rarecare.world/fhir/PlanDefinition/neutropenia"
    },
```
This contains the entire URI, the last part (`neutropenia`) is the id. The id is arbitrary, it could just as well have been a UUID or random number, as long as the references are maintained.

The RareCarePlanDefinition (for the entire rare condition) can also be retrieved by ORPHA code:
```
GET https://rarecare.world/fhir/PlanDefinition?code=ORPHA:811
```
So, starting with
1. an ORPHA code, one can retrieve:
1. the PlanDefinition for the rare condition
1. from the action items therein:
1. the associated Questionnaire for Participation
1. the PlanDefinitions for the associated diseases
1. from the action items therein:
1. the associated Questionnaire for Functioning
1. the ActivityDefinitions for the associated Medication
1. the ActivityDefinitions for the associated Lab Test
1. and from the latter:
1. the ObservationDefinitions for the associated Lab Test

All retrievals except the first one are on [id].

![](RareCare API.png "RareCare FHIR API")
