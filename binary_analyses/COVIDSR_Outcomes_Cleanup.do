***************************** STATA Housekeeping *******************************
capture log close
clear all
macro drop all
version 16
set more off, permanently

/*******************************************************************************
Author: Alexandra Zimmer
Date: September 22, 2020
Project: Systematic review of clinical & lab indicators that predict hospitalization
ICU, intubation and mortality in COVID-19 patients

Cleaning outcomes data
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\00COVIDSR_Outcomes_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Outcomes") firstrow;



*	Drop variables (text-based);
drop Reporttitle FormResponseEditURL Nameofpersonextractingdata;



*	Rename variables;
*		Mortality;
rename MortalityNumberofpatients Mortality_N;
rename MortalityNumberoffemalepat Mortality_Female;
rename MortalityAgeMEAN Age_Mortality_Mean;
rename MortalityAgeSTDEV Age_Mortality_STDEV;
rename MortalityAgeMEDIAN Age_Mortality_Median;
rename MortalityAgeIQRQ1 Age_Mortality_Q1;
rename MortalityAgeIQRQ3 Age_Mortality_Q3;
rename Mortalitycasefatalityrate Mortality_CFR;
rename Mortalityper10persondays Other_Mortality_Value;
rename O Other_Mortality_Description;
rename Mortalityhazardratio Mortality_HR;
rename Mortalityoddratio Mortality_OR;
*		Survived;
rename Survivednumberofpatients Survived_N;
rename Survivednumberoffemalepati Survived_Female;
rename SurvivedAgeMEAN Age_Survived_Mean;
rename SurvivedAgeSTDEV Age_Survived_STDEV;
rename SurvivedAgeMEDIAN Age_Survived_Median;
rename SurvivedAgeIQRQ1 Age_Survived_Q1;
rename SurvivedAgeIQRQ3 Age_Survived_Q3;
rename Survivedsurvivedper10perso Other_Survived_Value;
rename Z Other_Survived_Description;
rename Survivedhazardratio Survived_HR;
rename Survivedoddratio Survived_OR;
*		Hospitalized;
rename Hospitalizednumberofpatient Hosp_N;
rename Hospitalizednumberoffemale Hosp_Female;
rename HospitalizedAgeMEAN Age_Hosp_Mean;
rename HospitalizedAgeSTDEV Age_Hosp_STDEV;
rename HospitalizedAgeMEDIAN Age_Hosp_Median;
rename HospitalizedAgeIQRQ1 Age_Hosp_Q1;
rename HospitalizedAgeIQRQ3 Age_Hosp_Q3;
rename Hospitalizedadmissionsper10 Other_Hosp_Value;
rename AK Other_Hosp_Description;
rename Hospitalizedhazardratio Hosp_HR;
rename Hospitalizedoddratio Hosp_OR;
*		Non-hospitalized;
rename Nonhospitalizednumberofpat Nonhosp_N;
rename Nonhospitalizednumberoffem Nonhosp_Female;
rename NonhospitalizedAgeMEAN Age_Nonhosp_Mean;
rename NonhospitalizedAgeSTDEV Age_Nonhosp_STDEV;
rename NonhospitalizedAgeMEDIAN Age_Nonhosp_Median;
rename NonhospitalizedAgeIQRQ1 Age_Nonhosp_Q1;
rename NonhospitalizedAgeIQRQ3 Age_Nonhosp_Q3;
rename Nonhospitalizedadmissionspe Other_Nonhosp_Value;
rename AV Other_Nonhosp_Description;
rename Nonhospitalizedhazardratio Nonhosp_HR;
rename Nonhospitalizedoddratio Nonhosp_OR;
*		ICU;
rename ICUadmissionnumberofpatien ICU_N;
rename ICUadmissionnumberoffemale ICU_Female;
rename ICUadmissionAgeMEAN Age_ICU_Mean;
rename ICUadmissionAgeSTDEV Age_ICU_STDEV;
rename ICUadmissionAgeMEDIAN Age_ICU_Median;
rename ICUadmissionAgeIQRQ1 Age_ICU_Q1;
rename ICUadmissionAgeIQRQ3 Age_ICU_Q3;
rename ICUadmissionICUadmissionsp Other_ICU_Value;
rename BG Other_ICU_Description;
rename ICUadmissionhazardratio ICU_HR;
rename ICUadmissionoddratio ICU_OR;
*	Non-ICU;
rename NonICUadmissionnumberofpa NonICU_N;
rename NonICUadmissionnumberoffe NonICU_Female;
rename NonICUadmissionAgeMEAN Age_NonICU_Mean;
rename NonICUadmissionAgeSTDEV Age_NonICU_STDEV;
rename NonICUadmissionAgeMEDIAN Age_NonICU_Median;
rename NonICUadmissionAgeIQRQ1 Age_NonICU_Q1;
rename NonICUadmissionAgeIQRQ3 Age_NonICU_Q3;
rename NonICUadmissionICUadmissio Other_NonICU_Value;
rename BR Other_NonICU_Description;
rename NonICUadmissionhazardratio NonICU_HR;
rename NonICUadmissionoddratio NonICU_OR;
*		Intubated;
rename Intubatednumberofpatients Intub_N;
rename Intubatednumberoffemalepat Intub_Female;
rename IntubatedAgeMEAN Age_Intub_Mean;
rename IntubatedAgeSTDEV Age_Intub_STDEV;
rename IntubatedAgeMEDIAN Age_Intub_Median;
rename IntubatedAgeIQRQ1 Age_Intub_Q1;
rename IntubatedAgeIQRQ3 Age_Intub_Q3;
rename Intubatedintubatedper10pe Other_Intub_Value;
rename CC Other_Intub_Description;
rename Intubatedhazardratio Intub_HR;
rename Intubatedoddratio Intub_OR;
*		Non-intubated;
rename Nonintubatednumberofpatien Nonintub_N;
rename Nonintubatednumberoffemale Nonintub_Female;
rename NonintubatedAgeMEAN Age_Nonintub_Mean;
rename NonintubatedAgeSTDEV Age_Nonintub_STDEV;
rename NonintubatedAgeMEDIAN Age_Nonintub_Median;
rename NonintubatedAgeIQRQ1 Age_Nonintub_Q1;
rename NonintubatedAgeIQRQ3 Age_Nonintub_Q3;
rename Nonintubatedintubatedper1 Other_Nonintub_Value;
rename CN Other_Nonintub_Description;
rename Nonintubatedhazardratio Nonintub_HR;
rename Nonintubatedoddratio Nonintub_OR;
*		Other;
rename Othernumber Other_N;
rename Otherper10persondaysany Other_Value;
rename CS Other_Description;
rename Otherhazardratio Other_HR;
rename Otheroddratio Other_OR;




*	Recode data as numeric;
foreach v of varlist Mortality_N-Other_OR {;
	replace `v'=subinstr(`v',"%","",.);
	replace `v'=subinstr(`v',".",",",.);
	replace `v'="10^9/L" if `v'=="10^3/µL" | `v'=="x 10^9/l";
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="###" |  `v'=="n" |
		`v'=="NA";
	destring `v', replace dpcomma;
};



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Other_OR;
duplicates drop Zoterokey-Other_OR, force;


*	Duplicates;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Mortality_N==16;
*	Age study with multiple entries;
replace Z="MJH7839I-UNDER50" if Z=="MJH7839I" & Mortality_N==60;
replace Z="MJH7839I-OVER50" if Z=="MJH7839I" & Mortality_N==1076;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Mortality_N==14;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Zotero=="VN52PHAB" & Age_Mortality_Mean==67;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*******************************************************************************;

*	Save dataset;
save "COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "01 Blood/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "02 Infections/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "03 Kidney/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "04 Liver/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "05 Heart/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "06 Coagulation/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "07 Clinical/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "08 Comorbidities/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "09 Medication/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "10 Symptoms/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "Mortality/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "ICU/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "Hospital/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;

save "Intubated/COVIDSR_Outcomes_CLEAN_20200922 - data", replace;


capture log close;





