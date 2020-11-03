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

Liver - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Liver_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Liver") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Drop second time point entry;
drop if Report=="Clinical Features and Short-term Outcomes of 102 Patients with Corona Virus Disease 2019 in Wuhan, China. MULTIPLE ENTRY (data was collected at two points in time)";



*	Rename variables;
*		Lactate dehydrogenase (LDH);
rename LiverLDHICUadmissionNu LDH_ICU_N;
	rename LiverLDHICUadmissionME LDH_ICU_Mean;
	rename LiverLDHICUadmissionST LDH_ICU_STDEV;
	rename LiverLDHICUadmissionRA LDH_ICU_LowRange;
	rename J LDH_ICU_UpRange;
	rename K LDH_ICU_Median;
	rename LiverLDHICUadmissionIQ LDH_ICU_Q1;
	rename M LDH_ICU_Q3;
	rename LiverLDHICUadmissionUN LDH_ICU_Unit;
rename LiverLDHNonICUadmission LDH_NonICU_N;
	rename P LDH_NonICU_Mean;
	rename Q LDH_NonICU_STDEV;
	rename R LDH_NonICU_LowRange;
	rename S LDH_NonICU_UpRange;
	rename T LDH_NonICU_Median;
	rename U LDH_NonICU_Q1;
	rename V LDH_NonICU_Q3;
	rename W LDH_NonICU_Unit;
rename LiverLDHHospitalizedNum LDH_Hosp_N;
	rename LiverLDHHospitalizedMEA LDH_Hosp_Mean;
	rename LiverLDHHospitalizedSTD LDH_Hosp_STDEV;
	rename LiverLDHHospitalizedRAN LDH_Hosp_LowRange;
	rename AB LDH_Hosp_UpRange;
	rename LiverLDHHospitalizedMED LDH_Hosp_Median;
	rename LiverLDHHospitalizedIQR LDH_Hosp_Q1;
	rename AE LDH_Hosp_Q3;
	rename LiverLDHHospitalizedUNI LDH_Hosp_Unit;
rename LiverLDHNonhospitalized LDH_Nonhosp_N;
	rename AH LDH_Nonhosp_Mean;
	rename AI LDH_Nonhosp_STDEV;
	rename AJ LDH_Nonhosp_LowRange;
	rename AK LDH_Nonhosp_UpRange;
	rename AL LDH_Nonhosp_Median;
	rename AM LDH_Nonhosp_Q1;
	rename AN LDH_Nonhosp_Q3;
	rename AO LDH_Nonhosp_Unit;
rename LiverLDHIntubatedNumber LDH_Intub_N;
	rename LiverLDHIntubatedMEAN LDH_Intub_Mean;
	rename LiverLDHIntubatedSTDEV LDH_Intub_STDEV;
	rename LiverLDHIntubatedRANGE LDH_Intub_LowRange;
	rename AT LDH_Intub_UpRange;
	rename LiverLDHIntubatedMEDIAN LDH_Intub_Median;
	rename LiverLDHIntubatedIQRQ1 LDH_Intub_Q1;
	rename LiverLDHIntubatedIQRQ3 LDH_Intub_Q3;
	rename LiverLDHIntubatedUNIT LDH_Intub_Unit;
rename LiverLDHNonintubatedNu LDH_Nonintub_N;
	rename LiverLDHNonintubatedME LDH_Nonintub_Mean;
	rename LiverLDHNonintubatedST LDH_Nonintub_STDEV;
	rename LiverLDHNonintubatedRA LDH_Nonintub_LowRange;
	rename BC LDH_Nonintub_UpRange;
	rename BD LDH_Nonintub_Median;
	rename LiverLDHNonintubatedIQ LDH_Nonintub_Q1;
	rename BF LDH_Nonintub_Q3;
	rename LiverLDHNonintubatedUN LDH_Nonintub_Unit;
rename LiverLDHMortalityNumber LDH_Mortality_N;
	rename LiverLDHMortalityMEAN LDH_Mortality_Mean;
	rename LiverLDHMortalitySTDEV LDH_Mortality_STDEV;
	rename LiverLDHMortalityRANGE LDH_Mortality_LowRange;
	rename BL LDH_Mortality_UpRange;
	rename LiverLDHMortalityMEDIAN LDH_Mortality_Median;
	rename LiverLDHMortalityIQRQ1 LDH_Mortality_Q1;
	rename LiverLDHMortalityIQRQ3 LDH_Mortality_Q3;
	rename LiverLDHMortalityUNIT LDH_Mortality_Unit;
rename LiverLDHSurvivedNumber LDH_Survived_N;
	rename LiverLDHSurvivedMEAN LDH_Survived_Mean;
	rename LiverLDHSurvivedSTDEV LDH_Survived_STDEV;
	rename LiverLDHSurvivedRANGEL LDH_Survived_LowRange;
	rename LiverLDHSurvivedRANGEU LDH_Survived_UpRange;
	rename LiverLDHSurvivedMEDIAN LDH_Survived_Median;
	rename LiverLDHSurvivedIQRQ1 LDH_Survived_Q1;
	rename LiverLDHSurvivedIQRQ3 LDH_Survived_Q3;
	rename LiverLDHSurvivedUNIT LDH_Survived_Unit;
rename LiverLDHReportedforother LDH_Other;
	rename LiverLDHOtherNumberof LDH_Other_N;
	rename LiverLDHOtherMEAN LDH_Other_Mean;
	rename LiverLDHOtherSTDEV LDH_Other_STDEV;
	rename LiverLDHOtherRANGELOWE LDH_Other_LowRange;
	rename LiverLDHOtherRANGEUPPE LDH_Other_UpRange;
	rename LiverLDHOtherMEDIAN LDH_Other_Median;
	rename LiverLDHOtherIQRQ1 LDH_Other_Q1;
	rename LiverLDHOtherIQRQ3 LDH_Other_Q3;
	rename LiverLDHOtherUNIT LDH_Other_Unit;
*		Albumin;
rename LiverAlbumineICUadmission Albumin_ICU_N;
	rename CK Albumin_ICU_Mean;
	rename CL Albumin_ICU_STDEV;
	rename CM Albumin_ICU_LowRange;
	rename CN Albumin_ICU_UpRange;
	rename CO Albumin_ICU_Median;
	rename CP Albumin_ICU_Q1;
	rename CQ Albumin_ICU_Q3;
	rename CR Albumin_ICU_Unit;
rename LiverAlbumineNonICUadmis Albumin_NonICU_N;
	rename CT Albumin_NonICU_Mean;
	rename CU Albumin_NonICU_STDEV;
	rename CV Albumin_NonICU_LowRange;
	rename CW Albumin_NonICU_UpRange;
	rename CX Albumin_NonICU_Median;
	rename CY Albumin_NonICU_Q1;
	rename CZ Albumin_NonICU_Q3;
	rename DA Albumin_NonICU_Unit;
rename LiverAlbumineHospitalized Albumin_Hosp_N;
	rename DC Albumin_Hosp_Mean;
	rename DD Albumin_Hosp_STDEV;
	rename DE Albumin_Hosp_LowRange;
	rename DF Albumin_Hosp_UpRange;
	rename DG Albumin_Hosp_Median;
	rename DH Albumin_Hosp_Q1;
	rename DI Albumin_Hosp_Q3;
	rename DJ Albumin_Hosp_Unit;
rename LiverAlbumineNonhospitali Albumin_Nonhosp_N;
	rename DL Albumin_Nonhosp_Mean;
	rename DM Albumin_Nonhosp_STDEV;
	rename DN Albumin_Nonhosp_LowRange;
	rename DO Albumin_Nonhosp_UpRange;
	rename DP Albumin_Nonhosp_Median;
	rename DQ Albumin_Nonhosp_Q1;
	rename DR Albumin_Nonhosp_Q3;
	rename DS Albumin_Nonhosp_Unit;
rename LiverAlbumineIntubatedN Albumin_Intub_N;
	rename LiverAlbumineIntubatedM Albumin_Intub_Mean;
	rename LiverAlbumineIntubatedS Albumin_Intub_STDEV;
	rename LiverAlbumineIntubatedR Albumin_Intub_LowRange;
	rename DX Albumin_Intub_UpRange;
	rename DY Albumin_Intub_Median;
	rename LiverAlbumineIntubatedI Albumin_Intub_Q1;
	rename EA Albumin_Intub_Q3;
	rename LiverAlbumineIntubatedU Albumin_Intub_Unit;
rename LiverAlbumineNonintubated Albumin_Nonintub_N;
	rename ED Albumin_Nonintub_Mean;
	rename EE Albumin_Nonintub_STDEV;
	rename EF Albumin_Nonintub_LowRange;
	rename EG Albumin_Nonintub_UpRange;
	rename EH Albumin_Nonintub_Median;
	rename EI Albumin_Nonintub_Q1;
	rename EJ Albumin_Nonintub_Q3;
	rename EK Albumin_Nonintub_Unit;
rename LiverAlbumineMortalityN Albumin_Mortality_N;
	rename LiverAlbumineMortalityM Albumin_Mortality_Mean;
	rename LiverAlbumineMortalityS Albumin_Mortality_STDEV;
	rename LiverAlbumineMortalityR Albumin_Mortality_LowRange;
	rename EP Albumin_Mortality_UpRange;
	rename EQ Albumin_Mortality_Median;
	rename LiverAlbumineMortalityI Albumin_Mortality_Q1;
	rename ES Albumin_Mortality_Q3;
	rename LiverAlbumineMortalityU Albumin_Mortality_Unit;
rename LiverAlbumineSurvivedNu Albumin_Survived_N;
	rename LiverAlbumineSurvivedME Albumin_Survived_Mean;
	rename LiverAlbumineSurvivedST Albumin_Survived_STDEV;
	rename LiverAlbumineSurvivedRA Albumin_Survived_LowRange;
	rename EY Albumin_Survived_UpRange;
	rename EZ Albumin_Survived_Median;
	rename LiverAlbumineSurvivedIQ Albumin_Survived_Q1;
	rename FB Albumin_Survived_Q3;
	rename LiverAlbumineSurvivedUN Albumin_Survived_Unit;
rename LiverAlbumineReportedfor Albumin_Other;
	rename LiverAlbumineOtherNumbe Albumin_Other_N;
	rename LiverAlbumineOtherMEAN Albumin_Other_Mean;
	rename LiverAlbumineOtherSTDEV Albumin_Other_STDEV;
	rename LiverAlbumineOtherRANGE Albumin_Other_LowRange;
	rename FI Albumin_Other_UpRange;
	rename LiverAlbumineOtherMEDIA Albumin_Other_Median;
	rename LiverAlbumineOtherIQRQ Albumin_Other_Q1;
	rename FL Albumin_Other_Q3;
	rename LiverAlbumineOtherUNIT Albumin_Other_Unit;
*		Aspartate aminotransferase (ASAT / GOT);
rename GOTASATICUadmissionNum ASAT_ICU_N;
	rename GOTASATICUadmissionMEA ASAT_ICU_Mean;
	rename GOTASATICUadmissionSTD ASAT_ICU_STDEV;
	rename GOTASATICUadmissionRAN ASAT_ICU_LowRange;
	rename FR ASAT_ICU_UpRange;
	rename GOTASATICUadmissionMED ASAT_ICU_Median;
	rename GOTASATICUadmissionIQR ASAT_ICU_Q1;
	rename FU ASAT_ICU_Q3;
	rename GOTASATICUadmissionUNI ASAT_ICU_Unit;
rename GOTASATNonICUadmission ASAT_NonICU_N;
	rename FX ASAT_NonICU_Mean;
	rename FY ASAT_NonICU_STDEV;
	rename FZ ASAT_NonICU_LowRange;
	rename GA ASAT_NonICU_UpRange;
	rename GB ASAT_NonICU_Median;
	rename GC ASAT_NonICU_Q1;
	rename GD ASAT_NonICU_Q3;
	rename GE ASAT_NonICU_Unit;
rename GOTASATHospitalizedNumb ASAT_Hosp_N;
	rename GOTASATHospitalizedMEAN ASAT_Hosp_Mean;
	rename GOTASATHospitalizedSTDE ASAT_Hosp_STDEV;
	rename GOTASATHospitalizedRANG ASAT_Hosp_LowRange;
	rename GJ ASAT_Hosp_UpRange;
	rename GOTASATHospitalizedMEDI ASAT_Hosp_Median;
	rename GOTASATHospitalizedIQR ASAT_Hosp_Q1;
	rename GM ASAT_Hosp_Q3;
	rename GOTASATHospitalizedUNIT ASAT_Hosp_Unit;
rename GOTASATNonhospitalized ASAT_Nonhosp_N;
	rename GP ASAT_Nonhosp_Mean;
	rename GQ ASAT_Nonhosp_STDEV;
	rename GR ASAT_Nonhosp_LowRange;
	rename GS ASAT_Nonhosp_UpRange;
	rename GT ASAT_Nonhosp_Median;
	rename GU ASAT_Nonhosp_Q1;
	rename GV ASAT_Nonhosp_Q3;
	rename GW ASAT_Nonhosp_Unit;
rename GOTASATIntubatedNumber ASAT_Intub_N;
	rename GOTASATIntubatedMEAN ASAT_Intub_Mean;
	rename GOTASATIntubatedSTDEV ASAT_Intub_STDEV;
	rename GOTASATIntubatedRANGEL ASAT_Intub_LowRange;
	rename GOTASATIntubatedRANGEU ASAT_Intub_UpRange;
	rename GOTASATIntubatedMEDIAN ASAT_Intub_Median;
	rename GOTASATIntubatedIQRQ1 ASAT_Intub_Q1;
	rename GOTASATIntubatedIQRQ3 ASAT_Intub_Q3;
	rename GOTASATIntubatedUNIT ASAT_Intub_Unit;
rename GOTASATNonintubatedNum ASAT_Nonintub_N;
	rename GOTASATNonintubatedMEA ASAT_Nonintub_Mean;
	rename GOTASATNonintubatedSTD ASAT_Nonintub_STDEV;
	rename GOTASATNonintubatedRAN ASAT_Nonintub_LowRange;
	rename HK ASAT_Nonintub_UpRange;
	rename GOTASATNonintubatedMED ASAT_Nonintub_Median;
	rename GOTASATNonintubatedIQR ASAT_Nonintub_Q1;
	rename HN ASAT_Nonintub_Q3;
	rename GOTASATNonintubatedUNI ASAT_Nonintub_Unit;
rename GOTASATMortalityNumber ASAT_Mortality_N;
	rename GOTASATMortalityMEAN ASAT_Mortality_Mean;
	rename GOTASATMortalitySTDEV ASAT_Mortality_STDEV;
	rename GOTASATMortalityRANGEL ASAT_Mortality_LowRange;
	rename GOTASATMortalityRANGEU ASAT_Mortality_UpRange;
	rename GOTASATMortalityMEDIAN ASAT_Mortality_Median;
	rename GOTASATMortalityIQRQ1 ASAT_Mortality_Q1;
	rename GOTASATMortalityIQRQ3 ASAT_Mortality_Q3;
	rename GOTASATMortalityUNIT ASAT_Mortality_Unit;
rename GOTASATSurvivedNumbero ASAT_Survived_N;
	rename GOTASATSurvivedMEAN ASAT_Survived_Mean;
	rename GOTASATSurvivedSTDEV ASAT_Survived_STDEV;
	rename GOTASATSurvivedRANGELO ASAT_Survived_LowRange;
	rename GOTASATSurvivedRANGEUP ASAT_Survived_UpRange;
	rename GOTASATSurvivedMEDIAN ASAT_Survived_Median;
	rename GOTASATSurvivedIQRQ1 ASAT_Survived_Q1;
	rename GOTASATSurvivedIQRQ3 ASAT_Survived_Q3;
	rename GOTASATSurvivedUNIT ASAT_Survived_Unit;
rename GOTASATReportedforother ASAT_Other;
	rename GOTASATOtherNumberofp ASAT_Other_N;
	rename GOTASATOtherMEAN ASAT_Other_Mean;
	rename GOTASATOtherSTDEV ASAT_Other_STDEV;
	rename GOTASATOtherRANGELOWER ASAT_Other_LowRange;
	rename GOTASATOtherRANGEUPPER ASAT_Other_UpRange;
	rename GOTASATOtherMEDIAN ASAT_Other_Median;
	rename GOTASATOtherIQRQ1 ASAT_Other_Q1;
	rename GOTASATOtherIQRQ3 ASAT_Other_Q3;
	rename GOTASATOtherUNIT ASAT_Other_Unit;
*		Alanine aminotransferase (ALAT / GPT);
rename GPTALATICUadmissionNum ALAT_ICU_N;
	rename GPTALATICUadmissionMEA ALAT_ICU_Mean;
	rename GPTALATICUadmissionSTD ALAT_ICU_STDEV;
	rename GPTALATICUadmissionRAN ALAT_ICU_LowRange;
	rename IV ALAT_ICU_UpRange;
	rename GPTALATICUadmissionMED ALAT_ICU_Median;
	rename GPTALATICUadmissionIQR ALAT_ICU_Q1;
	rename IY ALAT_ICU_Q3;
	rename GPTALATICUadmissionUNI ALAT_ICU_Unit;
rename GPTALATNonICUadmission ALAT_NonICU_N;
	rename JB ALAT_NonICU_Mean;
	rename JC ALAT_NonICU_STDEV;
	rename JD ALAT_NonICU_LowRange;
	rename JE ALAT_NonICU_UpRange;
	rename JF ALAT_NonICU_Median;
	rename JG ALAT_NonICU_Q1;
	rename JH ALAT_NonICU_Q3;
	rename JI ALAT_NonICU_Unit;
rename GPTALATHospitalizedNumb ALAT_Hosp_N;
	rename GPTALATHospitalizedMEAN ALAT_Hosp_Mean;
	rename GPTALATHospitalizedSTDE ALAT_Hosp_STDEV;
	rename GPTALATHospitalizedRANG ALAT_Hosp_LowRange;
	rename JN ALAT_Hosp_UpRange;
	rename GPTALATHospitalizedMEDI ALAT_Hosp_Median;
	rename GPTALATHospitalizedIQR ALAT_Hosp_Q1;
	rename JQ ALAT_Hosp_Q3;
	rename GPTALATHospitalizedUNIT ALAT_Hosp_Unit;
rename GPTALATNonhospitalized ALAT_Nonhosp_N;
	rename JT ALAT_Nonhosp_Mean;
	rename JU ALAT_Nonhosp_STDEV;
	rename JV ALAT_Nonhosp_LowRange;
	rename JW ALAT_Nonhosp_UpRange;
	rename JX ALAT_Nonhosp_Median;
	rename JY ALAT_Nonhosp_Q1;
	rename JZ ALAT_Nonhosp_Q3;
	rename KA ALAT_Nonhosp_Unit;
rename GPTALATIntubatedNumber ALAT_Intub_N;
	rename GPTALATIntubatedMEAN ALAT_Intub_Mean;
	rename GPTALATIntubatedSTDEV ALAT_Intub_STDEV;
	rename GPTALATIntubatedRANGEL ALAT_Intub_LowRange;
	rename GPTALATIntubatedRANGEU ALAT_Intub_UpRange;
	rename GPTALATIntubatedMEDIAN ALAT_Intub_Median;
	rename GPTALATIntubatedIQRQ1 ALAT_Intub_Q1;
	rename GPTALATIntubatedIQRQ3 ALAT_Intub_Q3;
	rename GPTALATIntubatedUNIT ALAT_Intub_Unit;
rename GPTALATNonintubatedNum ALAT_Nonintub_N;
	rename GPTALATNonintubatedMEA ALAT_Nonintub_Mean;
	rename GPTALATNonintubatedSTD ALAT_Nonintub_STDEV;
	rename GPTALATNonintubatedRAN ALAT_Nonintub_LowRange;
	rename KO ALAT_Nonintub_UpRange;
	rename GPTALATNonintubatedMED ALAT_Nonintub_Median;
	rename GPTALATNonintubatedIQR ALAT_Nonintub_Q1;
	rename KR ALAT_Nonintub_Q3;
	rename GPTALATNonintubatedUNI ALAT_Nonintub_Unit;
rename GPTALATMortalityNumber ALAT_Mortality_N;
	rename GPTALATMortalityMEAN ALAT_Mortality_Mean;
	rename GPTALATMortalitySTDEV ALAT_Mortality_STDEV;
	rename GPTALATMortalityRANGEL ALAT_Mortality_LowRange;
	rename GPTALATMortalityRANGEU ALAT_Mortality_UpRange;
	rename GPTALATMortalityMEDIAN ALAT_Mortality_Median;
	rename GPTALATMortalityIQRQ1 ALAT_Mortality_Q1;
	rename GPTALATMortalityIQRQ3 ALAT_Mortality_Q3;
	rename GPTALATMortalityUNIT ALAT_Mortality_Unit;
rename GPTALATSurvivedNumbero ALAT_Survived_N;
	rename GPTALATSurvivedMEAN ALAT_Survived_Mean;
	rename GPTALATSurvivedSTDEV ALAT_Survived_STDEV;
	rename GPTALATSurvivedRANGELO ALAT_Survived_LowRange;
	rename GPTALATSurvivedRANGEUP ALAT_Survived_UpRange;
	rename GPTALATSurvivedMEDIAN ALAT_Survived_Median;
	rename GPTALATSurvivedIQRQ1 ALAT_Survived_Q1;
	rename GPTALATSurvivedIQRQ3 ALAT_Survived_Q3;
	rename GPTALATSurvivedUNIT ALAT_Survived_Unit;
rename GPTALATReportedforother ALAT_Other;
	rename GPTALATOtherNumberofp ALAT_Other_N;
	rename GPTALATOtherMEAN ALAT_Other_Mean;
	rename GPTALATOtherSTDEV ALAT_Other_STDEV;
	rename GPTALATOtherRANGELOWER ALAT_Other_LowRange;
	rename GPTALATOtherRANGEUPPER ALAT_Other_UpRange;
	rename GPTALATOtherMEDIAN ALAT_Other_Median;
	rename GPTALATOtherIQRQ1 ALAT_Other_Q1;
	rename GPTALATOtherIQRQ3 ALAT_Other_Q3;
	rename GPTALATOtherUNIT ALAT_Other_Unit;
	
	
	
*	Data edits;
replace Albumin_NonICU_Unit="433.975" if Albumin_NonICU_Unit=="433975";
	
	
	
*	Destring data ;
quietly ds Timestamp Zotero Reporttitle *Unit, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##" | | `v'=="+" |
		`v'=="unclear" | `v'=="unlcear";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Standardize units;
foreach v of varlist *Unit {;
	replace `v'="U/L" if `v'=="U/l" | `v'=="UI/L" | `v'=="IU/L" | `v'=="U/ L" |
		`v'=="IU?L";
	replace `v'="g/L" if `v'=="g/l" | `v'=="g/ L";
	replace `v'="g/dL" if `v'=="g/dl";
	replace `v'="." if `v'=="#" | `v' =="##" | `v'=="" ;
};


	
	
*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-ALAT_Survived_Unit;
duplicates drop Zoterokey-ALAT_Survived_Unit, force;


*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & ALAT_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & ALAT_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & LDH_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & LDH_Mortality_N==14;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Report=="Development and external validation of a prognostic multivariable model on admission for hospitalized patients with COVID-1; VALIDATION COHORT";


*	Data;
replace Albumin_NonICU_Q3=433.975 if Albumin_NonICU_Q3==433975;


*	Unit conversion;
codebook *_Unit;




*		Albumin - Survived;
replace Albumin_Survived_Unit="g/L" if Albumin_Survived_Unit=="U/L"; //the unit is in grams

foreach v of varlist Albumin_Survived_Mean-Albumin_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_Survived_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_Survived_Unit=="g/dL";
	};
};



*		Albumin - Mortality;
foreach v of varlist Albumin_Mortality_Mean-Albumin_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_Mortality_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_Mortality_Unit=="g/dL";
	};
};



*		Albumin - Non hospitalized;
foreach v of varlist Albumin_Nonhosp_Mean-Albumin_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_Nonhosp_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_Nonhosp_Unit=="g/dL";
	};
};



*		Albumin - Hospitalized;
foreach v of varlist Albumin_Hosp_Mean-Albumin_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_Hosp_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_Hosp_Unit=="g/dL";
	};
};



*		Albumin - Non ICU;
foreach v of varlist Albumin_NonICU_Mean-Albumin_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_NonICU_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_NonICU_Unit=="g/dL";
	};
};



*		Albumin - ICU;
foreach v of varlist Albumin_ICU_Mean-Albumin_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v'=`v'*10 if Albumin_ICU_Unit=="g/dL";
	};
	else {;
		replace `v'="g/L" if Albumin_ICU_Unit=="g/dL";
	};
};




codebook *_Unit;





*******************************************************************************;

save "04 Liver/COVIDSR_Liver_CLEAN_20200922 - data", replace;

export delimited using "04 Liver\COVIDSR_Liver_CSV.csv", replace;

capture log close;













