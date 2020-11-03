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

Coagulation - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Coagulation_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Coagulation") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Rename variables;
*		Prothrombin;
rename CoagulationProthrombininsec Prothrombin_ICU_N;
	rename G Prothrombin_ICU_Mean;
	rename H Prothrombin_ICU_STDEV;
	rename I Prothrombin_ICU_LowRange;
	rename J Prothrombin_ICU_UpRange;
	rename K Prothrombin_ICU_Median;
	rename L Prothrombin_ICU_Q1;
	rename M Prothrombin_ICU_Q3;
rename N Prothrombin_NonICU_N;
	rename O Prothrombin_NonICU_Mean;
	rename P Prothrombin_NonICU_STDEV;
	rename Q Prothrombin_NonICU_LowRange;
	rename R Prothrombin_NonICU_UpRange;
	rename S Prothrombin_NonICU_Median;
	rename T Prothrombin_NonICU_Q1;
	rename U Prothrombin_NonICU_Q3;
rename V Prothrombin_Hosp_N;
	rename W Prothrombin_Hosp_Mean;
	rename X Prothrombin_Hosp_STDEV;
	rename Y Prothrombin_Hosp_LowRange;
	rename Z Prothrombin_Hosp_UpRange;
	rename AA Prothrombin_Hosp_Median;
	rename AB Prothrombin_Hosp_Q1;
	rename AC Prothrombin_Hosp_Q3;
rename AD Prothrombin_Nonhosp_N;
	rename AE Prothrombin_Nonhosp_Mean;
	rename AF Prothrombin_Nonhosp_STDEV;
	rename AG Prothrombin_Nonhosp_LowRange;
	rename AH Prothrombin_Nonhosp_UpRange;
	rename AI Prothrombin_Nonhosp_Median;
	rename AJ Prothrombin_Nonhosp_Q1;
	rename AK Prothrombin_Nonhosp_Q3;
rename AL Prothrombin_Intub_N;
	rename AM Prothrombin_Intub_Mean;
	rename AN Prothrombin_Intub_STDEV;
	rename AO Prothrombin_Intub_LowRange;
	rename AP Prothrombin_Intub_UpRange;
	rename AQ Prothrombin_Intub_Median;
	rename AR Prothrombin_Intub_Q1;
	rename AS Prothrombin_Intub_Q3;
rename AT Prothrombin_Nonintub_N;
	rename AU Prothrombin_Nonintub_Mean;
	rename AV Prothrombin_Nonintub_STDEV;
	rename AW Prothrombin_Nonintub_LowRange;
	rename AX Prothrombin_Nonintub_UpRange;
	rename AY Prothrombin_Nonintub_Median;
	rename AZ Prothrombin_Nonintub_Q1;
	rename BA Prothrombin_Nonintub_Q3;
rename BB Prothrombin_Mortality_N;
	rename BC Prothrombin_Mortality_Mean;
	rename BD Prothrombin_Mortality_STDEV;
	rename BE Prothrombin_Mortality_LowRange;
	rename BF Prothrombin_Mortality_UpRange;
	rename BG Prothrombin_Mortality_Median;
	rename BH Prothrombin_Mortality_Q1;
	rename BI Prothrombin_Mortality_Q3;
rename BJ Prothrombin_Survived_N;
	rename BK Prothrombin_Survived_Mean;
	rename BL Prothrombin_Survived_STDEV;
	rename BM Prothrombin_Survived_LowRange;
	rename BN Prothrombin_Survived_UpRange;
	rename BO Prothrombin_Survived_Median;
	rename BP Prothrombin_Survived_Q1;
	rename BQ Prothrombin_Survived_Q3;
rename BR Prothrombin_Other;
	rename BS Prothrombin_Other_N;
	rename BT Prothrombin_Other_Mean;
	rename BU Prothrombin_Other_STDEV;
	rename BV Prothrombin_Other_LowRange;
	rename BW Prothrombin_Other_UpRange;
	rename BX Prothrombin_Other_Median;
	rename BY Prothrombin_Other_Q1;
	rename BZ Prothrombin_Other_Q3;
*		International Normalized Ratio (INR); 
rename CoagulationINRICUadmissio INR_ICU_N;
	rename EW INR_ICU_Mean;
	rename EX INR_ICU_STDEV;
	rename CoagulationINRICUadmission INR_ICU_LowRange;
	rename EZ INR_ICU_UpRange;
	rename FA INR_ICU_Median;
	rename FB INR_ICU_Q1;
	rename FC INR_ICU_Q3;
rename CoagulationINRNonICUadmi INR_NonICU_N;
	rename FE INR_NonICU_Mean;
	rename FF INR_NonICU_STDEV;
	rename CoagulationINRNonICUadmis INR_NonICU_LowRange;
	rename FH INR_NonICU_UpRange;
	rename FI INR_NonICU_Median;
	rename FJ INR_NonICU_Q1;
	rename FK INR_NonICU_Q3;
rename CoagulationINRHospitalized INR_Hosp_N;
	rename FM INR_Hosp_Mean;
	rename FN INR_Hosp_STDEV;
	rename FO INR_Hosp_LowRange;
	rename FP INR_Hosp_UpRange;
	rename FQ INR_Hosp_Median;
	rename FR INR_Hosp_Q1;
	rename FS INR_Hosp_Q3;
rename CoagulationINRNonhospital INR_Nonhosp_N;
	rename FU INR_Nonhosp_Mean;
	rename FV INR_Nonhosp_STDEV;
	rename FW INR_Nonhosp_LowRange;
	rename FX INR_Nonhosp_UpRange;
	rename FY INR_Nonhosp_Median;
	rename FZ INR_Nonhosp_Q1;
	rename GA INR_Nonhosp_Q3;
rename CoagulationINRIntubated INR_Intub_N;
	rename GC INR_Intub_Mean;
	rename GD INR_Intub_STDEV;
	rename GE INR_Intub_LowRange;
	rename GF INR_Intub_UpRange;
	rename GG INR_Intub_Median;
	rename GH INR_Intub_Q1;
	rename GI INR_Intub_Q3;
rename CoagulationINRNonintubate INR_Nonintub_N;
	rename GK INR_Nonintub_Mean;
	rename GL INR_Nonintub_STDEV;
	rename CoagulationINRNonintubat INR_Nonintub_LowRange;
	rename GN INR_Nonintub_UpRange;
	rename GO INR_Nonintub_Median;
	rename GP INR_Nonintub_Q1;
	rename GQ INR_Nonintub_Q3;
rename CoagulationINRMortality INR_Mortality_N;
	rename GS INR_Mortality_Mean;
	rename GT INR_Mortality_STDEV;
	rename GU INR_Mortality_LowRange;
	rename GV INR_Mortality_UpRange;
	rename GW INR_Mortality_Median;
	rename GX INR_Mortality_Q1;
	rename GY INR_Mortality_Q3;
rename CoagulationINRSurvived INR_Survived_N;
	rename HA INR_Survived_Mean;
	rename CoagulationINRSurvivedS INR_Survived_STDEV;
	rename HC INR_Survived_LowRange;
	rename HD INR_Survived_UpRange;
	rename CoagulationINRSurvivedM INR_Survived_Median;
	rename CoagulationINRSurvivedI INR_Survived_Q1;
	rename HG INR_Survived_Q3;
rename CoagulationINRReportedfo INR_Other;
	rename CoagulationINROtherNum INR_Other_N;
	rename CoagulationINROtherMEA INR_Other_Mean;
	rename CoagulationINROtherSTD INR_Other_STDEV;
	rename CoagulationINROtherRAN INR_Other_LowRange;
	rename HM INR_Other_UpRange;
	rename CoagulationINROtherMED INR_Other_Median;
	rename CoagulationINROtherIQR INR_Other_Q1;
	rename HP INR_Other_Q3;
*		Activated partial thromboplastin time (APTT);
rename CoagulationaPTTICUadmissi APTT_ICU_N;
	rename HR APTT_ICU_Mean;
	rename HS APTT_ICU_STDEV;
	rename HT APTT_ICU_LowRange;
	rename HU APTT_ICU_UpRange;
	rename HV APTT_ICU_Median;
	rename HW APTT_ICU_Q1;
	rename HX APTT_ICU_Q3;
	rename HY APTT_ICU_Unit;
rename CoagulationaPTTNonICUadm APTT_NonICU_N;
	rename IA APTT_NonICU_Mean;
	rename IB APTT_NonICU_STDEV;
	rename IC APTT_NonICU_LowRange;
	rename ID APTT_NonICU_UpRange;
	rename IE APTT_NonICU_Median;
	rename IF APTT_NonICU_Q1;
	rename IG APTT_NonICU_Q3;
	rename IH APTT_NonICU_Unit;
rename CoagulationaPTTHospitalize APTT_Hosp_N;
	rename IJ APTT_Hosp_Mean;
	rename IK APTT_Hosp_STDEV;
	rename IL APTT_Hosp_LowRange;
	rename IM APTT_Hosp_UpRange;
	rename IN APTT_Hosp_Median;
	rename IO APTT_Hosp_Q1;
	rename IP APTT_Hosp_Q3;
	rename IQ APTT_Hosp_Unit;
rename CoagulationaPTTNonhospita APTT_Nonhosp_N;
	rename IS APTT_Nonhosp_Mean;
	rename IT APTT_Nonhosp_STDEV;
	rename IU APTT_Nonhosp_LowRange;
	rename IV APTT_Nonhosp_UpRange;
	rename IW APTT_Nonhosp_Median;
	rename IX APTT_Nonhosp_Q1;
	rename IY APTT_Nonhosp_Q3;
	rename IZ APTT_Nonhosp_Unit;
rename CoagulationaPTTIntubated APTT_Intub_N;
	rename JB APTT_Intub_Mean;
	rename JC APTT_Intub_STDEV;
	rename JD APTT_Intub_LowRange;
	rename JE APTT_Intub_UpRange;
	rename JF APTT_Intub_Median;
	rename JG APTT_Intub_Q1;
	rename JH APTT_Intub_Q3;
	rename JI APTT_Intub_Unit;
rename CoagulationaPTTNonintubat APTT_Nonintub_N;
	rename JK APTT_Nonintub_Mean;
	rename JL APTT_Nonintub_STDEV;
	rename CoagulationaPTTNonintuba APTT_Nonintub_LowRange;
	rename JN APTT_Nonintub_UpRange;
	rename JO APTT_Nonintub_Median;
	rename JP APTT_Nonintub_Q1;
	rename JQ APTT_Nonintub_Q3;
	rename JR APTT_Nonintub_Unit;
rename CoagulationaPTTMortality APTT_Mortality_N;
	rename JT APTT_Mortality_Mean;
	rename JU APTT_Mortality_STDEV;
	rename JV APTT_Mortality_LowRange;
	rename JW APTT_Mortality_UpRange;
	rename JX APTT_Mortality_Median;
	rename JY APTT_Mortality_Q1;
	rename JZ APTT_Mortality_Q3;
	rename KA APTT_Mortality_Unit;
rename CoagulationaPTTSurvived APTT_Survived_N;
	rename KC APTT_Survived_Mean;
	rename KD APTT_Survived_STDEV;
	rename KE APTT_Survived_LowRange;
	rename KF APTT_Survived_UpRange;
	rename KG APTT_Survived_Median;
	rename KH APTT_Survived_Q1;
	rename KI APTT_Survived_Q3;
	rename KJ APTT_Survived_Unit;
rename CoagulationaPTTReportedfor APTT_Other;
	rename CoagulationaPTTOtherNum APTT_Other_N;
	rename CoagulationaPTTOtherMEA APTT_Other_Mean;
	rename CoagulationaPTTOtherSTD APTT_Other_STDEV;
	rename CoagulationaPTTOtherRAN APTT_Other_LowRange;
	rename CoagulationaPTTOtherRANG APTT_Other_UpRange;
	rename CoagulationaPTTOtherMEDI APTT_Other_Median;
	rename CoagulationaPTTOtherIQ APTT_Other_Q1;
	rename CoagulationaPTTOtherIQR APTT_Other_Q3;
	rename CoagulationaPTTOtherUNIT APTT_Other_Unit;
*		Fibrinogen;
rename CoagulationFibrinogenICUa Fibrinogen_ICU_N;
	rename KV Fibrinogen_ICU_Mean;
	rename KW Fibrinogen_ICU_STDEV;
	rename KX Fibrinogen_ICU_LowRange;
	rename KY Fibrinogen_ICU_UpRange;
	rename KZ Fibrinogen_ICU_Median;
	rename LA Fibrinogen_ICU_Q1;
	rename CoagulationFibrinogenICU Fibrinogen_ICU_Q3;
	rename LC Fibrinogen_ICU_Unit;
rename CoagulationFibrinogenNonI Fibrinogen_NonICU_N;
	rename LE Fibrinogen_NonICU_Mean;
	rename LF Fibrinogen_NonICU_STDEV;
	rename LG Fibrinogen_NonICU_LowRange;
	rename LH Fibrinogen_NonICU_UpRange;
	rename LI Fibrinogen_NonICU_Median;
	rename LJ Fibrinogen_NonICU_Q1;
	rename CoagulationFibrinogenNon Fibrinogen_NonICU_Q3;
	rename LL Fibrinogen_NonICU_Unit;
rename CoagulationFibrinogenHospi Fibrinogen_Hosp_N;
	rename LN Fibrinogen_Hosp_Mean;
	rename LO Fibrinogen_Hosp_STDEV;
	rename LP Fibrinogen_Hosp_LowRange;
	rename LQ Fibrinogen_Hosp_UpRange;
	rename LR Fibrinogen_Hosp_Median;
	rename LS Fibrinogen_Hosp_Q1;
	rename LT Fibrinogen_Hosp_Q3;
	rename LU Fibrinogen_Hosp_Unit;
rename CoagulationFibrinogenNonh Fibrinogen_Nonhosp_N;
	rename LW Fibrinogen_Nonhosp_Mean;
	rename LX Fibrinogen_Nonhosp_STDEV;
	rename LY Fibrinogen_Nonhosp_LowRange;
	rename LZ Fibrinogen_Nonhosp_UpRange;
	rename MA Fibrinogen_Nonhosp_Median;
	rename MB Fibrinogen_Nonhosp_Q1;
	rename MC Fibrinogen_Nonhosp_Q3;
	rename MD Fibrinogen_Nonhosp_Unit;
rename CoagulationFibrinogenIntub Fibrinogen_Intub_N;
	rename MF Fibrinogen_Intub_Mean;
	rename MG Fibrinogen_Intub_STDEV;
	rename CoagulationFibrinogenIntu Fibrinogen_Intub_LowRange;
	rename MI Fibrinogen_Intub_UpRange;
	rename MJ Fibrinogen_Intub_Median;
	rename MK Fibrinogen_Intub_Q1;
	rename ML Fibrinogen_Intub_Q3;
	rename MM Fibrinogen_Intub_Unit;
rename CoagulationFibrinogenNoni Fibrinogen_Nonintub_N;
	rename MO Fibrinogen_Nonintub_Mean;
	rename MP Fibrinogen_Nonintub_STDEV;
	rename MQ Fibrinogen_Nonintub_LowRange;
	rename MR Fibrinogen_Nonintub_UpRange;
	rename MS Fibrinogen_Nonintub_Median;
	rename MT Fibrinogen_Nonintub_Q1;
	rename MU Fibrinogen_Nonintub_Q3;
	rename MV Fibrinogen_Nonintub_Unit;
rename CoagulationFibrinogenMorta Fibrinogen_Mortality_N;
	rename MX Fibrinogen_Mortality_Mean;
	rename CoagulationFibrinogenMort Fibrinogen_Mortality_STDEV;
	rename MZ Fibrinogen_Mortality_LowRange;
	rename NA Fibrinogen_Mortality_UpRange;
	rename NB Fibrinogen_Mortality_Median;
	rename NC Fibrinogen_Mortality_Q1;
	rename ND Fibrinogen_Mortality_Q3;
	rename NE Fibrinogen_Mortality_Unit;
rename CoagulationFibrinogenSurvi Fibrinogen_Survived_N;
	rename NG Fibrinogen_Survived_Mean;
	rename NH Fibrinogen_Survived_STDEV;
	rename CoagulationFibrinogenSurv Fibrinogen_Survived_LowRange;
	rename NJ Fibrinogen_Survived_UpRange;
	rename NK Fibrinogen_Survived_Median;
	rename NL Fibrinogen_Survived_Q1;
	rename NM Fibrinogen_Survived_Q3;
	rename NN Fibrinogen_Survived_Unit;
rename CoagulationFibrinogenRepor Fibrinogen_Other;
	rename CoagulationFibrinogenOther Fibrinogen_Other_N;
	rename NQ Fibrinogen_Other_Mean;
	rename CoagulationFibrinogenOthe Fibrinogen_Other_STDEV;
	rename NS Fibrinogen_Other_LowRange;
	rename NT Fibrinogen_Other_UpRange;
	rename NU Fibrinogen_Other_Median;
	rename NV Fibrinogen_Other_Q1;
	rename NW Fibrinogen_Other_Q3;
	rename NX Fibrinogen_Other_Unit;
*		Antithrombin activity (AT);
rename Coagulationantithrombinactiv Antithrombin_ICU_N;
	rename NZ Antithrombin_ICU_Mean;
	rename OA Antithrombin_ICU_STDEV;
	rename OB Antithrombin_ICU_LowRange;
	rename OC Antithrombin_ICU_UpRange;
	rename OD Antithrombin_ICU_Median;
	rename OE Antithrombin_ICU_Q1;
	rename OF Antithrombin_ICU_Q3;
	rename OG Antithrombin_ICU_Unit;
rename OH Antithrombin_NonICU_N;
	rename OI Antithrombin_NonICU_Mean;
	rename OJ Antithrombin_NonICU_STDEV;
	rename OK Antithrombin_NonICU_LowRange;
	rename OL Antithrombin_NonICU_UpRange;
	rename OM Antithrombin_NonICU_Median;
	rename ON Antithrombin_NonICU_Q1;
	rename OO Antithrombin_NonICU_Q3;
	rename OP Antithrombin_NonICU_Unit;
rename OQ Antithrombin_Hosp_N;
	rename OR Antithrombin_Hosp_Mean;
	rename OS Antithrombin_Hosp_STDEV;
	rename OT Antithrombin_Hosp_LowRange;
	rename OU Antithrombin_Hosp_UpRange;
	rename OV Antithrombin_Hosp_Median;
	rename OW Antithrombin_Hosp_Q1;
	rename OX Antithrombin_Hosp_Q3;
	rename OY Antithrombin_Hosp_Unit;
rename OZ Antithrombin_Nonhosp_N;
	rename PA Antithrombin_Nonhosp_Mean;
	rename PB Antithrombin_Nonhosp_STDEV;
	rename PC Antithrombin_Nonhosp_LowRange;
	rename PD Antithrombin_Nonhosp_UpRange;
	rename PE Antithrombin_Nonhosp_Median;
	rename PF Antithrombin_Nonhosp_Q1;
	rename PG Antithrombin_Nonhosp_Q3;
	rename PH Antithrombin_Nonhosp_Unit;
rename PI Antithrombin_Intub_N;
	rename PJ Antithrombin_Intub_Mean;
	rename PK Antithrombin_Intub_STDEV;
	rename Coagulationantithrombinacti Antithrombin_Intub_LowRange;
	rename PM Antithrombin_Intub_UpRange;
	rename PN Antithrombin_Intub_Median;
	rename PO Antithrombin_Intub_Q1;
	rename PP Antithrombin_Intub_Q3;
	rename PQ Antithrombin_Intub_Unit;
rename PR Antithrombin_Nonintub_N;
	rename PS Antithrombin_Nonintub_Mean;
	rename PT Antithrombin_Nonintub_STDEV;
	rename PU Antithrombin_Nonintub_LowRange;
	rename PV Antithrombin_Nonintub_UpRange;
	rename PW Antithrombin_Nonintub_Median;
	rename PX Antithrombin_Nonintub_Q1;
	rename PY Antithrombin_Nonintub_Q3;
	rename PZ Antithrombin_Nonintub_Unit;
rename QA Antithrombin_Mortality_N;
	rename QB Antithrombin_Mortality_Mean;
	rename QC Antithrombin_Mortality_STDEV;
	rename QD Antithrombin_Mortality_LowRange;
	rename QE Antithrombin_Mortality_UpRange;
	rename QF Antithrombin_Mortality_Median;
	rename QG Antithrombin_Mortality_Q1;
	rename QH Antithrombin_Mortality_Q3;
	rename QI Antithrombin_Mortality_Unit;
rename QJ Antithrombin_Survived_N;
	rename QK Antithrombin_Survived_Mean;
	rename QL Antithrombin_Survived_STDEV;
	rename QM Antithrombin_Survived_LowRange;
	rename QN Antithrombin_Survived_UpRange;
	rename QO Antithrombin_Survived_Median;
	rename QP Antithrombin_Survived_Q1;
	rename QQ Antithrombin_Survived_Q3;
	rename QR Antithrombin_Survived_Unit;
rename QS Antithrombin_Other;
	rename QT Antithrombin_Other_N;
	rename QU Antithrombin_Other_Mean;
	rename QV Antithrombin_Other_STDEV;
	rename QW Antithrombin_Other_LowRange;
	rename QX Antithrombin_Other_UpRange;
	rename QY Antithrombin_Other_Median;
	rename QZ Antithrombin_Other_Q1;
	rename RA Antithrombin_Other_Q3;
	rename RB Antithrombin_Other_Unit;
	
	
*	Data edits;
replace INR_Mortality_LowRange="0.8" if INR_Mortality_LowRange=="0,8" | INR_Mortality_LowRange=="0,8,";
replace Fibrinogen_Mortality_Mean="6.321" if Fibrinogen_Mortality_Mean=="6321";
replace Fibrinogen_Mortality_STDEV="18.349" if Fibrinogen_Mortality_STDEV=="18349";
replace Fibrinogen_NonICU_Q3="4.955" if Fibrinogen_NonICU_Q3=="4955";
	
	

	
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
	replace `v' = "seconds" if `v'=="s" | `v'=="sec";
	replace `v' = "g/L" if `v' == "g/l";
	replace `v' = "." if `v'=="#" | `v' =="##";
};
	



*	Drop categories with no data;
dropmiss CoagulationQuickinICUa-EU, force;



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Antithrombin_Survived_Unit;
duplicates drop Zoterokey-Antithrombin_Survived_Unit, force;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Prothrombin_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Prothrombin_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Prothrombin_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Prothrombin_Mortality_N==14;
*	Validation study;
replace Zotero="VN52PHAB-VAL" if Zotero=="VN52PHAB" & INR_Survived_Median==.; //validation cohort had no data



*	Unit conversion;
codebook *_Unit;





*******************************************************************************;

save "06 Coagulation/COVIDSR_Coagulation_CLEAN_20200922 - data", replace;

export delimited using "06 Coagulation\COVIDSR_Coagulation_CSV.csv", replace;

capture log close;













