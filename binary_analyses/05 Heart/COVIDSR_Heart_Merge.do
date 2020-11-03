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

Heart - merge
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Heart_Merge.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\05 Heart";

use "COVIDSR_General_CLEAN_20200922 - data.dta";


*	Merge general with outcomes & blood datasets;
merge 1:1 Zotero using "COVIDSR_Outcomes_CLEAN_20200922 - data.dta";
drop _merge;

merge 1:m Zotero using "COVIDSR_Heart_CLEAN_20200922 - data.dta"; //1:m because 79A39G2V is reported multiple times in the results
drop if _merge==1 | _merge==2;
drop _merge;

merge 1:1 Zotero using "COVIDSR_Outcomes_AUTHORS_20200922 - data";
drop if _merge==2;
drop _merge;

drop Report Inclusion Exclusion;

*******************************************************************************;

save "COVIDSR_Heart_MERGE_20200922 - data", replace;

export delimited using "COVIDSR_Heart_MERGE_v13.csv", replace;

capture log close;