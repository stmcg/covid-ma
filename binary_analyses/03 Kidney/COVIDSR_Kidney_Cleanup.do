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

Kidney - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Kidney_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Kidney") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Drop second time point entry;
drop if Report=="Clinical Features and Short-term Outcomes of 102 Patients with Corona Virus Disease 2019 in Wuhan, China. MULTIPLE ENTRY (data was collected at two points in time)";




*	Rename variables;
*		Creatinine;
rename KidneyCreatinineICUadmis Creatinine_ICU_N;
	rename G Creatinine_ICU_Mean;
	rename KidneyCreatinineICUadmiss Creatinine_ICU_STDEV;
	rename I Creatinine_ICU_LowRange;
	rename J Creatinine_ICU_UpRange;
	rename K Creatinine_ICU_Median;
	rename L Creatinine_ICU_Q1;
	rename M Creatinine_ICU_Q3;
	rename N Creatinine_ICU_Unit;
rename KidneyCreatinineNonICUa Creatinine_NonICU_N;
	rename P Creatinine_NonICU_Mean;
	rename KidneyCreatinineNonICUad Creatinine_NonICU_STDEV;
	rename R Creatinine_NonICU_LowRange;
	rename S Creatinine_NonICU_UpRange;
	rename T Creatinine_NonICU_Median;
	rename U Creatinine_NonICU_Q1;
	rename V Creatinine_NonICU_Q3;
	rename W Creatinine_NonICU_Unit;
rename KidneyCreatinineHospitaliz Creatinine_Hosp_N;
	rename Y Creatinine_Hosp_Mean;
	rename Z Creatinine_Hosp_STDEV;
	rename AA Creatinine_Hosp_LowRange;
	rename AB Creatinine_Hosp_UpRange;
	rename AC Creatinine_Hosp_Median;
	rename AD Creatinine_Hosp_Q1;
	rename AE Creatinine_Hosp_Q3;
	rename AF Creatinine_Hosp_Unit;
rename KidneyCreatinineNonhospit Creatinine_Nonhosp_N;
	rename AH Creatinine_Nonhosp_Mean;
	rename AI Creatinine_Nonhosp_STDEV;
	rename AJ Creatinine_Nonhosp_LowRange;
	rename AK Creatinine_Nonhosp_UpRange;
	rename AL Creatinine_Nonhosp_Median;
	rename AM Creatinine_Nonhosp_Q1;
	rename AN Creatinine_Nonhosp_Q3;
	rename AO Creatinine_Nonhosp_Unit;
rename KidneyCreatinineIntubated Creatinine_Intub_N;
	rename AQ Creatinine_Intub_Mean;
	rename AR Creatinine_Intub_STDEV;
	rename AS Creatinine_Intub_LowRange;
	rename AT Creatinine_Intub_UpRange;
	rename AU Creatinine_Intub_Median;
	rename AV Creatinine_Intub_Q1;
	rename AW Creatinine_Intub_Q3;
	rename AX Creatinine_Intub_Unit;
rename KidneyCreatinineNonintuba Creatinine_Nonintub_N;
	rename AZ Creatinine_Nonintub_Mean;
	rename BA Creatinine_Nonintub_STDEV;
	rename BB Creatinine_Nonintub_LowRange;
	rename BC Creatinine_Nonintub_UpRange;
	rename BD Creatinine_Nonintub_Median;
	rename BE Creatinine_Nonintub_Q1;
	rename BF Creatinine_Nonintub_Q3;
	rename BG Creatinine_Nonintub_Unit;
rename KidneyCreatinineMortality Creatinine_Mortality_N;
	rename BI Creatinine_Mortality_Mean;
	rename BJ Creatinine_Mortality_STDEV;
	rename BK Creatinine_Mortality_LowRange;
	rename BL Creatinine_Mortality_UpRange;
	rename BM Creatinine_Mortality_Median;
	rename BN Creatinine_Mortality_Q1;
	rename BO Creatinine_Mortality_Q3;
	rename BP Creatinine_Mortality_Unit;
rename KidneyCreatinineSurvived Creatinine_Survived_N;
	rename BR Creatinine_Survived_Mean;
	rename BS Creatinine_Survived_STDEV;
	rename BT Creatinine_Survived_LowRange;
	rename BU Creatinine_Survived_UpRange;
	rename BV Creatinine_Survived_Median;
	rename BW Creatinine_Survived_Q1;
	rename BX Creatinine_Survived_Q3;
	rename BY Creatinine_Survived_Unit;
rename KidneyCreatinineReportedf Creatinine_Other;
	rename KidneyCreatinineOtherNu Creatinine_Other_N;
	rename KidneyCreatinineOtherME Creatinine_Other_Mean;
	rename KidneyCreatinineOtherST Creatinine_Other_STDEV;
	rename KidneyCreatinineOtherRA Creatinine_Other_LowRange;
	rename CE Creatinine_Other_UpRange;
	rename CF Creatinine_Other_Median;
	rename KidneyCreatinineOtherIQ Creatinine_Other_Q1;
	rename CH Creatinine_Other_Q3;
	rename KidneyCreatinineOtherUN Creatinine_Other_Unit;
*		Blood Urea Nitrogen (BUN);
rename KidneyBloodUreaNitrogenI BUN_ICU_N;
	rename CK BUN_ICU_Mean;
	rename KidneyBloodUreaNitrogenIC BUN_ICU_STDEV;
	rename CM BUN_ICU_LowRange;
	rename CN BUN_ICU_UpRange;
	rename CO BUN_ICU_Median;
	rename CP BUN_ICU_Q1;
	rename CQ BUN_ICU_Q3;
	rename CR BUN_ICU_Unit;
rename KidneyBloodUreaNitrogenN BUN_NonICU_N;
	rename CT BUN_NonICU_Mean;
	rename KidneyBloodUreaNitrogenNo BUN_NonICU_STDEV;
	rename CV BUN_NonICU_LowRange;
	rename CW BUN_NonICU_UpRange;
	rename CX BUN_NonICU_Median;
	rename CY BUN_NonICU_Q1;
	rename CZ BUN_NonICU_Q3;
	rename DA BUN_NonICU_Unit;
rename KidneyBloodUreaNitrogenH BUN_Hosp_N;
	rename DC BUN_Hosp_Mean;
	rename DD BUN_Hosp_STDEV;
	rename DE BUN_Hosp_LowRange;
	rename DF BUN_Hosp_UpRange;
	rename DG BUN_Hosp_Median;
	rename DH BUN_Hosp_Q1;
	rename DI BUN_Hosp_Q3;
	rename DJ BUN_Hosp_Unit;
rename DK BUN_Nonhosp_N;
	rename DL BUN_Nonhosp_Mean;
	rename DM BUN_Nonhosp_STDEV;
	rename DN BUN_Nonhosp_LowRange;
	rename DO BUN_Nonhosp_UpRange;
	rename DP BUN_Nonhosp_Median;
	rename DQ BUN_Nonhosp_Q1;
	rename DR BUN_Nonhosp_Q3;
	rename DS BUN_Nonhosp_Unit;
rename DT BUN_Intub_N;
	rename DU BUN_Intub_Mean;
	rename DV BUN_Intub_STDEV;
	rename DW BUN_Intub_LowRange;
	rename DX BUN_Intub_UpRange;
	rename DY BUN_Intub_Median;
	rename DZ BUN_Intub_Q1;
	rename EA BUN_Intub_Q3;
	rename KidneyBloodUreaNitrogenIn BUN_Intub_Unit;
rename EC BUN_Nonintub_N;
	rename ED BUN_Nonintub_Mean;
	rename EE BUN_Nonintub_STDEV;
	rename EF BUN_Nonintub_LowRange;
	rename EG BUN_Nonintub_UpRange;
	rename EH BUN_Nonintub_Median;
	rename EI BUN_Nonintub_Q1;
	rename EJ BUN_Nonintub_Q3;
	rename EK BUN_Nonintub_Unit;
rename KidneyBloodUreaNitrogenM BUN_Mortality_N;
	rename EM BUN_Mortality_Mean;
	rename EN BUN_Mortality_STDEV;
	rename EO BUN_Mortality_LowRange;
	rename EP BUN_Mortality_UpRange;
	rename EQ BUN_Mortality_Median;
	rename ER BUN_Mortality_Q1;
	rename ES BUN_Mortality_Q3;
	rename ET BUN_Mortality_Unit;
rename KidneyBloodUreaNitrogenS BUN_Survived_N;
	rename EV BUN_Survived_Mean;
	rename EW BUN_Survived_STDEV;
	rename EX BUN_Survived_LowRange;
	rename EY BUN_Survived_UpRange;
	rename EZ BUN_Survived_Median;
	rename FA BUN_Survived_Q1;
	rename FB BUN_Survived_Q3;
	rename FC BUN_Survived_Unit;
rename KidneyBloodUreaNitrogenR BUN_Other;
	rename KidneyBloodUreaNitrogenO BUN_Other_N;
	rename FF BUN_Other_Mean;
	rename FG BUN_Other_STDEV;
	rename FH BUN_Other_LowRange;
	rename FI BUN_Other_UpRange;
	rename FJ BUN_Other_Median;
	rename FK BUN_Other_Q1;
	rename FL BUN_Other_Q3;
	rename FM BUN_Other_Unit;
*		Kidney GFR;
rename KidneyGFRICUadmissionN GFR_ICU_N;
	rename KidneyGFRICUadmissionM GFR_ICU_Mean;
	rename KidneyGFRICUadmissionS GFR_ICU_STDEV;
	rename KidneyGFRICUadmissionR GFR_ICU_LowRange;
	rename FR GFR_ICU_UpRange;
	rename FS GFR_ICU_Median;
	rename KidneyGFRICUadmissionI GFR_ICU_Q1;
	rename FU GFR_ICU_Q3;
	rename KidneyGFRICUadmissionU GFR_ICU_Unit;
rename KidneyGFRNonICUadmission GFR_NonICU_N;
	rename FX GFR_NonICU_Mean;
	rename FY GFR_NonICU_STDEV;
	rename FZ GFR_NonICU_LowRange;
	rename GA GFR_NonICU_UpRange;
	rename GB GFR_NonICU_Median;
	rename GC GFR_NonICU_Q1;
	rename GD GFR_NonICU_Q3;
	rename GE GFR_NonICU_Unit;
rename KidneyGFRHospitalizedNu GFR_Hosp_N;
	rename KidneyGFRHospitalizedME GFR_Hosp_Mean;
	rename KidneyGFRHospitalizedST GFR_Hosp_STDEV;
	rename KidneyGFRHospitalizedRA GFR_Hosp_LowRange;
	rename GJ GFR_Hosp_UpRange;
	rename GK GFR_Hosp_Median;
	rename KidneyGFRHospitalizedIQ GFR_Hosp_Q1;
	rename GM GFR_Hosp_Q3;
	rename KidneyGFRHospitalizedUN GFR_Hosp_Unit;
rename KidneyGFRNonhospitalized GFR_Nonhosp_N;
	rename GP GFR_Nonhosp_Mean;
	rename GQ GFR_Nonhosp_STDEV;
	rename GR GFR_Nonhosp_LowRange;
	rename GS GFR_Nonhosp_UpRange;
	rename GT GFR_Nonhosp_Median;
	rename GU GFR_Nonhosp_Q1;
	rename GV GFR_Nonhosp_Q3;
	rename GW GFR_Nonhosp_Unit;
rename KidneyGFRIntubatedNumbe GFR_Intub_N;
	rename KidneyGFRIntubatedMEAN GFR_Intub_Mean;
	rename KidneyGFRIntubatedSTDEV GFR_Intub_STDEV;
	rename KidneyGFRIntubatedRANG GFR_Intub_LowRange;
	rename KidneyGFRIntubatedRANGE GFR_Intub_UpRange;
	rename KidneyGFRIntubatedMEDIA GFR_Intub_Median;
	rename KidneyGFRIntubatedIQRQ GFR_Intub_Q1;
	rename HE GFR_Intub_Q3;
	rename KidneyGFRIntubatedUNIT GFR_Intub_Unit;
rename KidneyGFRNonintubatedN GFR_Nonintub_N;
	rename KidneyGFRNonintubatedM GFR_Nonintub_Mean;
	rename KidneyGFRNonintubatedS GFR_Nonintub_STDEV;
	rename KidneyGFRNonintubated GFR_Nonintub_LowRange;
	rename KidneyGFRNonintubatedR GFR_Nonintub_UpRange;
	rename HL GFR_Nonintub_Median;
	rename KidneyGFRNonintubatedI GFR_Nonintub_Q1;
	rename HN GFR_Nonintub_Q3;
	rename KidneyGFRNonintubatedU GFR_Nonintub_Unit;
rename KidneyGFRMortalityNumbe GFR_Mortality_N;
	rename KidneyGFRMortalityMEAN GFR_Mortality_Mean;
	rename KidneyGFRMortalitySTDEV GFR_Mortality_STDEV;
	rename KidneyGFRMortalityRANGE GFR_Mortality_LowRange;
	rename HT GFR_Mortality_UpRange;
	rename KidneyGFRMortalityMEDIA GFR_Mortality_Median;
	rename KidneyGFRMortalityIQRQ GFR_Mortality_Q1;
	rename HW GFR_Mortality_Q3;
	rename KidneyGFRMortalityUNIT GFR_Mortality_Unit;
rename KidneyGFRSurvivedNumber GFR_Survived_N;
	rename KidneyGFRSurvivedMEAN GFR_Survived_Mean;
	rename KidneyGFRSurvivedSTDEV GFR_Survived_STDEV;
	rename KidneyGFRSurvivedRANGE GFR_Survived_LowRange;
	rename IC GFR_Survived_UpRange;
	rename KidneyGFRSurvivedMEDIAN GFR_Survived_Median;
	rename KidneyGFRSurvivedIQRQ1 GFR_Survived_Q1;
	rename KidneyGFRSurvivedIQRQ3 GFR_Survived_Q3;
	rename KidneyGFRSurvivedUNIT GFR_Survived_Unit;
rename KidneyGFRReportedforothe GFR_Other;
	rename KidneyGFROtherNumberof GFR_Other_N;
	rename KidneyGFROtherMEAN GFR_Other_Mean;
	rename KidneyGFROtherSTDEV GFR_Other_STDEV;
	rename KidneyGFROtherRANGELOW GFR_Other_LowRange;
	rename KidneyGFROtherRANGEUPP GFR_Other_UpRange;
	rename KidneyGFROtherMEDIAN GFR_Other_Median;
	rename KidneyGFROtherIQRQ1 GFR_Other_Q1;
	rename KidneyGFROtherIQRQ3 GFR_Other_Q3;
	rename KidneyGFROtherUNIT GFR_Other_Unit;
	
	
	
*	Data cleaning;
replace BUN_Mortality_Mean="9.368" if BUN_Mortality_Mean=="9368";
replace BUN_Mortality_STDEV="7.360" if BUN_Mortality_STDEV=="7360";
		
	

*	Destring data ;
quietly ds Timestamp Zotero Reporttitle *Unit, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Standardize units;
foreach v of varlist *Unit {;
replace `v' = "mmol/L" if `v' == "mmol/l" | `v'=="mmol/ L";
	replace `v'="µmol/L" if `v'=="µmol/l" | `v'=="umol/L" |
		`v'=="μmol/l" | `v'=="μmol/L" | `v'=="µmol/ L" |
		`v'=="μmol/L ";
	replace `v' = "mg/dL" if `v' == "mg/dl";
	replace `v'="mL/min" if `v'=="ml/min" | `v'=="mL/min/1.73 m^2" | 
		`v'=="mL/min per 1.73 m^2" | `v'=="mL x min e−1 x 1.73 m e−2";
	replace `v' = "." if `v'=="#" | `v' =="##" | `v'=="#" | `v'=="";
};



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-BUN_Survived_Unit;
duplicates drop Zoterokey-BUN_Survived_Unit, force;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Creatinine_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Creatinine_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Creatinine_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Creatinine_Mortality_N==14;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Reporttitle=="Development and external validation of a prognostic multivariable model on admission for hospitalized patients with COVID-19; VALIDATION COHORT";



*	Unit conversion;
codebook *_Unit;


****************
***Creatinine***
****************

*		Creatinine - ICU;
foreach v of varlist Creatinine_ICU_Mean-Creatinine_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_ICU_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_ICU_Unit == "mg/dL";
	};
};
replace Creatinine_ICU_Unit = "." if Zotero=="WSE7WTFK";



*		Creatinine - Non ICU;
foreach v of varlist Creatinine_NonICU_Mean-Creatinine_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_NonICU_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_NonICU_Unit == "mg/dL";
	};
};



*		Creatinine - Hospitalized;
replace Creatinine_Hosp_Unit="µmol/L" if Creatinine_Hosp_Unit == "mmol/L"; //authors entered the wrong units


foreach v of varlist Creatinine_Hosp_Mean-Creatinine_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Hosp_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_Hosp_Unit == "mg/dL";
	};
};




*		Creatinine - Non hospitalized;
foreach v of varlist Creatinine_Nonhosp_Mean-Creatinine_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Nonhosp_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_Nonhosp_Unit == "mg/dL";
	};
};




*		Creatinine - Intubated;
foreach v of varlist Creatinine_Intub_Mean-Creatinine_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Intub_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_Intub_Unit == "mg/dL";
	};
};




*		Creatinine - Non Intubated;
foreach v of varlist Creatinine_Nonintub_Mean-Creatinine_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Nonintub_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_Nonintub_Unit == "mg/dL";
	};
};



*		Creatinine - Mortality;
foreach v of varlist Creatinine_Mortality_Mean-Creatinine_Mortality_STDEV Creatinine_Mortality_UpRange-Creatinine_Mortality_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Mortality_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
		replace `v' = `v'*10^(6) if Creatinine_Mortality_Unit =="mol/L";
	};
	else {;
		replace `v' = "µmol/L" if Creatinine_Mortality_Unit == "mg/dL";
		replace `v' = "µmol/L" if Creatinine_Mortality_Unit=="µM"; //µM=umol/L	
		replace `v' = "µmol/L" if Creatinine_Mortality_Unit=="mol/L";
	};
};
replace Creatinine_Mortality_Unit="µmol/L" if Z=="BJEBXVJ2";




*		Creatinine - Survived;
foreach v of varlist Creatinine_Survived_Mean- Creatinine_Survived_STDEV Creatinine_Survived_UpRange-Creatinine_Survived_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'* 88.4 if Creatinine_Survived_Unit == "mg/dL"; //convertion creatinine: 1 mg/dL = 88.4 µmol/L
		replace `v' = `v'*10^(6) if Creatinine_Survived_Unit =="mol/L";
	};
	else {;
		replace `v'= "µmol/L" if Creatinine_Survived_Unit == "mg/dL";
		replace `v'= "µmol/L" if Creatinine_Survived_Unit=="µM"; //µM=umol/L
		replace `v' = "µmol/L" if Creatinine_Survived_Unit=="mol/L";
	};
};
replace Creatinine_Survived_Unit="µmol/L" if Z=="BJEBXVJ2";




****************
***BUN***
****************


*		Blood Urine Nitrogen (BUN) - Hospitalized;
foreach v of varlist BUN_Hosp_Mean-BUN_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*0.357 if BUN_Hosp_Unit == "mg/dL"; // conversion BUN: 1 mg/dL = 0.357 mmol/L
	};
	else {;
		replace `v' = "mmol/L" if BUN_Hosp_Unit == "mg/dL";
	};
};



*		BUN - Non ICU;
foreach v of varlist BUN_NonICU_Mean-BUN_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*0.357 if BUN_NonICU_Unit == "mg/dL"; // conversion BUN: 1 mg/dL = 0.357 mmol/L
	};
	else {;
		replace `v' = "mmol/L" if BUN_NonICU_Unit == "mg/dL";
	};
};



*		BUN - ICU;
foreach v of varlist BUN_ICU_Mean-BUN_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*0.357 if BUN_ICU_Unit == "mg/dL"; // conversion BUN: 1 mg/dL = 0.357 mmol/L
	};
	else {;
		replace `v' = "mmol/L" if BUN_ICU_Unit == "mg/dL";
	};
};






codebook *_Unit;




*******************************************************************************;

save "03 Kidney/COVIDSR_Kidney_CLEAN_20200922 - data", replace;

export delimited using "03 Kidney\COVIDSR_Kidney_CSV.csv", replace;

capture log close;














