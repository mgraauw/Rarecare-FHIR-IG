Alias: ICF = urn:oid:2.16.840.1.113883.6.254 // also correct: http://hl7.org/fhir/sid/icf

ValueSet: ICFBcodes
Id: icf-b-codes
Title: "ICF b codes: BODY FUNCTIONS"
Description : "All codes from ICF B subhierarchy: BODY FUNCTIONS"
* include codes from system ICF where concept is-a #b "BODY FUNCTIONS"

ValueSet: ICFDcodes
Id: icf-d-codes
Title: "ICF d codes: ACTIVITIES AND PARTICIPATION"
Description : "All codes from ICF D subhierarchy: ACTIVITIES AND PARTICIPATION"
* include codes from system ICF where concept is-a #d "ACTIVITIES AND PARTICIPATION"

Profile: FunctioningQuestionnaire
Parent: Questionnaire
Id: functioning-questionnaire
Title: "Questionnaire for functioning"
Description: "The FunctioningQuestionnaire is a questionnaire for patients with rare conditions. It captures aspects of their 
functioning relevant to their specific disease."
* code = LOINC#10158-4 "History of Functional status Narrative"
* item.code from icf-b-codes (required)

Mapping: RareCareFHIRtoDataModelFunctioning
Source: FunctioningQuestionnaire
Target: "RareCareDataModel"
Title: "Rare Care Data Model"
* -> "Function set of questions"
* item -> "Function"
* item.code.code -> "Function.ICF.code"
* item.code.display -> "Function.ICF.name"
* item.answerOption -> "Fixed ICF answer set with Function.ICF.code.x inserted (x = {0, 1, 2, 3, 4, 8, 9}"

Profile: ParticipationQuestionnaire
Parent: Questionnaire
Id: participation-questionnaire
Title: "Questionnaire for participation"
Description: "The ParticipationQuestionnaire is a questionnaire for patients with rare conditions. It captures aspects of their 
activities and participation relevant to their specific disease."
* code = LOINC#10166-7 "History of Social function Narrative"
* item.code from icf-d-codes (required)

Mapping: RareCareFHIRtoDataModelParticipation
Source: ParticipationQuestionnaire
Target: "RareCareDataModel"
Title: "Rare Care Data Model"
* -> "Participation set of questions"
* item -> "Participation"
* item.code.code -> "Participation.ICF.code"
* item.code.display -> "Participation.ICF.name"
* item.answerOption -> "Fixed ICF answer set with Function.ICF.code.x inserted (x = {0, 1, 2, 3, 4, 8, 9}"

// The Dutch anser options:
// RuleSet: icf-d-nl-answeroptions(level, code)
// * item[{level}].answerOption[0].valueCoding = ICF#{code}.0 "Geen moeite"
// * item[{level}].answerOption[1].valueCoding = ICF#{code}.1 "Lichte moeite"
// * item[{level}].answerOption[2].valueCoding = ICF#{code}.2 "Matige moeite"
// * item[{level}].answerOption[3].valueCoding = ICF#{code}.3 "Ernstige moeite"
// * item[{level}].answerOption[4].valueCoding = ICF#{code}.4 "Volledige moeite"
// * item[{level}].answerOption[5].valueCoding = ICF#{code}.8 "niet gespecificeerd"
// * item[{level}].answerOption[6].valueCoding = ICF#{code}.9 "niet van toepassing"

// RuleSet: icf-f-nl-answeroptions(level, code)
// * item[{level}].answerOption[0].valueCoding = ICF#{code}.0 "Geen stoornis (0-5%)"
// * item[{level}].answerOption[1].valueCoding = ICF#{code}.1 "Lichte stoornis (5-24%)"
// * item[{level}].answerOption[2].valueCoding = ICF#{code}.2 "Matige stoornis (25-49%)"
// * item[{level}].answerOption[3].valueCoding = ICF#{code}.3 "Ernstige stoornis (50-95%)"
// * item[{level}].answerOption[4].valueCoding = ICF#{code}.4 "Volledige stoornis (96-100%)"
// * item[{level}].answerOption[5].valueCoding = ICF#{code}.8 "niet gespecificeerd"
// * item[{level}].answerOption[6].valueCoding = ICF#{code}.9 "niet van toepassing"

// English has a single answer set
RuleSet: icf-en-answeroptions(level, code)
* item[{level}].answerOption[0].valueCoding = ICF#{code}.0 "No problem (0-4%)"
* item[{level}].answerOption[1].valueCoding = ICF#{code}.1 "Mild problem (5-24%)"
* item[{level}].answerOption[2].valueCoding = ICF#{code}.2 "Moderate problem (25-49%)"
* item[{level}].answerOption[3].valueCoding = ICF#{code}.3 "Servere problem (50-95%)"
* item[{level}].answerOption[4].valueCoding = ICF#{code}.4 "Complete problem (96-100%)"
* item[{level}].answerOption[5].valueCoding = ICF#{code}.8 "not specified"
* item[{level}].answerOption[6].valueCoding = ICF#{code}.9 "not applicable"

Instance: shwachman-diamond-syndrome-questionnaire
InstanceOf: ParticipationQuestionnaire
Title: "Participation and Activities Questionnaire for Shwachman Diamond Syndrome"
Usage: #example

* url = "https://rarecare.world/fhir/Questionnaire/shwachman-diamond-syndrome"
* title = "Participation and Activities Questionnaire for Shwachman Diamond Syndrome"
* status = #draft
* subjectType = http://hl7.org/fhir/resource-types#Patient
* item[0].linkId = "d210"
* item[0].code = ICF#d210 "Undertaking a single task"
* item[0].text = "Undertaking a single task"
* item[0].type = #choice
* item[0].required = false
* insert icf-en-answeroptions(0, d210)
* item[1].linkId = "d240"
* item[1].code = ICF#d240 "Handling stress and other psychological demands"
* item[1].text = "Handling stress and other psychological demands"
* item[1].type = #choice
* item[1].required = false
* insert icf-en-answeroptions(1, d240)
* item[2].linkId = "d4751"
* item[2].code = ICF#d4751 "Driving motorized vehicles"
* item[2].text = "Driving motorized vehicles"
* item[2].type = #choice
* item[2].required = false
* insert icf-en-answeroptions(2, d4751)

Instance: developmental-disability-questionnaire
InstanceOf: FunctioningQuestionnaire
Title: "Functioning Questionnaire for Development Disability"
Usage: #example

* url = "https://rarecare.world/fhir/Questionnaire/developmental-disability"
* title = "Functioning Questionnaire for Development Disability"
* status = #draft
* subjectType = http://hl7.org/fhir/resource-types#Patient
* item[0].linkId = "b117"
* item[0].code = ICF#b117 "Intellectual functions"
* item[0].text = "Intellectual functions"
* item[0].type = #choice
* item[0].required = false
* insert icf-en-answeroptions(0, b117)
* item[1].linkId = "b310"
* item[1].code = ICF#b310 "Voice functions"
* item[1].text = "Voice functions"
* item[1].type = #choice
* item[1].required = false
* insert icf-en-answeroptions(1, b310)