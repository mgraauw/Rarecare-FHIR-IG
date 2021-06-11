Alias: ICF = http://hl7.org/fhir/sid/icf-nl

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

Mapping: RareCareFHIRtoDataModel
Source: FunctioningQuestionnaire
Target: "Rare Care Data Model"
Title: "Rare Care Data Model"
* -> "Function"

Profile: ParticipationQuestionnaire
Parent: Questionnaire
Id: participation-questionnaire
Title: "Questionnaire for participation"
Description: "The ParticipationQuestionnaire is a questionnaire for patients with rare conditions. It captures aspects of their 
activities and participation relevant to their specific disease."
* code = LOINC#10166-7 "History of Social function Narrative"
* item.code from icf-d-codes (required)

RuleSet: icf-d-answeroptions(level, code)
* item[{level}].answerOption[0].valueCoding = ICF#{code}.0 "Geen moeite"
* item[{level}].answerOption[1].valueCoding = ICF#{code}.1 "Lichte moeite"
* item[{level}].answerOption[2].valueCoding = ICF#{code}.2 "Matige moeite"
* item[{level}].answerOption[3].valueCoding = ICF#{code}.3 "Ernstige moeite"
* item[{level}].answerOption[4].valueCoding = ICF#{code}.4 "Volledige moeite"
* item[{level}].answerOption[5].valueCoding = ICF#{code}.8 "niet gespecificeerd"
* item[{level}].answerOption[6].valueCoding = ICF#{code}.9 "niet van toepassing"

RuleSet: icf-f-answeroptions(level, code)
* item[{level}].answerOption[0].valueCoding = ICF#{code}.0 "Geen stoornis (0-5%)"
* item[{level}].answerOption[1].valueCoding = ICF#{code}.1 "Lichte stoornis (5-24%)"
* item[{level}].answerOption[2].valueCoding = ICF#{code}.2 "Matige stoornis (25-49%)"
* item[{level}].answerOption[3].valueCoding = ICF#{code}.3 "Ernstige stoornis (50-95%)"
* item[{level}].answerOption[4].valueCoding = ICF#{code}.4 "Volledige stoornis (96-100%)"
* item[{level}].answerOption[5].valueCoding = ICF#{code}.8 "niet gespecificeerd"
* item[{level}].answerOption[6].valueCoding = ICF#{code}.9 "niet van toepassing"

Instance: shwachman-diamond-syndrome-questionnaire
InstanceOf: ParticipationQuestionnaire
Title: "Participation and Activities Questionnaire for Shwachman Diamond Syndroom"
Usage: #example

* url = "https://rarecare.world/fhir/Questionnaire/shwachman-diamond-syndrome"
* title = "Vragenlijst participatie voor Shwachman Diamond Syndroom"
* status = #draft
* subjectType = http://hl7.org/fhir/resource-types#Patient
* item[0].linkId = "d210"
* item[0].code = ICF#d210 "Ondernemen van een enkelvoudige taak"
* item[0].text = "Ondernemen van een enkelvoudige taak"
* item[0].type = #choice
* item[0].required = false
* insert icf-d-answeroptions(0, d210)
* item[1].linkId = "d240"
* item[1].code = ICF#d240 "Omgaan met stress en andere mentale eisen"
* item[1].text = "Omgaan met stress en andere mentale eisen"
* item[1].type = #choice
* item[1].required = false
* insert icf-d-answeroptions(1, d240)
* item[2].linkId = "d4751"
* item[2].code = ICF#d4751 "Besturen van gemotoriseerde voertuigen"
* item[2].text = "Besturen van gemotoriseerde voertuigen"
* item[2].type = #choice
* item[2].required = false
* insert icf-d-answeroptions(2, d4751)

Instance: developmental-disability-questionnaire
InstanceOf: FunctioningQuestionnaire
Title: "Functioning Questionnaire for Development Disability"
Usage: #example

* url = "https://rarecare.world/fhir/Questionnaire/developmental-disability"
* title = "Vragenlijst functioneren voor Ontwikkelingsstoornis"
* status = #draft
* subjectType = http://hl7.org/fhir/resource-types#Patient
* item[0].linkId = "b117"
* item[0].code = ICF#b117 "Intellectuele functies"
* item[0].text = "Intellectuele functies"
* item[0].type = #choice
* item[0].required = false
* insert icf-f-answeroptions(0, b117)
* item[1].linkId = "b310"
* item[1].code = ICF#b310 "Stem"
* item[1].text = "Stem"
* item[1].type = #choice
* item[1].required = false
* insert icf-f-answeroptions(1, b310)