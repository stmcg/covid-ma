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

General study characteristics
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\00COVIDSR_General_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("General") firstrow;



*	Drop variables;
drop Dateformcompleted FormResponseEditURL LimitationandMitigationNotes Conclusionnotes ExplanationtoWasthesamecas ExplanationtoWerethenumerat Riskofbiasandapplicabilityn Journalname Possibleconflictofinterestf Ifthereisaconflictofintere GeneralinformationNotes Aimofstudy Locationshospitalsinwhichs StudydescriptionNotes PopulationandsettingNotes Strengthofthestudy Limitationofthestudy Strategiestoovercomethelimit Keyconclusionofstudyauthors Whatistheriskofbiasthatth ExplanationtoWhatistherisk Whatisthechanceofapplicabil AS Werethereinappropriateexclusi ExplanationtoWerethereinapp Whatistheriskofbiasofthe ExplanationtoDoesthestudyr Whatwasthepatientselection AX Weredatacollecteddirectlyfor ExplanationtoWeredatacollec Whatistheriskofapplicabilit BB Wasthesamecasedefinitionuse Whatistheriskthattherewas BF Doesthestudyreportnumberscr Arethepatientsreportedthata Whatistheriskofincompleteo BK Weredefinitionsseverecritical ExplanationtoWeredefinitions Wereall4outcomesICUadmiss;



*	Rename variables;
rename Nameofpersonextractingdata Extraction_Initials;
rename Countryinwhichthestudywasc Country;
rename Typeofstudy Study_Type;
rename Settingofenrollment Enrollment_Setting;
rename Enrollmentstartdate Enrollment_Start;
rename Enrollmentenddate Enrollment_End;
rename Typeofoutcomemeasures Outcomes;
rename Inclusioncriteria Inclusion;
rename Exclusioncriteria Exclusion;
rename Totalnumberofparticipantsscr Participants_Screened;
rename Totalnumberofparticipantsenr Participants_Enrolled;
rename Totalnumberofparticipantsana Participants_Analyzed;
rename Reporttitle Paper;
rename Studydescription Study_Description;
rename AverageageMEAN Age_Mean;
rename AverageageSTDEV Age_STDEV;
rename AverageageMEDIAN Age_Median;
rename Averageage1STQUARTILE Age_Q1;
rename Averageage3RDQUARTILE Age_Q3;
rename Percentageoffemaleparticipant Percent_Female;
rename Samplingsite Sampling_Site;


 
*	Standardize sampling site name;
replace Sampling_Site="throat swab" if Sampling_Site=="thorat swab" |
	Sampling_Site=="Throat swab" | Sampling_Site=="throat" ;
replace Sampling_Site="not specified" if Sampling_Site=="not stated";



*	Recode data as numeric;
foreach v of varlist Age_Mean-Percent_Female {;
	replace `v' = subinstr(`v',"%","",.);
	replace `v' = subinstr(`v',".",",",.);
	replace `v' = "" if `v'=="#" | `v' =="##";
	destring `v', replace dpcomma;
};



*	Percent female values that are too small/incorrect;
replace Percent_F=27 if Percent_F==.27;
replace Percent_F=49 if Percent_F==.49;
replace Percent_F=51 if Percent_F==.51;
replace Percent_F=55 if Percent_F==.55;



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Percent_Female;
duplicates drop Zoterokey-Percent_Female, force;
drop if Zotero=="CU9AYGFS" & Extraction_Initials=="Sara Kraker";

*	Differentiate studies with multiple entries;
replace Z="3LSGJJ58-NONDIAB" if Inclusion=="Virus confirmed by PCR, Hospitalization, diagnosis of diabetes ";
replace Z="3LSGJJ58-DIAB" if Inclusion=="Virus confirmed by PCR, Hospitalization, respective age- and sex-matched patient without diabetes";
replace Z="3LSGJJ58-OVERALL" if Inclusion=="Virus confirmed by PCR, Hospitalization, diagnosis of diabetes or respective age- and sex-matched patient without diabetes";
*	Age study with multiple entries;
replace Z="MJH7839I-UNDER50" if Participants_Analyzed==572;
replace Z="MJH7839I-OVER50" if Participants_Analyzed==2834;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Participants_Screened==748;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Participants_Screened==50;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Paper=="Development and external validation of a prognostic multivariable model on admission for hospitalized patients with COVID-19; VALDIATION COHORT";


*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";




*******************************************************************************;

*	Save dataset;
save "COVIDSR_General_CLEAN_20200922 - data", replace;

save "01 Blood/COVIDSR_General_CLEAN_20200922 - data", replace;

save "02 Infections/COVIDSR_General_CLEAN_20200922 - data", replace;

save "03 Kidney/COVIDSR_General_CLEAN_20200922 - data", replace;

save "04 Liver/COVIDSR_General_CLEAN_20200922 - data", replace;

save "05 Heart/COVIDSR_General_CLEAN_20200922 - data", replace;

save "06 Coagulation/COVIDSR_General_CLEAN_20200922 - data", replace;

save "07 Clinical/COVIDSR_General_CLEAN_20200922 - data", replace;

save "08 Comorbidities/COVIDSR_General_CLEAN_20200922 - data", replace;

save "09 Medication/COVIDSR_General_CLEAN_20200922 - data", replace;

save "10 Symptoms/COVIDSR_General_CLEAN_20200922 - data", replace;


capture log close;


















