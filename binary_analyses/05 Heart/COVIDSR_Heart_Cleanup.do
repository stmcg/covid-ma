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

Heart - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Heart_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Heart") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Rename variables;
*		Creatine kinase (CK);
rename HeartCKICUadmissionNum CK_ICU_N;
	rename HeartCKICUadmissionMEA CK_ICU_Mean;
	rename HeartCKICUadmissionSTD CK_ICU_STDEV;
	rename HeartCKICUadmissionRAN CK_ICU_LowRange;
	rename J CK_ICU_UpRange;
	rename HeartCKICUadmissionMED CK_ICU_Median;
	rename HeartCKICUadmissionIQR CK_ICU_Q1;
	rename M CK_ICU_Q3;
	rename HeartCKICUadmissionUNI CK_ICU_Unit;
rename HeartCKNonICUadmission CK_NonICU_N;
	rename P CK_NonICU_Mean;
	rename Q CK_NonICU_STDEV;
	rename R CK_NonICU_LowRange;
	rename S CK_NonICU_UpRange;
	rename T CK_NonICU_Median;
	rename U CK_NonICU_Q1;
	rename V CK_NonICU_Q3;
	rename W CK_NonICU_Unit;
rename HeartCKHospitalizedNumb CK_Hosp_N;
	rename HeartCKHospitalizedMEAN CK_Hosp_Mean;
	rename HeartCKHospitalizedSTDE CK_Hosp_STDEV;
	rename HeartCKHospitalizedRANG CK_Hosp_LowRange;
	rename AB CK_Hosp_UpRange;
	rename HeartCKHospitalizedMEDI CK_Hosp_Median;
	rename HeartCKHospitalizedIQR CK_Hosp_Q1;
	rename AE CK_Hosp_Q3;
	rename HeartCKHospitalizedUNIT CK_Hosp_Unit;
rename HeartCKNonhospitalized CK_Nonhosp_N;
	rename AH CK_Nonhosp_Mean;
	rename AI CK_Nonhosp_STDEV;
	rename AJ CK_Nonhosp_LowRange;
	rename AK CK_Nonhosp_UpRange;
	rename AL CK_Nonhosp_Median;
	rename AM CK_Nonhosp_Q1;
	rename AN CK_Nonhosp_Q3;
	rename AO CK_Nonhosp_Unit;
	drop AP; //duplicate Nonhosp unit column; check dataset to make sure empty
rename HeartCKIntubatedNumber CK_Intub_N;
	rename HeartCKIntubatedMEAN CK_Intub_Mean;
	rename HeartCKIntubatedSTDEV CK_Intub_STDEV;
	rename HeartCKIntubatedRANGEL CK_Intub_LowRange;
	rename HeartCKIntubatedRANGEU CK_Intub_UpRange;
	rename HeartCKIntubatedMEDIAN CK_Intub_Median;
	rename HeartCKIntubatedIQRQ1 CK_Intub_Q1;
	rename HeartCKIntubatedIQRQ3 CK_Intub_Q3;
	rename HeartCKIntubatedUNIT CK_Intub_Unit;
rename HeartCKNonintubatedNum CK_Nonintub_N;
	rename HeartCKNonintubatedMEA CK_Nonintub_Mean;
	rename HeartCKNonintubatedSTD CK_Nonintub_STDEV;
	rename HeartCKNonintubatedRAN CK_Nonintub_LowRange;
	rename BD CK_Nonintub_UpRange;
	rename HeartCKNonintubatedMED CK_Nonintub_Median;
	rename HeartCKNonintubatedIQR CK_Nonintub_Q1;
	rename BG CK_Nonintub_Q3;
	rename HeartCKNonintubatedUNI CK_Nonintub_Unit;
rename HeartCKMortalityNumber CK_Mortality_N;
	rename HeartCKMortalityMEAN CK_Mortality_Mean;
	rename HeartCKMortalitySTDEV CK_Mortality_STDEV;
	rename HeartCKMortalityRANGEL CK_Mortality_LowRange;
	rename HeartCKMortalityRANGEU CK_Mortality_UpRange;
	rename HeartCKMortalityMEDIAN CK_Mortality_Median;
	rename HeartCKMortalityIQRQ1 CK_Mortality_Q1;
	rename HeartCKMortalityIQRQ3 CK_Mortality_Q3;
	rename HeartCKMortalityUNIT CK_Mortality_Unit;
rename HeartCKSurvivedNumbero CK_Survived_N;
	rename HeartCKSurvivedMEAN CK_Survived_Mean;
	rename HeartCKSurvivedSTDEV CK_Survived_STDEV;
	rename HeartCKSurvivedRANGELO CK_Survived_LowRange;
	rename HeartCKSurvivedRANGEUP CK_Survived_UpRange;
	rename HeartCKSurvivedMEDIAN CK_Survived_Median;
	rename HeartCKSurvivedIQRQ1 CK_Survived_Q1;
	rename HeartCKSurvivedIQRQ3 CK_Survived_Q3;
	rename HeartCKSurvivedUNIT CK_Survived_Unit;
rename HeartCKReportedforother CK_Other;
	rename HeartCKOtherNumberofp CK_Other_N;
	rename HeartCKOtherMEAN CK_Other_Mean;
	rename HeartCKOtherSTDEV CK_Other_STDEV;
	rename HeartCKOtherRANGELOWER CK_Other_LowRange;
	rename HeartCKOtherRANGEUPPER CK_Other_UpRange;
	rename HeartCKOtherMEDIAN CK_Other_Median;
	rename HeartCKOtherIQRQ1 CK_Other_Q1;
	rename HeartCKOtherIQRQ3 CK_Other_Q3;
	rename HeartCKOtherUNIT CK_Other_Unit;
*		Creatine kinase-MB (CK-MB);
rename HeartCKMBICUadmission CKMB_ICU_N;
	rename CL CKMB_ICU_Mean;
	rename CM CKMB_ICU_STDEV;
	rename CN CKMB_ICU_LowRange;
	rename CO CKMB_ICU_UpRange;
	rename CP CKMB_ICU_Median;
	rename CQ CKMB_ICU_Q1;
	rename CR CKMB_ICU_Q3;
	rename CS CKMB_ICU_Unit;
rename HeartCKMBNonICUadmissio CKMB_NonICU_N;
	rename CU CKMB_NonICU_Mean;
	rename CV CKMB_NonICU_STDEV;
	rename CW CKMB_NonICU_LowRange;
	rename CX CKMB_NonICU_UpRange;
	rename CY CKMB_NonICU_Median;
	rename CZ CKMB_NonICU_Q1;
	rename DA CKMB_NonICU_Q3;
	rename DB CKMB_NonICU_Unit;
rename HeartCKMBHospitalizedN CKMB_Hosp_N;
	rename HeartCKMBHospitalizedM CKMB_Hosp_Mean;
	rename HeartCKMBHospitalizedS CKMB_Hosp_STDEV;
	rename HeartCKMBHospitalizedR CKMB_Hosp_LowRange;
	rename DG CKMB_Hosp_UpRange;
	rename DH CKMB_Hosp_Median;
	rename HeartCKMBHospitalizedI CKMB_Hosp_Q1;
	rename DJ CKMB_Hosp_Q3;
	rename HeartCKMBHospitalizedU CKMB_Hosp_Unit;
rename HeartCKMBNonhospitalized CKMB_Nonhosp_N;
	rename DM CKMB_Nonhosp_Mean;
	rename DN CKMB_Nonhosp_STDEV;
	rename DO CKMB_Nonhosp_LowRange;
	rename DP CKMB_Nonhosp_UpRange;
	rename DQ CKMB_Nonhosp_Median;
	rename DR CKMB_Nonhosp_Q1;
	rename DS CKMB_Nonhosp_Q3;
	rename DT CKMB_Nonhosp_Unit;
rename HeartCKMBIntubatedNumb CKMB_Intub_N;
	rename HeartCKMBIntubatedMEAN CKMB_Intub_Mean;
	rename HeartCKMBIntubatedSTDE CKMB_Intub_STDEV;
	rename HeartCKMBIntubatedRANG CKMB_Intub_LowRange;
	rename DY CKMB_Intub_UpRange;
	rename HeartCKMBIntubatedMEDI CKMB_Intub_Median;
	rename HeartCKMBIntubatedIQR CKMB_Intub_Q1;
	rename EB CKMB_Intub_Q3;
	rename HeartCKMBIntubatedUNIT CKMB_Intub_Unit;
rename HeartCKMBNonintubated CKMB_Nonintub_N;
	rename EE CKMB_Nonintub_Mean;
	rename EF CKMB_Nonintub_STDEV;
	rename EG CKMB_Nonintub_LowRange;
	rename EH CKMB_Nonintub_UpRange;
	rename EI CKMB_Nonintub_Median;
	rename EJ CKMB_Nonintub_Q1;
	rename EK CKMB_Nonintub_Q3;
	rename EL CKMB_Nonintub_Unit;
rename HeartCKMBMortalityNumb CKMB_Mortality_N;
	rename HeartCKMBMortalityMEAN CKMB_Mortality_Mean;
	rename HeartCKMBMortalitySTDE CKMB_Mortality_STDEV;
	rename HeartCKMBMortalityRANG CKMB_Mortality_LowRange;
	rename EQ CKMB_Mortality_UpRange;
	rename HeartCKMBMortalityMEDI CKMB_Mortality_Median;
	rename HeartCKMBMortalityIQR CKMB_Mortality_Q1;
	rename ET CKMB_Mortality_Q3;
	rename HeartCKMBMortalityUNIT CKMB_Mortality_Unit;
rename HeartCKMBSurvivedNumbe CKMB_Survived_N;
	rename HeartCKMBSurvivedMEAN CKMB_Survived_Mean;
	rename HeartCKMBSurvivedSTDEV CKMB_Survived_STDEV;
	rename HeartCKMBSurvivedRANGE CKMB_Survived_LowRange;
	rename EZ CKMB_Survived_UpRange;
	rename HeartCKMBSurvivedMEDIA CKMB_Survived_Median;
	rename HeartCKMBSurvivedIQRQ CKMB_Survived_Q1;
	rename FC CKMB_Survived_Q3;
	rename HeartCKMBSurvivedUNIT CKMB_Survived_Unit;
rename HeartCKMBReportedforoth CKMB_Other;
	rename HeartCKMBOtherNumbero CKMB_Other_N;
	rename HeartCKMBOtherMEAN CKMB_Other_Mean;
	rename HeartCKMBOtherSTDEV CKMB_Other_STDEV;
	rename HeartCKMBOtherRANGELO CKMB_Other_LowRange;
	rename HeartCKMBOtherRANGEUP CKMB_Other_UpRange;
	rename HeartCKMBOtherMEDIAN CKMB_Other_Median;
	rename HeartCKMBOtherIQRQ1 CKMB_Other_Q1;
	rename HeartCKMBOtherIQRQ3 CKMB_Other_Q3;
	rename HeartCKMBOtherUNIT CKMB_Other_Unit;
*		Troponin I;
rename HeartTroponinIICUadmissi TroponinI_ICU_N;
	rename FP TroponinI_ICU_Mean;
	rename FQ TroponinI_ICU_STDEV;
	rename FR TroponinI_ICU_LowRange;
	rename FS TroponinI_ICU_UpRange;
	rename FT TroponinI_ICU_Median;
	rename FU TroponinI_ICU_Q1;
	rename HeartTroponinIICUadmissio TroponinI_ICU_Q3;
	rename FW TroponinI_ICU_Unit;
rename HeartTroponinINonICUadm TroponinI_NonICU_N;
	rename FY TroponinI_NonICU_Mean;
	rename FZ TroponinI_NonICU_STDEV;
	rename GA TroponinI_NonICU_LowRange;
	rename GB TroponinI_NonICU_UpRange;
	rename GC TroponinI_NonICU_Median;
	rename GD TroponinI_NonICU_Q1;
	rename HeartTroponinINonICUadmi TroponinI_NonICU_Q3;
	rename GF TroponinI_NonICU_Unit;
rename HeartTroponinIHospitalize TroponinI_Hosp_N;
	rename GH TroponinI_Hosp_Mean;
	rename GI TroponinI_Hosp_STDEV;
	rename GJ TroponinI_Hosp_LowRange;
	rename GK TroponinI_Hosp_UpRange;
	rename GL TroponinI_Hosp_Median;
	rename GM TroponinI_Hosp_Q1;
	rename GN TroponinI_Hosp_Q3;
	rename GO TroponinI_Hosp_Unit;
rename HeartTroponinINonhospita TroponinI_Nonhosp_N;
	rename GQ TroponinI_Nonhosp_Mean;
	rename GR TroponinI_Nonhosp_STDEV;
	rename GS TroponinI_Nonhosp_LowRange;
	rename GT TroponinI_Nonhosp_UpRange;
	rename GU TroponinI_Nonhosp_Median;
	rename GV TroponinI_Nonhosp_Q1;
	rename GW TroponinI_Nonhosp_Q3;
	rename GX TroponinI_Nonhosp_Unit;
rename HeartTroponinIIntubated TroponinI_Intub_N;
	rename GZ TroponinI_Intub_Mean;
	rename HA TroponinI_Intub_STDEV;
	rename HB TroponinI_Intub_LowRange;
	rename HC TroponinI_Intub_UpRange;
	rename HD TroponinI_Intub_Median;
	rename HE TroponinI_Intub_Q1;
	rename HF TroponinI_Intub_Q3;
	rename HG TroponinI_Intub_Unit;
rename HeartTroponinINonintubat TroponinI_Nonintub_N;
	rename HI TroponinI_Nonintub_Mean;
	rename HJ TroponinI_Nonintub_STDEV;
	rename HK TroponinI_Nonintub_LowRange;
	rename HL TroponinI_Nonintub_UpRange;
	rename HeartTroponinINonintubate TroponinI_Nonintub_Median;
	rename HN TroponinI_Nonintub_Q1;
	rename HO TroponinI_Nonintub_Q3;
	rename HP TroponinI_Nonintub_Unit;
rename HeartTroponinIMortality TroponinI_Mortality_N;
	rename HR TroponinI_Mortality_Mean;
	rename HS TroponinI_Mortality_STDEV;
	rename HT TroponinI_Mortality_LowRange;
	rename HU TroponinI_Mortality_UpRange;
	rename HV TroponinI_Mortality_Median;
	rename HW TroponinI_Mortality_Q1;
	rename HX TroponinI_Mortality_Q3;
	rename HY TroponinI_Mortality_Unit;
rename HeartTroponinISurvived TroponinI_Survived_N;
	rename IA TroponinI_Survived_Mean;
	rename IB TroponinI_Survived_STDEV;
	rename IC TroponinI_Survived_LowRange;
	rename ID TroponinI_Survived_UpRange;
	rename IE TroponinI_Survived_Median;
	rename IF TroponinI_Survived_Q1;
	rename IG TroponinI_Survived_Q3;
	rename IH TroponinI_Survived_Unit;
rename HeartTroponinIReportedfo TroponinI_Other; //contains data for intubated
	rename HeartTroponinIOtherNum TroponinI_Other_N;
	rename HeartTroponinIOtherMEA TroponinI_Other_Mean;
	rename HeartTroponinIOtherSTD TroponinI_Other_STDEV;
	rename HeartTroponinIOtherRAN TroponinI_Other_LowRange;
	rename IN TroponinI_Other_UpRange;
	rename HeartTroponinIOtherMED TroponinI_Other_Median;
	rename HeartTroponinIOtherIQR TroponinI_Other_Q1;
	rename IQ TroponinI_Other_Q3;
	rename HeartTroponinIOtherUNI TroponinI_Other_Unit;
*		Troponin T;
rename HeartTroponinTICUadmissi TroponinT_ICU_N;
	rename IT TroponinT_ICU_Mean;
	rename IU TroponinT_ICU_STDEV;
	rename IV TroponinT_ICU_LowRange;
	rename IW TroponinT_ICU_UpRange;
	rename IX TroponinT_ICU_Median;
	rename IY TroponinT_ICU_Q1;
	rename IZ TroponinT_ICU_Q3;
	rename JA TroponinT_ICU_Unit;
rename HeartTroponinTNonICUadm TroponinT_NonICU_N;
	rename JC TroponinT_NonICU_Mean;
	rename JD TroponinT_NonICU_STDEV;
	rename JE TroponinT_NonICU_LowRange;
	rename JF TroponinT_NonICU_UpRange;
	rename JG TroponinT_NonICU_Median;
	rename JH TroponinT_NonICU_Q1;
	rename JI TroponinT_NonICU_Q3;
	rename JJ TroponinT_NonICU_Unit;
rename HeartTroponinTHospitalize TroponinT_Hosp_N; 
	rename JL TroponinT_Hosp_Mean;
	rename JM TroponinT_Hosp_STDEV;
	rename JN TroponinT_Hosp_LowRange;
	rename JO TroponinT_Hosp_UpRange;
	rename JP TroponinT_Hosp_Median;
	rename JQ TroponinT_Hosp_Q1;
	rename JR TroponinT_Hosp_Q3;
	rename JS TroponinT_Hosp_Unit;
rename HeartTroponinTNonhospita TroponinT_Nonhosp_N;
	rename JU TroponinT_Nonhosp_Mean;
	rename JV TroponinT_Nonhosp_STDEV;
	rename JW TroponinT_Nonhosp_LowRange;
	rename JX TroponinT_Nonhosp_UpRange;
	rename JY TroponinT_Nonhosp_Median;
	rename JZ TroponinT_Nonhosp_Q1;
	rename KA TroponinT_Nonhosp_Q3;
	rename KB TroponinT_Nonhosp_Unit;
rename HeartTroponinTNonintubat TroponinT_Nonintub_N; //Troponin T intubated group missing from Excel
	rename KD TroponinT_Nonintub_Mean;
	rename KE TroponinT_Nonintub_STDEV;
	rename KF TroponinT_Nonintub_LowRange;
	rename KG TroponinT_Nonintub_UpRange;
	rename KH TroponinT_Nonintub_Median;
	rename KI TroponinT_Nonintub_Q1;
	rename KJ TroponinT_Nonintub_Q3;
	rename KK TroponinT_Nonintub_Unit;
rename HeartTroponinTMortality TroponinT_Mortality_N;
	rename KM TroponinT_Mortality_Mean;
	rename KN TroponinT_Mortality_STDEV;
	rename KO TroponinT_Mortality_LowRange;
	rename KP TroponinT_Mortality_UpRange;
	rename KQ TroponinT_Mortality_Median;
	rename KR TroponinT_Mortality_Q1;
	rename KS TroponinT_Mortality_Q3;
	rename KT TroponinT_Mortality_Unit;
rename HeartTroponinTSurvived TroponinT_Survived_N;
	rename KV TroponinT_Survived_Mean;
	rename KW TroponinT_Survived_STDEV;
	rename KX TroponinT_Survived_LowRange;
	rename KY TroponinT_Survived_UpRange;
	rename KZ TroponinT_Survived_Median;
	rename LA TroponinT_Survived_Q1;
	rename LB TroponinT_Survived_Q3;
	rename LC TroponinT_Survived_Unit;
rename HeartTroponinTReportedfo TroponinT_Other;
	rename HeartTroponinTOtherNum TroponinT_Intub_N;
	rename HeartTroponinTOtherMEA TroponinT_Intub_Mean;
	rename HeartTroponinTOtherSTD TroponinT_Intub_STDEV;
	rename HeartTroponinTOtherRAN TroponinT_Intub_LowRange;
	rename LI TroponinT_Intub_UpRange;
	rename HeartTroponinTOtherMED TroponinT_Intub_Median;
	rename HeartTroponinTOtherIQR TroponinT_Intub_Q1;
	rename LL TroponinT_Intub_Q3;
	rename HeartTroponinTOtherUNI TroponinT_Intub_Unit;
*		Brain Natriuretic Peptide (BNP);
rename HeartBNPICUadmissionNu BNP_ICU_N;
	rename HeartBNPICUadmissionME BNP_ICU_Mean;
	rename HeartBNPICUadmissionST BNP_ICU_STDEV;
	rename HeartBNPICUadmissionRA BNP_ICU_LowRange;
	rename LR BNP_ICU_UpRange;
	rename LS BNP_ICU_Median;
	rename HeartBNPICUadmissionIQ BNP_ICU_Q1;
	rename LU BNP_ICU_Q3;
	rename HeartBNPICUadmissionUN BNP_ICU_Unit;
rename HeartBNPNonICUadmission BNP_NonICU_N;
	rename LX BNP_NonICU_Mean;
	rename LY BNP_NonICU_STDEV;
	rename LZ BNP_NonICU_LowRange;
	rename MA BNP_NonICU_UpRange;
	rename MB BNP_NonICU_Median;
	rename MC BNP_NonICU_Q1;
	rename MD BNP_NonICU_Q3;
	rename ME BNP_NonICU_Unit;
rename HeartBNPHospitalizedVAL BNP_Hosp_N; //excel has "value" instead of "number"
	rename MG BNP_Hosp_Mean; //labelled as 'value' on excel but was supposed to be mean
	rename HeartBNPHospitalizedSTD BNP_Hosp_STDEV;
	rename HeartBNPHospitalizedRAN BNP_Hosp_LowRange;
	rename MJ BNP_Hosp_UpRange;
	rename HeartBNPHospitalizedMED BNP_Hosp_Median;
	rename HeartBNPHospitalizedIQR BNP_Hosp_Q1;
	rename MM BNP_Hosp_Q3;
	rename HeartBNPHospitalizedUNI BNP_Hosp_Unit;
rename HeartBNPNonhospitalized BNP_Nonhosp_N;
	rename MP BNP_Nonhosp_Mean;
	rename MQ BNP_Nonhosp_STDEV;
	rename MR BNP_Nonhosp_LowRange;
	rename MS BNP_Nonhosp_UpRange;
	rename MT BNP_Nonhosp_Median;
	rename MU BNP_Nonhosp_Q1;
	rename MV BNP_Nonhosp_Q3;
	rename MW BNP_Nonhosp_Unit;
	drop MX;// duplicate non-hosp units
rename HeartBNPIntubatedNumber BNP_Intub_N;
	rename HeartBNPIntubatedMEAN BNP_Intub_Mean;
	rename HeartBNPIntubatedSTDEV BNP_Intub_STDEV;
	rename HeartBNPIntubatedRANGE BNP_Intub_LowRange;
	rename NC BNP_Intub_UpRange;
	rename HeartBNPIntubatedMEDIAN BNP_Intub_Median;
	rename HeartBNPIntubatedIQRQ1 BNP_Intub_Q1;
	rename HeartBNPIntubatedIQRQ3 BNP_Intub_Q3;
	rename HeartBNPIntubatedUNIT BNP_Intub_Unit;
rename HeartBNPNonintubatedNu BNP_Nonintub_N;
	rename HeartBNPNonintubatedME BNP_Nonintub_Mean;
	rename HeartBNPNonintubatedST BNP_Nonintub_STDEV;
	rename HeartBNPNonintubatedRA BNP_Nonintub_LowRange;
	rename NL BNP_Nonintub_UpRange;
	rename NM BNP_Nonintub_Median;
	rename HeartBNPNonintubatedIQ BNP_Nonintub_Q1;
	rename NO BNP_Nonintub_Q3;
	rename HeartBNPNonintubatedUN BNP_Nonintub_Unit;
rename HeartBNPMortalityNumber BNP_Mortality_N;
	rename HeartBNPMortalityMEAN BNP_Mortality_Mean;
	rename HeartBNPMortalitySTDEV BNP_Mortality_STDEV;
	rename HeartBNPMortalityRANGE BNP_Mortality_LowRange;
	rename NU BNP_Mortality_UpRange;
	rename HeartBNPMortalityMEDIAN BNP_Mortality_Median;
	rename HeartBNPMortalityIQRQ1 BNP_Mortality_Q1;
	rename HeartBNPMortalityIQRQ3 BNP_Mortality_Q3;
	rename HeartBNPMortalityUNIT BNP_Mortality_Unit;
rename HeartBNPSurvivedNumber BNP_Survived_N;
	rename HeartBNPSurvivedMEAN BNP_Survived_Mean;
	rename HeartBNPSurvivedSTDEV BNP_Survived_STDEV;
	rename HeartBNPSurvivedRANGEL BNP_Survived_LowRange;
	rename HeartBNPSurvivedRANGEU BNP_Survived_UpRange;
	rename HeartBNPSurvivedMEDIAN BNP_Survived_Median;
	rename HeartBNPSurvivedIQRQ1 BNP_Survived_Q1;
	rename HeartBNPSurvivedIQRQ3 BNP_Survived_Q3;
	rename HeartBNPSurvivedUNIT BNP_Survived_Unit;
rename HeartBNPReportedforother BNP_Other;
	rename HeartBNPOtherNumberof BNP_Other_N;
	rename HeartBNPOtherMEAN BNP_Other_Mean;
	rename HeartBNPOtherSTDEV BNP_Other_STDEV;
	rename HeartBNPOtherRANGELOWE BNP_Other_LowRange;
	rename HeartBNPOtherRANGEUPPE BNP_Other_UpRange;
	rename HeartBNPOtherMEDIAN BNP_Other_Median;
	rename HeartBNPOtherIQRQ1 BNP_Other_Q1;
	rename HeartBNPOtherIQRQ3 BNP_Other_Q3;
	rename HeartBNPOtherUNIT BNP_Other_Unit;
*		D-Dimer; 
rename HeartDDimerICUadmission DDimer_ICU_N;
	rename OT DDimer_ICU_Mean;
	rename OU DDimer_ICU_STDEV;
	rename OV DDimer_ICU_LowRange;
	rename OW DDimer_ICU_UpRange;
	rename OX DDimer_ICU_Median;
	rename OY DDimer_ICU_Q1;
	rename OZ DDimer_ICU_Q3;
	rename PA DDimer_ICU_Unit;
rename HeartDDimerNonICUadmiss DDimer_NonICU_N;
	rename PC DDimer_NonICU_Mean;
	rename PD DDimer_NonICU_STDEV;
	rename PE DDimer_NonICU_LowRange;
	rename PF DDimer_NonICU_UpRange;
	rename PG DDimer_NonICU_Median;
	rename PH DDimer_NonICU_Q1;
	rename PI DDimer_NonICU_Q3;
	rename PJ DDimer_NonICU_Unit;
rename HeartDDimerHospitalized DDimer_Hosp_N;
	rename PL DDimer_Hosp_Mean;
	rename PM DDimer_Hosp_STDEV;
	rename PN DDimer_Hosp_LowRange;
	rename PO DDimer_Hosp_UpRange;
	rename PP DDimer_Hosp_Median;
	rename PQ DDimer_Hosp_Q1;
	rename PR DDimer_Hosp_Q3;
	rename PS DDimer_Hosp_Unit;
rename HeartDDimerNonhospitaliz DDimer_Nonhosp_N;
	rename PU DDimer_Nonhosp_Mean;
	rename PV DDimer_Nonhosp_STDEV;
	rename PW DDimer_Nonhosp_LowRange;
	rename PX DDimer_Nonhosp_UpRange;
	rename PY DDimer_Nonhosp_Median;
	rename PZ DDimer_Nonhosp_Q1;
	rename QA DDimer_Nonhosp_Q3;
	rename QB DDimer_Nonhosp_Unit;
rename HeartDDimerIntubatedVA DDimer_Intub_N; //value, should be number?
	rename QD DDimer_Intub_Mean; //labelled as 'value' on excel but was supposed to be mean
	rename HeartDDimerIntubatedST DDimer_Intub_STDEV;
	rename HeartDDimerIntubatedRA DDimer_Intub_LowRange;
	rename QG DDimer_Intub_UpRange;
	rename HeartDDimerIntubatedME DDimer_Intub_Median;
	rename HeartDDimerIntubatedIQ DDimer_Intub_Q1;
	rename QJ DDimer_Intub_Q3;
	rename HeartDDimerIntubatedUN DDimer_Intub_Unit;
rename HeartDDimerNonintubated DDimer_Nonintub_N; //value, should be N?
	rename QM DDimer_Nonintub_Mean; //labelled as 'value' on excel but was supposed to be mean
	rename QN DDimer_Nonintub_STDEV;
	rename QO DDimer_Nonintub_LowRange;
	rename QP DDimer_Nonintub_UpRange;
	rename QQ DDimer_Nonintub_Median;
	rename QR DDimer_Nonintub_Q1;
	rename QS DDimer_Nonintub_Q3;
	rename QT DDimer_Nonintub_Unit;
rename HeartDDimerMortalityNu DDimer_Mortality_N;
	rename HeartDDimerMortalityME DDimer_Mortality_Mean;
	rename HeartDDimerMortalityST DDimer_Mortality_STDEV;
	rename HeartDDimerMortalityRA DDimer_Mortality_LowRange;
	rename QY DDimer_Mortality_UpRange;
	rename QZ DDimer_Mortality_Median;
	rename HeartDDimerMortalityIQ DDimer_Mortality_Q1;
	rename RB DDimer_Mortality_Q3;
	rename HeartDDimerMortalityUN DDimer_Mortality_Unit;
rename HeartDDimerSurvivedNum DDimer_Survived_N;
	rename HeartDDimerSurvivedMEA DDimer_Survived_Mean;
	rename HeartDDimerSurvivedSTD DDimer_Survived_STDEV;
	rename HeartDDimerSurvivedRAN DDimer_Survived_LowRange;
	rename RH DDimer_Survived_UpRange;
	rename HeartDDimerSurvivedMED DDimer_Survived_Median;
	rename HeartDDimerSurvivedIQR DDimer_Survived_Q1;
	rename RK DDimer_Survived_Q3;
	rename HeartDDimerSurvivedUNI DDimer_Survived_Unit;
rename HeartDDimerReportedforo DDimer_Other;
	rename HeartDDimerOtherNumber DDimer_Other_N;
	rename HeartDDimerOtherMEAN DDimer_Other_Mean;
	rename HeartDDimerOtherSTDEV DDimer_Other_STDEV;
	rename HeartDDimerOtherRANGE DDimer_Other_LowRange;
	rename RR DDimer_Other_UpRange;
	rename HeartDDimerOtherMEDIAN DDimer_Other_Median;
	rename HeartDDimerOtherIQRQ1 DDimer_Other_Q1;
	rename HeartDDimerOtherIQRQ3 DDimer_Other_Q3;
	rename HeartDDimerOtherUNIT DDimer_OtherUnit;
	
	

*	Data edits;
drop if Z=="79A39G2V" & TroponinI_Survived_Q3=="35,7"; // dropping the study with 2 time points (not referenced in the title)
replace DDimer_Mortality_Median="2.295" if DDimer_Mortality_Median=="2295";
replace DDimer_Mortality_Mean="5.159" if DDimer_Mortality_Mean=="5159";
replace DDimer_Mortality_STDEV="4.679" if DDimer_Mortality_STDEV=="4679";
replace DDimer_Mortality_Q3="17.005" if DDimer_Mortality_Q3=="17005";
	
	
	
*	Destring data ;
quietly ds Timestamp Zotero Reporttitle *Unit, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="unclear" | `v'=="";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Standardize units;
foreach v of varlist *Unit {;
	replace `v'="mg/L" if `v'=="mg/l" | `v'=="mg/L FEU";
	replace `v'="µg/L" if `v'=="µg/l" | `v'=="mcg/L" | `v'=="μg/L" | `v'=="ug/L";
	replace `v'="µg/mL" if `v'=="ug/mL" | `v'=="μg/mL FEU";
	replace `v'="ng/mL" if `v'=="ng/ml" | `v'=="ng/ mL";
	replace `v'="pg/mL" if `v'=="pg/ml";
	replace `v'="µg/mL" if `v'=="µg/ml" | `v'=="μg fib.eq./mL" | `v'=="µg/mL FEU";
	replace `v'="mg/mL" if `v'=="mg/ml";
	replace `v'="ng/L" if `v'=="ng/l";
	replace `v'="U/L" if `v'=="IU/L" | `v'=="U/ L" | `v'=="U/ L" | `v'=="U/l";;
	replace `v'="." if `v'=="#" | `v' =="##" | `v'=="";
};
replace CK_Survived_Unit="U/L" if Z=="V245SXAP"; //didnt convert in the loop



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-DDimer_Survived_Unit;
duplicates drop Zoterokey-DDimer_Survived_Unit, force;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & TroponinI_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & TroponinI_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & CK_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & CK_Mortality_N==.;



*	Unit conversion;
codebook *_Unit;



****************
***CKMB***
****************;

replace CKMB_Hosp_Unit="U/L" if CKMB_Hosp_Unit=="ng/mL"; // Stephan found that ng/mL = U/L
replace CKMB_Mortality_Unit="U/L" if CKMB_Mortality_Unit=="ng/mL";






****************
***Troponin I***
****************;

*		TroponinI - ICU;
foreach v of varlist TroponinI_ICU_Mean-TroponinI_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_ICU_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_ICU_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_ICU_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_ICU_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_ICU_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_ICU_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_ICU_Unit =="mg/mL";
	};
};



*		TroponinI - Non-ICU;
foreach v of varlist TroponinI_NonICU_Mean-TroponinI_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_NonICU_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_NonICU_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_NonICU_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_NonICU_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_NonICU_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_NonICU_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_NonICU_Unit =="mg/mL";

	};
};



*		TroponinI - Hospitalized;
foreach v of varlist TroponinI_Hosp_Mean-TroponinI_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Hosp_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Hosp_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Hosp_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Hosp_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Hosp_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Hosp_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Hosp_Unit =="mg/mL";
	};
};



*		TroponinI - Non hospitalized;
foreach v of varlist TroponinI_Nonhosp_Mean-TroponinI_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Nonhosp_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Nonhosp_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Nonhosp_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Nonhosp_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Nonhosp_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Nonhosp_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Nonhosp_Unit =="mg/mL";
	};
};


*		TroponinI - Intubated;
foreach v of varlist TroponinI_Intub_Mean-TroponinI_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Intub_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Intub_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Intub_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Intub_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Intub_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Intub_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Intub_Unit =="mg/mL";
	};
};



*		TroponinI - Non Intubated;
foreach v of varlist TroponinI_Nonintub_Mean-TroponinI_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Nonintub_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Nonintub_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Nonintub_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Nonintub_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Nonintub_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Nonintub_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Nonintub_Unit =="mg/mL";
	};
};



*		TroponinI - Mortality;
foreach v of varlist TroponinI_Mortality_Mean-TroponinI_Mortality_STDEV TroponinI_Mortality_UpRange-TroponinI_Mortality_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Mortality_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Mortality_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Mortality_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Mortality_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Mortality_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Mortality_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Mortality_Unit =="mg/mL";
	};
};



*		TroponinI - Survived;
foreach v of varlist TroponinI_Survived_Mean-TroponinI_Survived_STDEV TroponinI_Survived_UpRange-TroponinI_Survived_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinI_Survived_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if TroponinI_Survived_Unit == "µg/L";
		replace `v' = `v'*10^(9) if TroponinI_Survived_Unit == "mg/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinI_Survived_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinI_Survived_Unit == "ng/L";
		replace `v' = "pg/mL" if TroponinI_Survived_Unit == "µg/L";
		replace `v' = "pg/mL" if TroponinI_Survived_Unit =="mg/mL";
	};
};



****************
***Troponin T***
****************;

*		TroponinT - ICU;
foreach v of varlist TroponinT_ICU_Mean-TroponinT_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_ICU_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_ICU_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_ICU_Unit == "ng/L";
	};
};



*		TroponinT - Non-ICU;
foreach v of varlist TroponinT_NonICU_Mean-TroponinT_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_NonICU_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_NonICU_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_NonICU_Unit == "ng/L";
	};
};



*		TroponinT - Hospitalized;
foreach v of varlist TroponinT_Hosp_Mean-TroponinT_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Hosp_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Hosp_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Hosp_Unit == "ng/L";
	};
};



*		TroponinT - Non hospitalized;
foreach v of varlist TroponinT_Nonhosp_Mean-TroponinT_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Nonhosp_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Nonhosp_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Nonhosp_Unit == "ng/L";
	};
};



*		TroponinT - Non Intubated;
foreach v of varlist TroponinT_Nonintub_Mean-TroponinT_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Nonintub_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Nonintub_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Nonintub_Unit == "ng/L";
	};
};



*		TroponinT - Mortality;
foreach v of varlist TroponinT_Mortality_Mean-TroponinT_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Mortality_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Mortality_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Mortality_Unit == "ng/L";
	};
};



*		TroponinT - Survived;
foreach v of varlist TroponinT_Survived_Mean-TroponinT_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Survived_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Survived_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Survived_Unit == "ng/L";
	};
};



*		TroponinT - Other; // I think this is supposed to be the intubated since it is missing
foreach v of varlist TroponinT_Intub_Mean-TroponinT_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if TroponinT_Intub_Unit == "ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if TroponinT_Intub_Unit == "ng/mL";
		replace `v' = "pg/mL" if TroponinT_Intub_Unit == "ng/L";
	};
};





*********
***BNP***
*********;

*		BNP - ICU;
foreach v of varlist BNP_ICU_Mean-BNP_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_ICU_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_ICU_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_ICU_Unit == "ng/L";
	};
};



*		BNP - Non-ICU;
foreach v of varlist BNP_NonICU_Mean-BNP_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_NonICU_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_NonICU_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_NonICU_Unit == "ng/L";
	};
};



*		BNP - Hospitalized;
foreach v of varlist BNP_Hosp_Mean-BNP_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Hosp_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Hosp_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Hosp_Unit == "ng/L";
	};
};



*		BNP - Non hospitalized;
foreach v of varlist BNP_Nonhosp_Mean-BNP_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Nonhosp_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Nonhosp_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Nonhosp_Unit == "ng/L";
	};
};


*		BNP - Intubated;
foreach v of varlist BNP_Intub_Mean-BNP_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Intub_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Intub_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Intub_Unit == "ng/L";
	};
};



*		BNP - Non Intubated;
foreach v of varlist BNP_Nonintub_Mean-BNP_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Nonintub_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Nonintub_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Nonintub_Unit == "ng/L";
	};
};



*		BNP - Mortality;
foreach v of varlist BNP_Mortality_Mean-BNP_Mortality_STDEV BNP_Mortality_UpRange-BNP_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Mortality_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Mortality_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Mortality_Unit == "ng/L";
	};
};



*		BNP - Survived;
foreach v of varlist BNP_Survived_Mean-BNP_Survived_STDEV BNP_Survived_UpRange-BNP_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(2) if BNP_Survived_Unit == "x10^2 pg/mL";
	};
	else {;
		replace `v' = "pg/mL" if BNP_Survived_Unit == "x10^2 pg/mL";
		replace `v' = "pg/mL" if BNP_Survived_Unit == "ng/L";
	};
};



************
***DDIMER***
************;


*		D-Dimer - ICU;
foreach v of varlist DDimer_ICU_Mean-DDimer_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_ICU_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_ICU_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_ICU_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_ICU_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_ICU_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_ICU_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_ICU_Unit == "mg/mL";
	};
};



*		D-Dimer - Non-ICU;
foreach v of varlist DDimer_NonICU_Mean-DDimer_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_NonICU_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_NonICU_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_NonICU_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_NonICU_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_NonICU_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_NonICU_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_NonICU_Unit == "mg/mL";
	};
};



*		D-Dimer - Hospitalized;
foreach v of varlist DDimer_Hosp_Mean-DDimer_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Hosp_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Hosp_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Hosp_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Hosp_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Hosp_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Hosp_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_Hosp_Unit == "mg/mL";
	};
};



*		D-Dimer - Non hospitalized;
foreach v of varlist DDimer_Nonhosp_Mean-DDimer_Nonhosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Nonhosp_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Nonhosp_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Nonhosp_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Nonhosp_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Nonhosp_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Nonhosp_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_Nonhosp_Unit == "mg/mL";
	};
};


*		D-Dimer - Intubated;
foreach v of varlist DDimer_Intub_Mean-DDimer_Intub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Intub_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Intub_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Intub_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Intub_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Intub_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Intub_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_Intub_Unit == "mg/mL";
	};
};



*		D-Dimer - Non Intubated;
foreach v of varlist DDimer_Nonintub_Mean-DDimer_Nonintub_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Nonintub_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Nonintub_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Nonintub_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Nonintub_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Nonintub_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Nonintub_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_Nonintub_Unit == "mg/mL";
	};
};



*		D-Dimer - Mortality;
foreach v of varlist DDimer_Mortality_Mean-DDimer_Mortality_STDEV DDimer_Mortality_UpRange-DDimer_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Mortality_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Mortality_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Mortality_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Mortality_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Mortality_Unit == "μg/mL"; 
		replace `v' = "mg/L" if DDimer_Mortality_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Mortality_Unit == "µg/L"; 
		replace `v' = "mg/L" if DDimer_Mortality_Unit == "mg/mL";
	};
};



*		D-Dimer - Survived;
foreach v of varlist DDimer_Survived_Mean-DDimer_Survived_STDEV DDimer_Survived_UpRange-DDimer_Survived_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(-3) if DDimer_Survived_Unit == "µg/L";
		replace `v' = `v'*10^(-3) if DDimer_Survived_Unit == "ng/mL";
		replace `v' = `v'*10^(3) if DDimer_Survived_Unit == "mg/mL";
	};
	else {;
		replace `v' = "mg/L" if DDimer_Survived_Unit == "µg/mL"; // mg/L = ug/mL
		replace `v' = "mg/L" if DDimer_Survived_Unit == "μg/mL"; 
		replace `v' = "mg/L" if DDimer_Survived_Unit == "ng/mL";
		replace `v' = "mg/L" if DDimer_Survived_Unit == "µg/L";
		replace `v' = "mg/L" if DDimer_Survived_Unit == "mg/mL";
	};
};



codebook *_Unit;





*******************************************************************************;

save "05 Heart/COVIDSR_Heart_CLEAN_20200922 - data", replace;

export delimited using "05 Heart\COVIDSR_Heart_CSV.csv", replace;

capture log close;













