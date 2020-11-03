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

Blood - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Blood_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Blood") firstrow;



*	Drop unnecessary variables;
drop Timestamp FormResponseEditURL Nameofpersonextractingdata ;



*	Drop second time point entry;
drop if Report=="Clinical Features and Short-term Outcomes of 102 Patients with Corona Virus Disease 2019 in Wuhan, China. MULTIPLE ENTRY (data was collected at two points in time)";




*	Rename variables;
*		Blood platelets;
rename BloodPlateletsICUadmissio Platelets_ICU_N;
	rename G Platelets_ICU_Mean;
	rename H Platelets_ICU_STDEV;
	rename I Platelets_ICU_LowRange;
	rename J Platelets_ICU_UpRange;
	rename K Platelets_ICU_Median;
	rename L Platelets_ICU_Q1;
	rename M Platelets_ICU_Q3;
	rename N Platelets_ICU_Unit;
rename BloodPlateletsNonICUadmi Platelets_NonICU_N;
	rename P Platelets_NonICU_Mean;
	rename Q Platelets_NonICU_STDEV;
	rename R Platelets_NonICU_LowRange;
	rename S Platelets_NonICU_UpRange;
	rename T Platelets_NonICU_Median;
	rename U Platelets_NonICU_Q1;
	rename V Platelets_NonICU_Q3;
	rename W Platelets_NonICU_Unit;
rename BloodPlateletsHospitalized Platelets_Hosp_N;
	rename Y Platelets_Hosp_Mean;
	rename Z Platelets_Hosp_STDEV;
	rename AA Platelets_Hosp_LowRange;
	rename AB Platelets_Hosp_UpRange;
	rename AC Platelets_Hosp_Median;
	rename AD Platelets_Hosp_Q1;
	rename AE Platelets_Hosp_Q3;
	rename AF Platelets_Hosp_Unit;
rename BloodPlateletsNonhospital Platelets_Nonhosp_N;
	rename AH Platelets_Nonhosp_Mean;
	rename AI Platelets_Nonhosp_STDEV;
	rename AJ Platelets_Nonhosp_LowRange;
	rename AK Platelets_Nonhosp_UpRange;
	rename AL Platelets_Nonhosp_Median;
	rename AM Platelets_Nonhosp_Q1;
	rename AN Platelets_Nonhosp_Q3;
	rename AO Platelets_Nonhosp_Unit;
rename BloodPlateletsIntubated Platelets_Intub_N;
	rename AQ Platelets_Intub_Mean;
	rename AR Platelets_Intub_STDEV;
	rename AS Platelets_Intub_LowRange;
	rename AT Platelets_Intub_UpRange;
	rename AU Platelets_Intub_Median;
	rename AV Platelets_Intub_Q1;
	rename AW Platelets_Intub_Q3;
	rename AX Platelets_Intub_Unit;
rename BloodPlateletsNonintubate Platelets_Nonintub_N;
	rename AZ Platelets_Nonintub_Mean;
	rename BA Platelets_Nonintub_STDEV;
	rename BB Platelets_Nonintub_LowRange;
	rename BC Platelets_Nonintub_UpRange;
	rename BD Platelets_Nonintub_Median;
	rename BE Platelets_Nonintub_Q1;
	rename BF Platelets_Nonintub_Q3;
	rename BG Platelets_Nonintub_Unit;
rename BloodPlateletsMortality Platelets_Mortality_N;
	rename BI Platelets_Mortality_Mean;
	rename BJ Platelets_Mortality_STDEV;
	rename BK Platelets_Mortality_LowRange;
	rename BL Platelets_Mortality_UpRange;
	rename BM Platelets_Mortality_Median;
	rename BN Platelets_Mortality_Q1;
	rename BO Platelets_Mortality_Q3;
	rename BP Platelets_Mortality_Unit;
rename BloodPlateletsSurvivedN Platelets_Survived_N;
	rename BloodPlateletsSurvivedM Platelets_Survived_Mean;
	rename BloodPlateletsSurvivedS Platelets_Survived_STDEV;
	rename BloodPlateletsSurvivedR Platelets_Survived_LowRange;
	rename BU Platelets_Survived_UpRange;
	rename BV Platelets_Survived_Median;
	rename BloodPlateletsSurvivedI Platelets_Survived_Q1;
	rename BX Platelets_Survived_Q3;
	rename BloodPlateletsSurvivedU Platelets_Survived_Unit;
rename BloodPlateletsReportedfor Platelets_Other;
	rename BloodPlateletsOtherNumb Platelets_Other_N;
	rename BloodPlateletsOtherMEAN Platelets_Other_Mean;
	rename BloodPlateletsOtherSTDE Platelets_Other_STDEV;
	rename BloodPlateletsOtherRANG Platelets_Other_LowRange;
	rename CE Platelets_Other_UpRange;
	rename BloodPlateletsOtherMEDI Platelets_Other_Median;
	rename BloodPlateletsOtherIQR Platelets_Other_Q1;
	rename CH Platelets_Other_Q3;
	rename BloodPlateletsOtherUNIT Platelets_Other_Unit;
*		Leukocyte;
rename BloodLymphocytesICUadmiss Lymphocyte_ICU_N;
	rename CK Lymphocyte_ICU_Mean;
	rename CL Lymphocyte_ICU_STDEV;
	rename CM Lymphocyte_ICU_LowRange;
	rename CN Lymphocyte_ICU_UpRange;
	rename CO Lymphocyte_ICU_Median;
	rename CP Lymphocyte_ICU_Q1;
	rename CQ Lymphocyte_ICU_Q3;
	rename CR Lymphocyte_ICU_Unit;
rename BloodLymphocytesNonICUad Lymphocyte_NonICU_N;
	rename CT Lymphocyte_NonICU_Mean;
	rename CU Lymphocyte_NonICU_STDEV;
	rename CV Lymphocyte_NonICU_LowRange;
	rename CW Lymphocyte_NonICU_UpRange;
	rename CX Lymphocyte_NonICU_Median;
	rename CY Lymphocyte_NonICU_Q1;
	rename CZ Lymphocyte_NonICU_Q3;
	rename DA Lymphocyte_NonICU_Unit;
rename BloodLymphocytesHospitaliz Lymphocyte_Hosp_N;
	rename DC Lymphocyte_Hosp_Mean;
	rename DD Lymphocyte_Hosp_STDEV;
	rename BloodLymphocytesHospitali Lymphocyte_Hosp_LowRange;
	rename DF Lymphocyte_Hosp_UpRange;
	rename DG Lymphocyte_Hosp_Median;
	rename DH Lymphocyte_Hosp_Q1;
	rename DI Lymphocyte_Hosp_Q3;
	rename DJ Lymphocyte_Hosp_Unit;
rename BloodLymphocytesNonhospit Lymphocyte_Nonhosp_N;
	rename DL Lymphocyte_Nonhosp_Mean;
	rename DM Lymphocyte_Nonhosp_STDEV;
	rename BloodLymphocytesNonhospi Lymphocyte_Nonhosp_LowRange;
	rename DO Lymphocyte_Nonhosp_UpRange;
	rename DP Lymphocyte_Nonhosp_Median;
	rename DQ Lymphocyte_Nonhosp_Q1;
	rename DR Lymphocyte_Nonhosp_Q3;
	rename DS Lymphocyte_Nonhosp_Unit;
rename BloodLymphocytesIntubated Lymphocyte_Intub_N;
	rename DU Lymphocyte_Intub_Mean;
	rename DV Lymphocyte_Intub_STDEV;
	rename DW Lymphocyte_Intub_LowRange;
	rename DX Lymphocyte_Intub_UpRange;
	rename DY Lymphocyte_Intub_Median;
	rename DZ Lymphocyte_Intub_Q1;
	rename EA Lymphocyte_Intub_Q3;
	rename EB Lymphocyte_Intub_Unit;
rename BloodLymphocytesNonintuba Lymphocyte_Nonintub_N;
	rename ED Lymphocyte_Nonintub_Mean;
	rename EE Lymphocyte_Nonintub_STDEV;
	rename EF Lymphocyte_Nonintub_LowRange;
	rename EG Lymphocyte_Nonintub_UpRange;
	rename EH Lymphocyte_Nonintub_Median;
	rename EI Lymphocyte_Nonintub_Q1;
	rename EJ Lymphocyte_Nonintub_Q3;
	rename EK Lymphocyte_Nonintub_Unit;
rename BloodLymphocytesMortality Lymphocyte_Mortality_N;
	rename EM Lymphocyte_Mortality_Mean;
	rename EN Lymphocyte_Mortality_STDEV;
	rename EO Lymphocyte_Mortality_LowRange;
	rename EP Lymphocyte_Mortality_UpRange;
	rename EQ Lymphocyte_Mortality_Median;
	rename ER Lymphocyte_Mortality_Q1;
	rename ES Lymphocyte_Mortality_Q3;
	rename ET Lymphocyte_Mortality_Unit;
rename BloodLymphocytesSurvived Lymphocyte_Survived_N;
	rename EV Lymphocyte_Survived_Mean;
	rename EW Lymphocyte_Survived_STDEV;
	rename EX Lymphocyte_Survived_LowRange;
	rename EY Lymphocyte_Survived_UpRange;
	rename EZ Lymphocyte_Survived_Median;
	rename FA Lymphocyte_Survived_Q1;
	rename FB Lymphocyte_Survived_Q3;
	rename FC Lymphocyte_Survived_Unit;
rename BloodLymphocytesReportedf Lymphocyte_Other;
	rename BloodLymphocytesOtherNu Lymphocyte_Other_N;
	rename BloodLymphocytesOtherME Lymphocyte_Other_Mean;
	rename BloodLymphocytesOtherST Lymphocyte_Other_STDEV;
	rename BloodLymphocytesOtherRA Lymphocyte_Other_LowRange;
	rename FI Lymphocyte_Other_UpRange;
	rename FJ Lymphocyte_Other_Median;
	rename BloodLymphocytesOtherIQ Lymphocyte_Other_Q1;
	rename FL Lymphocyte_Other_Q3;
	rename BloodLymphocytesOtherUN Lymphocyte_Other_Unit;
*		Neutrophils;
rename BloodNeutrophilsICUadmiss Neutrophil_ICU_N;
	rename FO Neutrophil_ICU_Mean;
	rename FP Neutrophil_ICU_STDEV;
	rename FQ Neutrophil_ICU_LowRange;
	rename FR Neutrophil_ICU_UpRange;
	rename FS Neutrophil_ICU_Median;
	rename FT Neutrophil_ICU_Q1;
	rename FU Neutrophil_ICU_Q3;
	rename FV Neutrophil_ICU_Unit;
rename BloodNeutrophilsNonICUad Neutrophil_NonICU_N;
	rename FX Neutrophil_NonICU_Mean;
	rename FY Neutrophil_NonICU_STDEV;
	rename FZ Neutrophil_NonICU_LowRange;
	rename GA Neutrophil_NonICU_UpRange;
	rename GB Neutrophil_NonICU_Median;
	rename GC Neutrophil_NonICU_Q1;
	rename GD Neutrophil_NonICU_Q3;
	rename GE Neutrophil_NonICU_Unit;
rename BloodNeutrophilsHospitaliz Neutrophil_Hosp_N;
	rename GG Neutrophil_Hosp_Mean;
	rename GH Neutrophil_Hosp_STDEV;
	rename GI Neutrophil_Hosp_LowRange;
	rename GJ Neutrophil_Hosp_UpRange;
	rename GK Neutrophil_Hosp_Median;
	rename GL Neutrophil_Hosp_Q1;
	rename GM Neutrophil_Hosp_Q3;
	rename GN Neutrophil_Hosp_Unit;
rename BloodNeutrophilsNonhospit Neutrophil_Nonhosp_N;
	rename GP Neutrophil_Nonhosp_Mean;
	rename GQ Neutrophil_Nonhosp_STDEV;
	rename GR Neutrophil_Nonhosp_LowRange;
	rename GS Neutrophil_Nonhosp_UpRange;
	rename GT Neutrophil_Nonhosp_Median;
	rename GU Neutrophil_Nonhosp_Q1;
	rename GV Neutrophil_Nonhosp_Q3;
	rename GW Neutrophil_Nonhosp_Unit;
rename BloodNeutrophilsIntubated Neutrophil_Intub_N;
	rename GY Neutrophil_Intub_Mean;
	rename GZ Neutrophil_Intub_STDEV;
	rename HA Neutrophil_Intub_LowRange;
	rename HB Neutrophil_Intub_UpRange;
	rename HC Neutrophil_Intub_Median;
	rename HD Neutrophil_Intub_Q1;
	rename HE Neutrophil_Intub_Q3;
	rename HF Neutrophil_Intub_Unit;
rename BloodNeutrophilsNonintuba Neutrophil_Nonintub_N;
	rename HH Neutrophil_Nonintub_Mean;
	rename HI Neutrophil_Nonintub_STDEV;
	rename HJ Neutrophil_Nonintub_LowRange;
	rename HK Neutrophil_Nonintub_UpRange;
	rename HL Neutrophil_Nonintub_Median;
	rename HM Neutrophil_Nonintub_Q1;
	rename HN Neutrophil_Nonintub_Q3;
	rename HO Neutrophil_Nonintub_Unit;
rename BloodNeutrophilsMortality Neutrophil_Mortality_N;
	rename HQ Neutrophil_Mortality_Mean;
	rename HR Neutrophil_Mortality_STDEV;
	rename HS Neutrophil_Mortality_LowRange;
	rename HT Neutrophil_Mortality_UpRange;
	rename HU Neutrophil_Mortality_Median;
	rename HV Neutrophil_Mortality_Q1;
	rename HW Neutrophil_Mortality_Q3;
	rename HX Neutrophil_Mortality_Unit;
rename BloodNeutrophilsSurvived Neutrophil_Survived_N;
	rename HZ Neutrophil_Survived_Mean;
	rename IA Neutrophil_Survived_STDEV;
	rename IB Neutrophil_Survived_LowRange;
	rename IC Neutrophil_Survived_UpRange;
	rename ID Neutrophil_Survived_Median;
	rename IE Neutrophil_Survived_Q1;
	rename IF Neutrophil_Survived_Q3;
	rename IG Neutrophil_Survived_Unit;
rename BloodNeutrophilsReportedf Neutrophil_Other;
	rename BloodNeutrophilsOtherNu Neutrophil_Other_N;
	rename BloodNeutrophilsOtherME Neutrophil_Other_Mean;
	rename BloodNeutrophilsOtherST Neutrophil_Other_STDEV;
	rename BloodNeutrophilsOtherRA Neutrophil_Other_LowRange;
	rename IM Neutrophil_Other_UpRange;
	rename IN Neutrophil_Other_Median;
	rename BloodNeutrophilsOtherIQ Neutrophil_Other_Q1;
	rename IP Neutrophil_Other_Q3;
	rename BloodNeutrophilsOtherUN Neutrophil_Other_Unit;
*		Hemoglobin (Hgb);
rename BloodHemoglobinAnemiaasde Hgb_ICU_N;
	rename IS Hgb_ICU_Mean;
	rename IT Hgb_ICU_STDEV;
	rename IU Hgb_ICU_LowRange;
	rename IV Hgb_ICU_UpRange;
	rename IW Hgb_ICU_Median;
	rename IX Hgb_ICU_Q1;
	rename IY Hgb_ICU_Q3;
	rename IZ Hgb_ICU_Unit;
rename JA Hgb_NonICU_N;
	rename JB Hgb_NonICU_Mean;
	rename JC Hgb_NonICU_STDEV;
	rename JD Hgb_NonICU_LowRange;
	rename JE Hgb_NonICU_UpRange;
	rename JF Hgb_NonICU_Median;
	rename JG Hgb_NonICU_Q1;
	rename JH Hgb_NonICU_Q3;
	rename JI Hgb_NonICU_Unit;
rename JJ Hgb_Hosp_N;
	rename JK Hgb_Hosp_Mean;
	rename JL Hgb_Hosp_STDEV;
	rename JM Hgb_Hosp_LowRange;
	rename JN Hgb_Hosp_UpRange;
	rename JO Hgb_Hosp_Median;
	rename JP Hgb_Hosp_Q1;
	rename JQ Hgb_Hosp_Q3;
	rename JR Hgb_Hosp_Unit;
rename JS Hgb_Nonhosp_N;
	rename JT Hgb_Nonhosp_Mean;
	rename JU Hgb_Nonhosp_STDEV;
	rename JV Hgb_Nonhosp_LowRange;
	rename JW Hgb_Nonhosp_UpRange;
	rename JX Hgb_Nonhosp_Median;
	rename JY Hgb_Nonhosp_Q1;
	rename JZ Hgb_Nonhosp_Q3;
	rename KA Hgb_Nonhosp_Unit;
rename KB Hgb_Intub_N;
	rename KC Hgb_Intub_Mean;
	rename KD Hgb_Intub_STDEV;
	rename KE Hgb_Intub_LowRange;
	rename KF Hgb_Intub_UpRange;
	rename KG Hgb_Intub_Median;
	rename KH Hgb_Intub_Q1;
	rename KI Hgb_Intub_Q3;
	rename KJ Hgb_Intub_Unit;
rename KK Hgb_Nonintub_N;
	rename KL Hgb_Nonintub_Mean;
	rename KM Hgb_Nonintub_STDEV;
	rename KN Hgb_Nonintub_LowRange;
	rename KO Hgb_Nonintub_UpRange;
	rename KP Hgb_Nonintub_Median;
	rename KQ Hgb_Nonintub_Q1;
	rename KR Hgb_Nonintub_Q3;
	rename KS Hgb_Nonintub_Unit;
rename KT Hgb_Mortality_N;
	rename KU Hgb_Mortality_Mean;
	rename KV Hgb_Mortality_STDEV;
	rename KW Hgb_Mortality_LowRange;
	rename KX Hgb_Mortality_UpRange;
	rename KY Hgb_Mortality_Median;
	rename KZ Hgb_Mortality_Q1;
	rename LA Hgb_Mortality_Q3;
	rename LB Hgb_Mortality_Unit;
rename LC Hgb_Survived_N;
	rename LD Hgb_Survived_Mean;
	rename LE Hgb_Survived_STDEV;
	rename LF Hgb_Survived_LowRange;
	rename LG Hgb_Survived_UpRange;
	rename LH Hgb_Survived_Median;
	rename LI Hgb_Survived_Q1;
	rename LJ Hgb_Survived_Q3;
	rename LK Hgb_Survived_Unit;
rename LL Hgb_Other;
	rename LM Hgb_Other_N;
	rename LN Hgb_Other_Mean;
	rename LO Hgb_Other_STDEV;
	rename LP Hgb_Other_LowRange;
	rename LQ Hgb_Other_UpRange;
	rename LR Hgb_Other_Median;
	rename LS Hgb_Other_Q1;
	rename LT Hgb_Other_Q3;
	rename LU Hgb_Other_Unit;
*		Hematocrit;
rename BloodHematocritICUadmissi Hematocrit_ICU_N;
	rename LW Hematocrit_ICU_Mean;
	rename LX Hematocrit_ICU_STDEV;
	rename LY Hematocrit_ICU_LowRange;
	rename LZ Hematocrit_ICU_UpRange;
	rename MA Hematocrit_ICU_Median;
	rename MB Hematocrit_ICU_Q1;
	rename MC Hematocrit_ICU_Q3;
	rename MD Hematocrit_ICU_Unit;
rename BloodHematocritNonICUadm Hematocrit_NonICU_N;
	rename MF Hematocrit_NonICU_Mean;
	rename MG Hematocrit_NonICU_STDEV;
	rename MH Hematocrit_NonICU_LowRange;
	rename MI Hematocrit_NonICU_UpRange;
	rename MJ Hematocrit_NonICU_Median;
	rename MK Hematocrit_NonICU_Q1;
	rename ML Hematocrit_NonICU_Q3;
	rename MM Hematocrit_NonICU_Unit;
rename BloodHematocritHospitalize Hematocrit_Hosp_N;
	rename MO Hematocrit_Hosp_Mean;
	rename MP Hematocrit_Hosp_STDEV;
	rename MQ Hematocrit_Hosp_LowRange;
	rename MR Hematocrit_Hosp_UpRange;
	rename MS Hematocrit_Hosp_Median;
	rename MT Hematocrit_Hosp_Q1;
	rename MU Hematocrit_Hosp_Q3;
	rename MV Hematocrit_Hosp_Unit;
rename BloodHematocritNonhospita Hematocrit_Nonhosp_N;
	rename MX Hematocrit_Nonhosp_Mean;
	rename MY Hematocrit_Nonhosp_STDEV;
	rename MZ Hematocrit_Nonhosp_LowRange;
	rename NA Hematocrit_Nonhosp_UpRange;
	rename NB Hematocrit_Nonhosp_Median;
	rename NC Hematocrit_Nonhosp_Q1;
	rename ND Hematocrit_Nonhosp_Q3;
	rename NE Hematocrit_Nonhosp_Unit;
rename BloodHematocritIntubated Hematocrit_Intub_N;
	rename NG Hematocrit_Intub_Mean;
	rename NH Hematocrit_Intub_STDEV;
	rename NI Hematocrit_Intub_LowRange;
	rename NJ Hematocrit_Intub_UpRange;
	rename NK Hematocrit_Intub_Median;
	rename NL Hematocrit_Intub_Q1;
	rename NM Hematocrit_Intub_Q3;
	rename NN Hematocrit_Intub_Unit;
rename BloodHematocritNonintubat Hematocrit_Nonintub_N;
	rename NP Hematocrit_Nonintub_Mean;
	rename NQ Hematocrit_Nonintub_STDEV;
	rename NR Hematocrit_Nonintub_LowRange;
	rename NS Hematocrit_Nonintub_UpRange;
	rename NT Hematocrit_Nonintub_Median;
	rename NU Hematocrit_Nonintub_Q1;
	rename NV Hematocrit_Nonintub_Q3;
	rename NW Hematocrit_Nonintub_Unit;
rename BloodHematocritMortality Hematocrit_Mortality_N;
	rename NY Hematocrit_Mortality_Mean;
	rename NZ Hematocrit_Mortality_STDEV;
	rename OA Hematocrit_Mortality_LowRange;
	rename OB Hematocrit_Mortality_UpRange;
	rename OC Hematocrit_Mortality_Median;
	rename OD Hematocrit_Mortality_Q1;
	rename OE Hematocrit_Mortality_Q3;
	rename OF Hematocrit_Mortality_Unit;
rename BloodHematocritSurvived Hematocrit_Survived_N;
	rename OH Hematocrit_Survived_Mean;
	rename OI Hematocrit_Survived_STDEV;
	rename OJ Hematocrit_Survived_LowRange;
	rename OK Hematocrit_Survived_UpRange;
	rename OL Hematocrit_Survived_Median;
	rename OM Hematocrit_Survived_Q1;
	rename ON Hematocrit_Survived_Q3;
	rename OO Hematocrit_Survived_Unit;
rename BloodHematocritReportedfo Hematocrit_Other;
	rename BloodHematocritOtherNum Hematocrit_Other_N;
	rename BloodHematocritOtherMEA Hematocrit_Other_Mean;
	rename BloodHematocritOtherSTD Hematocrit_Other_STDEV;
	rename BloodHematocritOtherRAN Hematocrit_Other_LowRange;
	rename OU Hematocrit_Other_UpRange;
	rename BloodHematocritOtherMED Hematocrit_Other_Median;
	rename BloodHematocritOtherIQR Hematocrit_Other_Q1;
	rename OX Hematocrit_Other_Q3;
	rename BloodHematocritOtherUNI Hematocrit_Other_Unit;
*		Leukocyte;
rename BloodLeukocytesICUadmissi Leukocyte_ICU_N;
	rename PA Leukocyte_ICU_Mean;
	rename PB Leukocyte_ICU_STDEV;
	rename PC Leukocyte_ICU_LowRange;
	rename PD Leukocyte_ICU_UpRange;
	rename PE Leukocyte_ICU_Median;
	rename PF Leukocyte_ICU_Q1;
	rename PG Leukocyte_ICU_Q3;
	rename PH Leukocyte_ICU_Unit;
rename BloodLeukocytesNonICUadm Leukocyte_NonICU_N;
	rename PJ Leukocyte_NonICU_Mean;
	rename PK Leukocyte_NonICU_STDEV;
	rename PL Leukocyte_NonICU_LowRange;
	rename PM Leukocyte_NonICU_UpRange;
	rename PN Leukocyte_NonICU_Median;
	rename PO Leukocyte_NonICU_Q1;
	rename PP Leukocyte_NonICU_Q3;
	rename PQ Leukocyte_NonICU_Unit;
rename BloodLeukocytesHospitalize Leukocyte_Hosp_N;
	rename PS Leukocyte_Hosp_Mean;
	rename PT Leukocyte_Hosp_STDEV;
	rename PU Leukocyte_Hosp_LowRange;
	rename PV Leukocyte_Hosp_UpRange;
	rename PW Leukocyte_Hosp_Median;
	rename PX Leukocyte_Hosp_Q1;
	rename PY Leukocyte_Hosp_Q3;
	rename PZ Leukocyte_Hosp_Unit;
rename BloodLeukocytesNonhospita Leukocyte_Nonhosp_N;
	rename QB Leukocyte_Nonhosp_Mean;
	rename QC Leukocyte_Nonhosp_STDEV;
	rename QD Leukocyte_Nonhosp_LowRange;
	rename QE Leukocyte_Nonhosp_UpRange;
	rename QF Leukocyte_Nonhosp_Median;
	rename QG Leukocyte_Nonhosp_Q1;
	rename QH Leukocyte_Nonhosp_Q3;
	rename QI Leukocyte_Nonhosp_Unit;
rename BloodLeukocytesIntubated Leukocyte_Intub_N;
	rename QK Leukocyte_Intub_Mean;
	rename QL Leukocyte_Intub_STDEV;
	rename QM Leukocyte_Intub_LowRange;
	rename QN Leukocyte_Intub_UpRange;
	rename QO Leukocyte_Intub_Median;
	rename QP Leukocyte_Intub_Q1;
	rename QQ Leukocyte_Intub_Q3;
	rename QR Leukocyte_Intub_Unit;
rename BloodLeukocytesNonintubat Leukocyte_Nonintub_N;
	rename QT Leukocyte_Nonintub_Mean;
	rename QU Leukocyte_Nonintub_STDEV;
	rename QV Leukocyte_Nonintub_LowRange;
	rename QW Leukocyte_Nonintub_UpRange;
	rename QX Leukocyte_Nonintub_Median;
	rename QY Leukocyte_Nonintub_Q1;
	rename QZ Leukocyte_Nonintub_Q3;
	rename RA Leukocyte_Nonintub_Unit;
rename BloodLeukocytesMortality Leukocyte_Mortality_N;
	rename RC Leukocyte_Mortality_Mean;
	rename RD Leukocyte_Mortality_STDEV;
	rename RE Leukocyte_Mortality_LowRange;
	rename RF Leukocyte_Mortality_UpRange;
	rename RG Leukocyte_Mortality_Median;
	rename RH Leukocyte_Mortality_Q1;
	rename RI Leukocyte_Mortality_Q3;
	rename RJ Leukocyte_Mortality_Unit;
rename BloodLeukocytesSurvived Leukocyte_Survived_N;
	rename RL Leukocyte_Survived_Mean;
	rename RM Leukocyte_Survived_STDEV;
	rename RN Leukocyte_Survived_LowRange;
	rename RO Leukocyte_Survived_UpRange;
	rename RP Leukocyte_Survived_Median;
	rename RQ Leukocyte_Survived_Q1;
	rename RR Leukocyte_Survived_Q3;
	rename RS Leukocyte_Survived_Unit;
rename BloodLeukocytesReportedfo Leukocyte_Other;
	rename BloodLeukocytesOtherNum Leukocyte_Other_N;
	rename BloodLeukocytesOtherMEA Leukocyte_Other_Mean;
	rename BloodLeukocytesOtherSTD Leukocyte_Other_STDEV;
	rename BloodLeukocytesOtherRAN Leukocyte_Other_LowRange;
	rename RY Leukocyte_Other_UpRange;
	rename BloodLeukocytesOtherMED Leukocyte_Other_Median;
	rename BloodLeukocytesOtherIQR Leukocyte_Other_Q1;
	rename SB Leukocyte_Other_Q3;
	rename BloodLeukocytesOtherUNI Leukocyte_Unit;


	
*	Edit data;
replace Leukocyte_Mortality_Median="8.3" if Leukocyte_Mortality_Median=="8..3";
replace Leukocyte_Mortality_Mean="10.121" if Leukocyte_Mortality_Mean=="10121";
replace Leukocyte_Mortality_STDEV="6.266" if Leukocyte_Mortality_STDEV=="6266";
replace Leukocyte_NonICU_Q1="37.975" if Leukocyte_NonICU_Q1=="37975";
replace Leukocyte_NonICU_Q3="58.275" if Leukocyte_NonICU_Q3=="58275";
replace Neutrophil_Mortality_Mean="8.765" if Neutrophil_Mortality_Mean=="8765";
replace Neutrophil_Mortality_STDEV="6.181" if Neutrophil_Mortality_STDEV=="6181";
replace Lymphocyte_NonICU_Q3="1.565" if Lymphocyte_NonICU_Q3=="1565";
replace Hgb_Mortality_Unit="g/L" if Hgb_Mortality_Mean=="111,35"; //no units were entered, making assumption based on values & bc survived group is in g/L

	
	

*	Destring data ;
quietly ds Zotero Reporttitle *Unit, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="" | 
		`v'=="unclear - data missing" | `v'=="$" | `v'=="# ";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Standardize units;
foreach v of varlist *Unit {;
replace `v'="10^9/L" if `v'=="10^3/µL" | `v'=="x 10^9/l" | 
		`v'=="x 10^9 /l" | `v'=="10^9/l" | `v'=="x 10e9/L" |
		`v'=="x10^9 /L" | `v'=="x10^9/L" | `v'=="x10e9/L" |
		`v'=="×10^9/L" | `v'=="x10^9/l" | `v'=="x10^3/μL" |
		`v'=="*10^9/L" | `v'=="x 10^9 / L" | `v'=="10^9 /L" |
		`v'=="x 10^9 /L" | `v'=="x10e9 / L" | `v'=="10^9 /L" |
		`v'=="count, ×10^9 /L" | `v'=="×10^9 /L" | `v'=="10^9 /L" |
		`v'=="x10^9/ L" | `v'=="x 10e9 /L" | `v'=="x1000/μl" | 
		`v'=="10x9/L" | `v'=="10^3/uL" | `v'=="10^9 / L" | 
		`v'=="x 103/μL" | `v'=="10^9/ L" | `v'=="10^9 /L" |
		`v'=="10^9/ L" | `v'=="x10e9 /L" | `v'=="10^9 /L";
	replace `v'="g/L" if `v'=="g/l" | `v'=="G/L" | `v'=="g/ L";
	replace `v'="g/dL" if `v'=="g/dl";
	replace `v'="K/µL" if `v'=="K/uL" | `v'=="k/uL";
	replace `v'="/µL" if `v'=="1/µL" | `v'=="per  μL" | `v'=="per μL";
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="" ;
};



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-Leukocyte_Survived_Unit;
duplicates drop Zoterokey-Leukocyte_Survived_Unit, force;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Platelets_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Platelets_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Lymphocyte_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Lymphocyte_Mortality_N==14;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Reporttitle=="Development and external validation of a prognostic multivariable model on admission for hospitalized patients with COVID-19; VALIDATION COHORT";




*	Unit conversion;
codebook *_Unit;


***************
***Platelets***
***************;

*		Platelets - Survived;
replace Platelets_Survived_Unit="10^9/L" if Platelets_Survived_Unit=="g/L";
replace Platelets_Survived_Unit="10^9/L" if Platelets_Survived_Unit=="K/µL";



*		Platelets - Mortality;
replace Platelets_Mortality_Unit="10^9/L" if Platelets_Mortality_Unit=="g/L";
replace Platelets_Mortality_Unit="10^9/L" if Platelets_Mortality_Unit=="K/µL"; 



*		Platelets - Non Intubation;
replace Platelets_Nonintub_Unit="10^9/L" if Platelets_Nonintub_Unit=="g/L";
replace Platelets_Nonintub_Unit="10^9/L" if Platelets_Nonintub_Unit=="K/µL";


*		Platelets - Intubation;
replace Platelets_Intub_Unit="10^9/L" if Platelets_Intub_Unit=="g/L";
replace Platelets_Intub_Unit="10^9/L" if Platelets_Intub_Unit=="K/µL"; 



*		Platelets - Non hospitalized;
replace Platelets_Nonhosp_Unit="10^9/L" if Platelets_Nonhosp_Unit=="g/L"; 
replace Platelets_Nonhosp_Unit="10^9/L" if Platelets_Nonhosp_Unit=="K/µL"; 



*		Platelets - Hospitalized;
replace Platelets_Hosp_Unit="10^9/L" if Platelets_Hosp_Unit=="g/L"; 
replace Platelets_Hosp_Unit="10^9/L" if Platelets_Hosp_Unit=="K/µL"; 



*		Platelets - Non ICU;
replace Platelets_NonICU_Unit="10^9/L" if Platelets_NonICU_Unit=="g/L"; 
replace Platelets_NonICU_Unit="10^9/L" if Platelets_NonICU_Unit=="K/μL"; 
replace Platelets_NonICU_Unit="10^9/L" if Platelets_NonICU_Unit=="K/µL";
replace Platelets_NonICU_Unit="10^9/L" if Platelets_NonICU_Unit=="K/µL";




*		Platelets - ICU;
replace Platelets_ICU_Unit="10^9/L" if Platelets_ICU_Unit=="g/L"; 
replace Platelets_ICU_Unit="10^9/L" if Platelets_ICU_Unit=="K/µL"; 
replace Platelets_ICU_Unit="10^9/L" if Platelets_ICU_Unit=="K/μL"; 




****************
***Lymphocyte***
****************;

*		Lymphocyte - ICU;
foreach v of varlist Lymphocyte_ICU_Mean-Lymphocyte_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_ICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Lymphocyte_ICU_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="mm^3";
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="K/μL";
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="/mm^3";
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="10^9 /L";
		replace `v'="10^9/L" if Lymphocyte_ICU_Unit=="10^9 /L";
	};
};
replace Lymphocyte_ICU_Unit="10^9/L" if Z=="3B6JV5B8";




*		Lymphocyte - Non ICU;
foreach v of varlist Lymphocyte_NonICU_Mean-Lymphocyte_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_NonICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Lymphocyte_NonICU_Unit == "/µL";

	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="mm^3";
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="K/μL";
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_NonICU_Unit=="10^9 /L";
	};
};
replace Lymphocyte_NonICU_Unit="10^9/L" if Z=="3B6JV5B8";




*		Lymphocyte - Hospitalized;
foreach v of varlist Lymphocyte_Hosp_Mean-Lymphocyte_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Hosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Hosp_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Hosp_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Hosp_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
	};
};



*		Lymphocyte - Non hospitalized;
foreach v of varlist Lymphocyte_Nonhosp_Mean-Lymphocyte_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Nonhosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Nonhosp_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Nonhosp_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Nonhosp_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
	};
};



*		Lymphocyte - Intubated;
foreach v of varlist Lymphocyte_Intub_Mean-Lymphocyte_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Intub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Intub_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Intub_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Intub_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
	};
};



*		Lymphocyte - Non Intubated;
foreach v of varlist Lymphocyte_Nonintub_Mean-Lymphocyte_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Nonintub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Nonintub_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Nonintub_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Nonintub_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
	};
};



*		Lymphocyte - Mortality;
foreach v of varlist Lymphocyte_Mortality_Mean-Lymphocyte_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Mortality_Unit == "/µL";
		replace `v' = `v'*10^(-3) if Lymphocyte_Mortality_Unit == "×10^3/Ml";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Mortality_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Mortality_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Mortality_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Mortality_Unit=="×10^3/Ml";
	};
};



*		Lymphocyte - Survived;
foreach v of varlist Lymphocyte_Survived_Mean-Lymphocyte_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Lymphocyte_Survived_Unit == "/µL";
		replace `v' = `v'*10^(-3) if Lymphocyte_Survived_Unit == "×10^3/Ml";
	};
	else {;
		replace `v'="10^9/L" if Lymphocyte_Survived_Unit=="/µL";
		replace `v'="10^9/L" if Lymphocyte_Survived_Unit=="K/µL"; // 10^9/L = K/µL for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Survived_Unit=="g/L"; // 10^9/L = g/L for Lymphocytes
		replace `v'="10^9/L" if Lymphocyte_Survived_Unit=="×10^3/Ml";
	};
};





****************
***Neutrophil***
****************;

*		Neutrophil - ICU;
foreach v of varlist Neutrophil_ICU_Mean-Neutrophil_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_ICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Neutrophil_ICU_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_ICU_Unit=="mm^3";
		replace `v'="10^9/L" if Neutrophil_ICU_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_ICU_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_ICU_Unit=="K/μL";
		replace `v'="10^9/L" if Neutrophil_ICU_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Non ICU;
foreach v of varlist Neutrophil_NonICU_Mean-Neutrophil_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_NonICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Neutrophil_NonICU_Unit == "/µL";

	};
	else {;
		replace `v'="10^9/L" if Neutrophil_NonICU_Unit=="mm^3";
		replace `v'="10^9/L" if Neutrophil_NonICU_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_NonICU_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_NonICU_Unit=="K/μL";
		replace `v'="10^9/L" if Neutrophil_NonICU_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};


*		Neutrophil - Hospitalized;
foreach v of varlist Neutrophil_Hosp_Mean-Neutrophil_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Hosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Hosp_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Hosp_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Hosp_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Non hospitalized;
foreach v of varlist Neutrophil_Nonhosp_Mean-Neutrophil_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Nonhosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Nonhosp_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Nonhosp_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Nonhosp_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Intubated;
foreach v of varlist Neutrophil_Intub_Mean-Neutrophil_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Intub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Intub_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Intub_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Intub_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Non Intubated;
foreach v of varlist Neutrophil_Nonintub_Mean-Neutrophil_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Nonintub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Nonintub_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Nonintub_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Nonintub_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Mortality;
foreach v of varlist Neutrophil_Mortality_Mean-Neutrophil_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Mortality_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Mortality_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Mortality_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Mortality_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



*		Neutrophil - Survived;
foreach v of varlist Neutrophil_Survived_Mean-Neutrophil_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Neutrophil_Survived_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Neutrophil_Survived_Unit=="/µL";
		replace `v'="10^9/L" if Neutrophil_Survived_Unit=="K/µL"; // 10^9/L = K/µL for Neutrophils
		replace `v'="10^9/L" if Neutrophil_Survived_Unit=="g/L"; // 10^9/L = g/L for Neutrophils
	};
};



****************
***Hemoglobin***
****************;

*		Hgb - ICU;
foreach v of varlist Hgb_ICU_Mean-Hgb_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_ICU_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_ICU_Unit=="g/dL";
	};
};



*		Hgb - Non ICU;
foreach v of varlist Hgb_NonICU_Mean-Hgb_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_NonICU_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_NonICU_Unit=="g/dL";
	};
};



*		Hgb - Hospitalized;
replace Hgb_Hosp_Unit="g/L" if Hgb_Hosp_Q3==138 & Hgb_Hosp_Q1==118; //mistake from authors
replace Hgb_Hosp_Unit="g/L" if Hgb_Hosp_Q3==135 & Hgb_Hosp_Q1==115; //mistake from authors

foreach v of varlist Hgb_Hosp_Mean-Hgb_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_Hosp_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_Hosp_Unit=="g/dL";
	};
};



*		Hgb - Non hospitalized;
foreach v of varlist Hgb_Nonhosp_Mean-Hgb_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_Nonhosp_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_Nonhosp_Unit=="g/dL";
	};
};



*		Hgb - Mortality;
foreach v of varlist Hgb_Mortality_Mean-Hgb_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_Mortality_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_Mortality_Unit=="g/dL";
	};
};



*		Hgb - Survived;
foreach v of varlist Hgb_Survived_Mean-Hgb_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if Hgb_Survived_Unit == "g/dL";
	};
	else {;
		replace `v'="g/L" if Hgb_Survived_Unit=="g/dL";
	};
};





***************
***Leukocyte***
***************;

*		Leukocyte - ICU;
foreach v of varlist Leukocyte_ICU_Mean-Leukocyte_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_ICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Leukocyte_ICU_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="mm^3";
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="K/μL";
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="g/L"; // 10^9/L = g/L for leukocytes
		replace `v'="10^9/L" if Leukocyte_ICU_Unit=="10^9 /L";
	};
};



*		Leukocyte - Non ICU;
foreach v of varlist Leukocyte_NonICU_Mean-Leukocyte_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_NonICU_Unit == "mm^3";
		replace `v' = `v'*10^(-3) if Leukocyte_NonICU_Unit == "/µL";

	};
	else {;
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="mm^3";
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="K/μL";
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="g/L"; // 10^9/L = g/L for leukocytes
		replace `v'="10^9/L" if Leukocyte_NonICU_Unit=="10^9 /L"; // 10^9/L = g/L for leukocytes

	};
};


*		Leukocyte - Hospitalized;
foreach v of varlist Leukocyte_Hosp_Mean-Leukocyte_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Hosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Hosp_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Hosp_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Hosp_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};



*		Leukocyte - Non hospitalized;
foreach v of varlist Leukocyte_Nonhosp_Mean-Leukocyte_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Nonhosp_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Nonhosp_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Nonhosp_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Nonhosp_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};



*		Leukocyte - Intubated;
foreach v of varlist Leukocyte_Intub_Mean-Leukocyte_Intub_LowRange Leukocyte_Intub_Median-Leukocyte_Intub_Unit {; //************************************************************//
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Intub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Intub_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Intub_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Intub_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};



*		Leukocyte - Non Intubated;
foreach v of varlist Leukocyte_Nonintub_Mean-Leukocyte_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Nonintub_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Nonintub_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Nonintub_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Nonintub_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};



*		Leukocyte - Mortality;
foreach v of varlist Leukocyte_Mortality_Mean-Leukocyte_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Mortality_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Mortality_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Mortality_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Mortality_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};



*		Leukocyte - Survived;
foreach v of varlist Leukocyte_Survived_Mean-Leukocyte_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if Leukocyte_Survived_Unit == "/µL";
	};
	else {;
		replace `v'="10^9/L" if Leukocyte_Survived_Unit=="/µL";
		replace `v'="10^9/L" if Leukocyte_Survived_Unit=="K/µL"; // 10^9/L = K/µL for leukocytes
		replace `v'="10^9/L" if Leukocyte_Survived_Unit=="g/L"; // 10^9/L = g/L for leukocytes
	};
};




codebook *_Unit;





*******************************************************************************;
save "01 Blood/COVIDSR_Blood_CLEAN_20200922 - data", replace;

export delimited using "01 Blood\COVIDSR_Blood_CSV.csv", replace;

capture log close;


























































