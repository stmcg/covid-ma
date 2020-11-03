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

Medication - Data clean up
*******************************************************************************/


***NO ANALYSIS FOR MEDICATION BECAUSE N<4 FOR ALL VARIABLES***;

#delimit;


cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Medication") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Reporttitle;



*	Recode data as numeric;
foreach v of varlist ACEInhibitorsICUadmission-OtherOtherNumberofcases {;
	capture confirm string variable `v';
	if !_rc {;
		replace `v' = "." if `v' == "NA";
		replace `v' = "." if `v' == "not specified";
		replace `v' = "." if `v'=="#" | `v' =="##";
	destring `v', replace dpcomma;
	};
};



*	Drop variables that are all missing;
dropmiss ACEInhibitorsICUadmission-OtherOtherNumberofcases, force;



*	Rename variables;
*		Other;
rename OtherMortalityNumberofca Other_Mortality_N;
rename OtherSurvivedNumberofcas Other_Survived_N;



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Other_Survived_N;
duplicates drop Zoterokey-Other_Survived_N, force;



*******************************************************************************;

save "09 Medication/COVIDSR_Medication_CLEAN_20200922 - data", replace;

capture log close;















