***************************** STATA Housekeeping *******************************
capture log close
clear all
macro drop all
version 16.1
set more off, permanently

/*******************************************************************************
Author: Alexandra Zimmer
Date: September 22, 2020
Project: Systematic review of clinical & lab indicators that predict hospitalization
ICU, intubation and mortality in COVID-19 patients

Clinical - merge
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200707\00 Logs\COVIDSR_Clinical_Analysis.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\07 Clinical";

use "COVIDSR_General_CLEAN_20200922 - data.dta";


*	Merge general with outcomes & blood datasets;
merge 1:1 Zotero using "COVIDSR_Outcomes_CLEAN_20200922 - data.dta";
drop _merge;

merge 1:m Zotero using "COVIDSR_Clinical_CLEAN_20200922 - data.dta"; //1:m because 79A39G2V is reported multiple times in the results
drop if _merge==1 | _merge==2;
drop _merge;

merge 1:1 Zotero using "COVIDSR_Outcomes_AUTHORS_20200922 - data";
drop if _merge==2;
drop _merge;

drop Report Inclusion Exclusion;

*******************************************************************************;

preserve;

drop CURB65_01_ICU_N-TNFa_Other_Cumulative; //save dataset with only continuous variables - NO SCORES

export delimited using "COVIDSR_Clinical_MERGE_v13_NOSCORE.csv", replace;

*******************************************************************************;

restore;

drop O2SatNoOx_ICU_N-RespRate_Other_Q3 ART_ICU_Type-TNFa_Other_Cumulative; //only keep score variables

export excel using "COVIDSR_Clinical_MERGE_v13_SCORE.xls", firstrow(variables) replace;

capture log close;




