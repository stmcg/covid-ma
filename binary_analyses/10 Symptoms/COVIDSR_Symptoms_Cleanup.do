***************************** STATA Housekeeping *******************************
capture log close
clear all
macro drop all
set more off, permanently
version 16.1

/*******************************************************************************
Author: Alexandra Zimmer
Date: September 22, 2020
Project: Systematic review of clinical & lab indicators that predict hospitalization
ICU, intubation and mortality in COVID-19 patients

Symptoms - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Symptoms_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Symptoms") firstrow;


*	Recode data as numeric;
foreach v of varlist FeverICUadmissionNumbero-CompleteAsymptomaticOther {;
	capture confirm string variable `v';
	if !_rc {;
		replace `v' = "." if `v' == "NA";
		replace `v' = "." if `v' == "not specified";
		replace `v' = "." if `v'=="#" | `v' =="##";
	destring `v', replace dpcomma;
	};
};



*	Rename variables;
*		Fever;
rename FeverICUadmissionNumbero Fever_ICU_N;
rename FeverNonICUadmissionNumb Fever_NonICU_N;
rename FeverHospitalizedNumberof Fever_Hosp_N;
rename FeverNonhospitalizedNumbe Fever_Nonhosp_N;
rename FeverIntubatedNumberofca Fever_Intub_N;
rename FeverNonintubatedNumbero Fever_Nonintub_N;
rename FeverMortalityNumberofca Fever_Mortality_N;
rename FeverSurvivedNumberofcas Fever_Survived_N;
rename FeverOtherNumberofcases Fever_Other_N;
*		Cough;
rename CoughICUadmissionNumbero Cough_ICU_N;
rename CoughNonICUadmissionNumb Cough_NonICU_N;
rename CoughHospitalizedNumberof Cough_Hosp_N;
rename CoughNonhospitalizedNumbe Cough_Nonhosp_N;
rename CoughIntubatedNumberofca Cough_Intub_N;
rename CoughNonintubatedNumbero Cough_Nonintub_N;
rename CoughMortalityNumberofca Cough_Mortality_N;
rename CoughSurvivedNumberofcas Cough_Survived_N;
rename CoughOtherNumberofcases Cough_Other_N;
*		Dyspnea;
rename ShortnessofBreathDyspnea Dyspnea_ICU_N;
rename Y Dyspnea_NonICU_N;
rename Z Dyspnea_Hosp_N;
rename AA Dyspnea_Nonhosp_N;
rename AB Dyspnea_Intub_N;
rename AC Dyspnea_Nonintub_N;
rename AD Dyspnea_Mortality_N;
rename AE Dyspnea_Survived_N;
rename AF Dyspnea_Other_N;
*		Headache;
rename HeadacheICUadmissionNumbe Headache_ICU_N;
rename HeadacheNonICUadmissionN Headache_NonICU_N;
rename HeadacheHospitalizedNumber Headache_Hosp_N;
rename HeadacheNonhospitalizedNu Headache_Nonhosp_N;
rename HeadacheIntubatedNumberof Headache_Intub_N;
rename HeadacheNonintubatedNumbe Headache_Nonintub_N;
rename HeadacheMortalityNumberof Headache_Mortality_N;
rename HeadacheSurvivedNumberof Headache_Survived_N;
rename HeadacheOtherNumberofcas Headache_Other_N;
*		Abdominal pain;
rename AbdominalPainICUadmission Abdom_ICU_N;
rename AbdominalPainNonICUadmissi Abdom_NonICU_N;
rename AbdominalPainHospitalized Abdom_Hosp_N;
rename AbdominalPainNonhospitalize Abdom_Nonhosp_N;
rename AbdominalPainIntubatedNum Abdom_Intub_N;
rename AbdominalPainNonintubated Abdom_Nonintub_N;
rename AbdominalPainMortalityNum Abdom_Mortality_N;
rename AbdominalPainSurvivedNumb Abdom_Survived_N;
rename AbdominalPainOtherNumber Abdom_Other_N;
*		Fatigue;
rename FatigueICUadmissionNumber Fatigue_ICU_N;
rename FatigueNonICUadmissionNu Fatigue_NonICU_N;
rename FatigueHospitalizedNumber Fatigue_Hosp_N;
rename FatigueNonhospitalizedNum Fatigue_Nonhosp_N;
rename FatigueIntubatedNumberof Fatigue_Intub_N;
rename FatigueNonintubatedNumber Fatigue_Nonintub_N;
rename FatigueMortalityNumberof Fatigue_Mortality_N;
rename FatigueSurvivedNumberofc Fatigue_Survived_N;
rename FatigueOtherNumberofcase Fatigue_Other_N;
*		Confusion;
rename ConfusionICUadmissionNumb Confusion_ICU_N;
rename ConfusionNonICUadmission Confusion_NonICU_N;
rename ConfusionHospitalizedNumbe Confusion_Hosp_N;
rename ConfusionNonhospitalizedN Confusion_Nonhosp_N;
rename ConfusionIntubatedNumbero Confusion_Intub_N;
rename ConfusionNonintubatedNumb Confusion_Nonintub_N;
rename ConfusionMortalityNumbero Confusion_Mortality_N;
rename ConfusionSurvivedNumberof Confusion_Survived_N;
rename ConfusionOtherNumberofca Confusion_Other_N;
*		Diarrhea;
rename DiarrheaICUadmissionNumbe Diarrhea_ICU_N;
rename DiarrheaNonICUadmissionN Diarrhea_NonICU_N;
rename DiarrheaHospitalizedNumber Diarrhea_Hosp_N;
rename DiarrheaNonhospitalizedNu Diarrhea_Nonhosp_N;
rename DiarrheaIntubatedNumberof Diarrhea_Intub_N;
rename DiarrheaNonintubatedNumbe Diarrhea_Nonintub_N;
rename DiarrheaMortalityNumberof Diarrhea_Mortality_N;
rename DiarrheaSurvivedNumberof Diarrhea_Survived_N;
rename DiarrheaOtherNumberofcas Diarrhea_Other_N;
*		Anosmie;
rename AnosmieICUadmissionNumber Anosmie_ICU_N;
rename AnosmieNonICUadmissionNu Anosmie_NonICU_N;
rename AnosmieHospitalizedNumber Anosmie_Hosp_N;
rename AnosmieNonhospitalizedNum Anosmie_Nonhosp_N;
rename AnosmieIntubatedNumberof Anosmie_Intub_N;
rename AnosmieNonintubatedNumber Anosmie_Nonintub_N;
rename AnosmieMortalityNumberof Anosmie_Mortality_N;
rename AnosmieSurvivedNumberofc Anosmie_Survived_N;
rename AnosmieOtherNumberofcase Anosmie_Other_N;
*		Pharyngalgia;
rename PharyngalgiaICUadmissionN Pharyn_ICU_N;
rename PharyngalgiaNonICUadmission Pharyn_NonICU_N;
rename Pharyngalgiahospitaladmissio Pharyn_Hosp_N;
rename PharyngalgiaIntubatedNumbe Pharyn_Intub_N;
rename PharyngalgiaNonintubatedN Pharyn_Nonintub_N;
rename PharyngalgiamortalityNumbe Pharyn_Mortality_N;
rename PharyngalgiaSurvivedNumber Pharyn_Survived_N;
rename PharyngalgiaOtherNumberof Pharyn_Other_N;
*		Complete asymptomatic;
rename CompleteAsymptomaticICUadmi Asymptom_ICU_N;
rename CompleteAsymptomaticNonICU Asymptom_NonICU_N;
rename CompleteAsymptomaticHospital Asymptom_Hosp_N;
rename CompleteAsymptomaticNonhosp Asymptom_Nonhosp_N;
rename CompleteAsymptomaticIntubate Asymptom_Intub_N;
rename CompleteAsymptomaticNonintu Asymptom_Nonintub_N;
rename CompleteAsymptomaticMortalit Asymptom_Mortality_N;
rename CompleteAsymptomaticSurvived Asymptom_Survived_N;
drop CompleteAsymptomaticOther;


*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Pharyn_Survived_N;
duplicates list;
duplicates drop Zoterokey-Pharyn_Survived_N, force;

*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Fever_Mortality_N==25;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Fever_Mortality_N==12;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Fever_Mortality_N==10;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Fever_Mortality_N==12;
*	Drop duplicate studies that don't have data;
drop if Z=="VN52PHAB";
drop if Z=="2V8JLGX7";
drop if Z=="MJH7839I";



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Data cleaning;
replace Dyspnea_Mortality_N="22" if Dyspnea_Mortality_N=="Shortness of Breath: 23 - Dyspnea: 22";
	destring Dyspnea_Mortality_N, replace;
replace Dyspnea_Survived_N="17" if Dyspnea_Survived_N=="Shortness of Breath: 48 - Dyspnea: 17";
	destring Dyspnea_Survived_N, replace;



*******************************************************************************;

save "10 Symptoms/COVIDSR_Symptoms_CLEAN_20200922 - data", replace;



*	Save mortality/survived data;

preserve;
drop *_ICU_* *_NonICU_* *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_*;
save "Mortality/COVIDSR_Symptoms_Mortality_20200922 - data", replace;
restore;


*	Save ICU/NonICU data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_* *_Mortality_* *_Survived_*;
save "ICU/COVIDSR_Symptoms_ICU_20200922 - data", replace;
restore;



*	Save Hosp/Nonhosp data;

preserve;
drop *_ICU_* *_NonICU_* *_Intub_* *_Nonintub_* *_Mortality_* *_Survived_*;
save "Hospital/COVIDSR_Symptoms_Hosp_20200922 - data", replace;
restore;

capture log close;



*	Save Intub/Nonintub data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_ICU_* *_NonICU_* *_Mortality_* *_Survived_*;
save "Intubated/COVIDSR_Symptoms_Intub_20200922 - data", replace;
restore;


capture log close;














