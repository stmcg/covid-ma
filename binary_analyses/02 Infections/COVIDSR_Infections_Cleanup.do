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

Infections - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Infections_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Infections") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Drop second time point entry;
drop if Report=="Clinical Features and Short-term Outcomes of 102 Patients with Corona Virus Disease 2019 in Wuhan, China. MULTIPLE ENTRY (data was collected at two points in time)";




*	Rename variables;
*		CRP;
rename InfectionCRPICUadmission CRP_ICU_N;
	rename G CRP_ICU_Mean;
	rename H CRP_ICU_STDEV;
	rename I CRP_ICU_LowRange;
	rename J CRP_ICU_UpRange;
	rename K CRP_ICU_Median;
	rename L CRP_ICU_Q1;
	rename M CRP_ICU_Q3;
	rename N CRP_ICU_Unit;
rename InfectionCRPNonICUadmissio CRP_NonICU_N;
	rename P CRP_NonICU_Mean;
	rename Q CRP_NonICU_STDEV;
	rename R CRP_NonICU_LowRange;
	rename S CRP_NonICU_UpRange;
	rename T CRP_NonICU_Median;
	rename U CRP_NonICU_Q1;
	rename V CRP_NonICU_Q3;
	rename W CRP_NonICU_Unit;
rename InfectionCRPHospitalizedN CRP_Hosp_N;
	rename InfectionCRPHospitalizedM CRP_Hosp_Mean;
	rename InfectionCRPHospitalizedS CRP_Hosp_STDEV;
	rename InfectionCRPHospitalizedR CRP_Hosp_LowRange;
	rename AB CRP_Hosp_UpRange;
	rename AC CRP_Hosp_Median;
	rename InfectionCRPHospitalized CRP_Hosp_Q1;
	rename InfectionCRPHospitalizedI CRP_Hosp_Q3;
	rename InfectionCRPHospitalizedU CRP_Hosp_Unit;
rename InfectionCRPNonhospitalized CRP_Nonhosp_N;
	rename AH CRP_Nonhosp_Mean;
	rename AI CRP_Nonhosp_STDEV;
	rename AJ CRP_Nonhosp_LowRange;
	rename AK CRP_Nonhosp_UpRange;
	rename AL CRP_Nonhosp_Median;
	rename AM CRP_Nonhosp_Q1;
	rename AN CRP_Nonhosp_Q3;
	rename AO CRP_Nonhosp_Unit;
rename InfectionCRPIntubatedNumb CRP_Intub_N;
	rename InfectionCRPIntubatedMEAN CRP_Intub_Mean;
	rename InfectionCRPIntubatedSTDE CRP_Intub_STDEV;
	rename InfectionCRPIntubatedRANG CRP_Intub_LowRange;
	rename AT CRP_Intub_UpRange;
	rename InfectionCRPIntubatedMEDI CRP_Intub_Median;
	rename InfectionCRPIntubatedIQR CRP_Intub_Q1;
	rename AW CRP_Intub_Q3;
	rename InfectionCRPIntubatedUNIT CRP_Intub_Unit;
rename InfectionCRPNonintubated CRP_Nonintub_N;
	rename AZ CRP_Nonintub_Mean;
	rename BA CRP_Nonintub_STDEV;
	rename BB CRP_Nonintub_LowRange;
	rename BC CRP_Nonintub_UpRange;
	rename BD CRP_Nonintub_Median;
	rename BE CRP_Nonintub_Q1;
	rename BF CRP_Nonintub_Q3;
	rename BG CRP_Nonintub_Unit;
rename InfectionCRPMortalityNumb CRP_Mortality_N;
	rename InfectionCRPMortalityMEAN CRP_Mortality_Mean;
	rename InfectionCRPMortalitySTDE CRP_Mortality_STDEV;
	rename InfectionCRPMortalityRANG CRP_Mortality_LowRange;
	rename BL CRP_Mortality_UpRange;
	rename InfectionCRPMortalityMEDI CRP_Mortality_Median;
	rename InfectionCRPMortalityIQR CRP_Mortality_Q1;
	rename BO CRP_Mortality_Q3;
	rename InfectionCRPMortalityUNIT CRP_Mortality_Unit;
rename InfectionCRPSurvivedNumbe CRP_Survived_N;
	rename InfectionCRPSurvivedMEAN CRP_Survived_Mean;
	rename InfectionCRPSurvivedSTDEV CRP_Survived_STDEV;
	rename InfectionCRPSurvivedRANGE CRP_Survived_LowRange;
	rename BU CRP_Survived_UpRange;
	rename InfectionCRPSurvivedMEDIA CRP_Survived_Median;
	rename InfectionCRPSurvivedIQRQ CRP_Survived_Q1;
	rename BX CRP_Survived_Q3;
	rename InfectionCRPSurvivedUNIT CRP_Survived_Unit;
rename InfectionCRPReportedforoth CRP_Other;
	rename InfectionCRPOtherNumbero CRP_Other_N;
	rename InfectionCRPOtherMEAN CRP_Other_Mean;
	rename InfectionCRPOtherSTDEV CRP_Other_STDEV;
	rename InfectionCRPOtherRANGELO CRP_Other_LowRange;
	rename InfectionCRPOtherRANGEUP CRP_Other_UpRange;
	rename InfectionCRPOtherMEDIAN CRP_Other_Median;
	rename InfectionCRPOtherIQRQ1 CRP_Other_Q1;
	rename InfectionCRPOtherIQRQ3 CRP_Other_Q3;
	rename InfectionCRPOtherUNIT CRP_Other_Unit;
*		Procalcitonin;
rename InfectionProcalcitoninICUad Procalcitonin_ICU_N;
	rename CK Procalcitonin_ICU_Mean;
	rename CL Procalcitonin_ICU_STDEV;
	rename CM Procalcitonin_ICU_LowRange;
	rename CN Procalcitonin_ICU_UpRange;
	rename CO Procalcitonin_ICU_Median;
	rename CP Procalcitonin_ICU_Q1;
	rename CQ Procalcitonin_ICU_Q3;
	rename CR Procalcitonin_ICU_Unit;
rename InfectionProcalcitoninNonIC Procalcitonin_NonICU_N;
	rename CT Procalcitonin_NonICU_Mean;
	rename CU Procalcitonin_NonICU_STDEV;
	rename CV Procalcitonin_NonICU_LowRange;
	rename CW Procalcitonin_NonICU_UpRange;
	rename CX Procalcitonin_NonICU_Median;
	rename CY Procalcitonin_NonICU_Q1;
	rename CZ Procalcitonin_NonICU_Q3;
	rename DA Procalcitonin_NonICU_Unit;
rename InfectionProcalcitoninHospit Procalcitonin_Hosp_N;
	rename DC Procalcitonin_Hosp_Mean;
	rename DD Procalcitonin_Hosp_STDEV;
	rename DE Procalcitonin_Hosp_LowRange;
	rename DF Procalcitonin_Hosp_UpRange;
	rename DG Procalcitonin_Hosp_Median;
	rename DH Procalcitonin_Hosp_Q1;
	rename DI Procalcitonin_Hosp_Q3;
	rename DJ Procalcitonin_Hosp_Unit;
rename InfectionProcalcitoninNonho Procalcitonin_Nonhosp_N;
	rename DL Procalcitonin_Nonhosp_Mean;
	rename DM Procalcitonin_Nonhosp_STDEV;
	rename DN Procalcitonin_Nonhosp_LowRange;
	rename DO Procalcitonin_Nonhosp_UpRange;
	rename DP Procalcitonin_Nonhosp_Median;
	rename DQ Procalcitonin_Nonhosp_Q1;
	rename DR Procalcitonin_Nonhosp_Q3;
	rename DS Procalcitonin_Nonhosp_Unit;
rename InfectionProcalcitoninIntuba Procalcitonin_Intub_N;
	rename DU Procalcitonin_Intub_Mean;
	rename DV Procalcitonin_Intub_STDEV;
	rename DW Procalcitonin_Intub_LowRange;
	rename InfectionProcalcitoninIntubat Procalcitonin_Intub_UpRange;
	rename DY Procalcitonin_Intub_Median;
	rename DZ Procalcitonin_Intub_Q1;
	rename EA Procalcitonin_Intub_Q3;
	rename EB Procalcitonin_Intub_Unit;
rename InfectionProcalcitoninNonin Procalcitonin_Nonintub_N;
	rename ED Procalcitonin_Nonintub_Mean;
	rename EE Procalcitonin_Nonintub_STDEV;
	rename EF Procalcitonin_Nonintub_LowRange;
	rename InfectionProcalcitoninNonint Procalcitonin_Nonintub_UpRange;
	rename EH Procalcitonin_Nonintub_Median;
	rename EI Procalcitonin_Nonintub_Q1;
	rename EJ Procalcitonin_Nonintub_Q3;
	rename EK Procalcitonin_Nonintub_Unit;
rename InfectionProcalcitoninMortal Procalcitonin_Mortality_N;
	rename EM Procalcitonin_Mortality_Mean;
	rename EN Procalcitonin_Mortality_STDEV;
	rename EO Procalcitonin_Mortality_LowRange;
	rename EP Procalcitonin_Mortality_UpRange;
	rename EQ Procalcitonin_Mortality_Median;
	rename ER Procalcitonin_Mortality_Q1;
	rename ES Procalcitonin_Mortality_Q3;
	rename ET Procalcitonin_Mortality_Unit;
rename InfectionProcalcitoninSurviv Procalcitonin_Survived_N;
	rename EV Procalcitonin_Survived_Mean;
	rename EW Procalcitonin_Survived_STDEV;
	rename EX Procalcitonin_Survived_LowRange;
	rename EY Procalcitonin_Survived_UpRange;
	rename EZ Procalcitonin_Survived_Median;
	rename FA Procalcitonin_Survived_Q1;
	rename FB Procalcitonin_Survived_Q3;
	rename FC Procalcitonin_Survived_Unit;
rename InfectionProcalcitoninReport Procalcitonin_Other;
	rename InfectionProcalcitoninOther Procalcitonin_Other_N;
	rename FF Procalcitonin_Other_Mean;
	rename FG Procalcitonin_Other_STDEV;
	rename FH Procalcitonin_Other_LowRange;
	rename FI Procalcitonin_Other_UpRange;
	rename FJ Procalcitonin_Other_Median;
	rename FK Procalcitonin_Other_Q1;
	rename FL Procalcitonin_Other_Q3;
	rename FM Procalcitonin_Other_Unit;
*		IL-6;
rename InfectionIL6ICUadmission IL6_ICU_N;
	rename FO IL6_ICU_Mean;
	rename FP IL6_ICU_STDEV;
	rename FQ IL6_ICU_LowRange;
	rename FR IL6_ICU_UpRange;
	rename FS IL6_ICU_Median;
	rename FT IL6_ICU_Q1;
	rename FU IL6_ICU_Q3;
	rename FV IL6_ICU_Unit;
rename InfectionIL6NonICUadmissi IL6_NonICU_N;
	rename FX IL6_NonICU_Mean;
	rename FY IL6_NonICU_STDEV;
	rename FZ IL6_NonICU_LowRange;
	rename GA IL6_NonICU_UpRange;
	rename GB IL6_NonICU_Median;
	rename GC IL6_NonICU_Q1;
	rename GD IL6_NonICU_Q3;
	rename InfectionIL6NonICUadmiss IL6_NonICU_Unit;
rename InfectionIL6Hospitalized IL6_Hosp_N;
	rename GG IL6_Hosp_Mean;
	rename GH IL6_Hosp_STDEV;
	rename GI IL6_Hosp_LowRange;
	rename GJ IL6_Hosp_UpRange;
	rename GK IL6_Hosp_Median;
	rename GL IL6_Hosp_Q1;
	rename GM IL6_Hosp_Q3;
	rename GN IL6_Hosp_Unit;
rename InfectionIL6Nonhospitalize IL6_Nonhosp_N;
	rename GP IL6_Nonhosp_Mean;
	rename GQ IL6_Nonhosp_STDEV;
	rename GR IL6_Nonhosp_LowRange;
	rename GS IL6_Nonhosp_UpRange;
	rename GT IL6_Nonhosp_Median;
	rename GU IL6_Nonhosp_Q1;
	rename GV IL6_Nonhosp_Q3;
	rename GW IL6_Nonhosp_Unit;
rename InfectionIL6IntubatedNum IL6_Intub_N;
	rename InfectionIL6IntubatedMEA IL6_Intub_Mean;
	rename InfectionIL6IntubatedSTD IL6_Intub_STDEV;
	rename InfectionIL6IntubatedRAN IL6_Intub_LowRange;
	rename HB IL6_Intub_UpRange;
	rename InfectionIL6IntubatedMED IL6_Intub_Median;
	rename InfectionIL6IntubatedIQR IL6_Intub_Q1;
	rename HE IL6_Intub_Q3;
	rename InfectionIL6IntubatedUNI IL6_Intub_Unit;
rename InfectionIL6Nonintubated IL6_Nonintub_N;
	rename HH IL6_Nonintub_Mean;
	rename HI IL6_Nonintub_STDEV;
	rename HJ IL6_Nonintub_LowRange;
	rename HK IL6_Nonintub_UpRange;
	rename HL IL6_Nonintub_Median;
	rename HM IL6_Nonintub_Q1;
	rename HN IL6_Nonintub_Q3;
	rename HO IL6_Nonintub_Unit;
rename InfectionIL6MortalityNum IL6_Mortality_N;
	rename InfectionIL6MortalityMEA IL6_Mortality_Mean;
	rename InfectionIL6MortalitySTD IL6_Mortality_STDEV;
	rename InfectionIL6MortalityRAN IL6_Mortality_LowRange;
	rename HT IL6_Mortality_UpRange;
	rename InfectionIL6MortalityMED IL6_Mortality_Median;
	rename InfectionIL6MortalityIQR IL6_Mortality_Q1;
	rename HW IL6_Mortality_Q3;
	rename InfectionIL6MortalityUNI IL6_Mortality_Unit;
rename InfectionIL6SurvivedNumb IL6_Survived_N;
	rename InfectionIL6SurvivedMEAN IL6_Survived_Mean;
	rename InfectionIL6SurvivedSTDE IL6_Survived_STDEV;
	rename InfectionIL6SurvivedRANG IL6_Survived_LowRange;
	rename IC IL6_Survived_UpRange;
	rename InfectionIL6SurvivedMEDI IL6_Survived_Median;
	rename InfectionIL6SurvivedIQR IL6_Survived_Q1;
	rename IF IL6_Survived_Q3;
	rename InfectionIL6SurvivedUNIT IL6_Survived_Unit;
rename InfectionIL6Reportedforot IL6_Other;
	rename InfectionIL6OtherNumber IL6_Other_N;
	rename InfectionIL6OtherMEAN IL6_Other_Mean;
	rename InfectionIL6OtherSTDEV IL6_Other_STDEV;
	rename InfectionIL6OtherRANGEL IL6_Other_LowRage;
	rename InfectionIL6OtherRANGEU IL6_Other_UpRange;
	rename InfectionIL6OtherMEDIAN IL6_Other_Median;
	rename InfectionIL6OtherIQRQ1 IL6_Other_Q1;
	rename InfectionIL6OtherIQRQ3 IL6_Other_Q3;
	rename InfectionIL6OtherUNIT IL6_Other_Unit;
*		CD4;
rename InfectionCD4ICUadmission CD4_ICU_Value;
	rename IS CD4_ICU_Mean;
	rename IT CD4_ICU_STDEV;
	rename IU CD4_ICU_LowRange;
	rename IV CD4_ICU_UpRange;
	rename IW CD4_ICU_Median;
	rename IX CD4_ICU_Q1;
	rename IY CD4_ICU_Q3;
	rename IZ CD4_ICU_Unit;
rename InfectionCD4NonICUadmissi CD4_NonICU_Value;
	rename JB CD4_NonICU_Mean;
	rename InfectionCD4NonICUadmiss CD4_NonICU_STDEV;
	rename JD CD4_NonICU_LowRange;
	rename JE CD4_NonICU_UpRange;
	rename JF CD4_NonICU_Median;
	rename JG CD4_NonICU_Q1;
	rename JH CD4_NonICU_Q3;
	rename JI CD4_NonICU_Unit;
rename InfectionCD4Hospitalized CD4_Hosp_Value;
	rename JK CD4_Hosp_Mean;
	rename JL CD4_Hosp_STDEV;
	rename JM CD4_Hosp_LowRange;
	rename JN CD4_Hosp_UpRange;
	rename JO CD4_Hosp_Median;
	rename JP CD4_Hosp_Q1;
	rename JQ CD4_Hosp_Q3;
	rename JR CD4_Hosp_Unit;
rename InfectionCD4Nonhospitalize CD4_Nonhosp_Value;
	rename JT CD4_Nonhosp_Mean;
	rename JU CD4_Nonhosp_STDEV;
	rename JV CD4_Nonhosp_LowRange;
	rename JW CD4_Nonhosp_UpRange;
	rename JX CD4_Nonhosp_Median;
	rename JY CD4_Nonhosp_Q1;
	rename JZ CD4_Nonhosp_Q3;
	rename KA CD4_Nonhosp_Unit;
rename InfectionCD4IntubatedVAL CD4_Intub_Value;
	rename InfectionCD4IntubatedMEA CD4_Intub_Mean;
	rename InfectionCD4IntubatedSTD CD4_Intub_STDEV;
	rename InfectionCD4IntubatedRAN CD4_Intub_LowRange;
	rename KF CD4_Intub_UpRange;
	rename InfectionCD4IntubatedMED CD4_Intub_Median;
	rename InfectionCD4IntubatedIQR CD4_Intub_Q1;
	rename KI CD4_Intub_Q3;
	rename InfectionCD4IntubatedUNI CD4_Intub_Unit;
rename InfectionCD4Nonintubated CD4_Nonintub_Value;
	rename KL CD4_Nonintub_Mean;
	rename KM CD4_Nonintub_STDEV;
	rename KN CD4_Nonintub_LowRange;
	rename KO CD4_Nonintub_UpRange;
	rename KP CD4_Nonintub_Median;
	rename KQ CD4_Nonintub_Q1;
	rename KR CD4_Nonintub_Q3;
	rename KS CD4_Nonintub_Unit;
rename InfectionCD4MortalityVAL CD4_Mortality_Value;
	rename InfectionCD4MortalityMEA CD4_Mortality_Mean;
	rename InfectionCD4MortalitySTD CD4_Mortality_STDEV;
	rename InfectionCD4MortalityRAN CD4_Mortality_LowRange;
	rename KX CD4_Mortality_UpRange;
	rename InfectionCD4MortalityMED CD4_Mortality_Median;
	rename InfectionCD4MortalityIQR CD4_Mortality_Q1;
	rename LA CD4_Mortality_Q3;
	rename InfectionCD4MortalityUNI CD4_Mortality_Unit;
rename InfectionCD4SurvivedVALU CD4_Survived_Value;
	rename InfectionCD4SurvivedMEAN CD4_Survived_Mean;
	rename InfectionCD4SurvivedSTDE CD4_Survived_STDEV;
	rename InfectionCD4SurvivedRANG CD4_Survived_LowRange;
	rename LG CD4_Survived_UpRange;
	rename InfectionCD4SurvivedMEDI CD4_Survived_Median;
	rename InfectionCD4SurvivedIQR CD4_Survived_Q1;
	rename LJ CD4_Survived_Q3;
	rename InfectionCD4SurvivedUNIT CD4_Survived_Unit;
rename InfectionCD4Reportedforot CD4_Other;
	rename InfectionCD4OtherVALUE CD4_Other_Value;
	rename InfectionCD4OtherMEAN CD4_Other_Mean;
	rename InfectionCD4OtherSTDEV CD4_Other_STDEV;
	rename InfectionCD4OtherRANGEL CD4_Other_LowRange;
	rename InfectionCD4OtherRANGEU CD4_Other_UpRange;
	rename InfectionCD4OtherMEDIAN CD4_Other_Median;
	rename InfectionCD4OtherIQRQ1 CD4_Other_Q1;
	rename InfectionCD4OtherIQRQ3 CD4_Other_Q3;
	rename InfectionCD4OtherUNIT CD4_Other_Unit;
*		Viral load;
rename InfectionViralLoadICUadmis ViralLoad_ICU_N;
	rename LW ViralLoad_ICU_Mean;
	rename LX ViralLoad_ICU_STDEV;
	rename LY ViralLoad_ICU_LowRange;
	rename LZ ViralLoad_ICU_UpRange;
	rename MA ViralLoad_ICU_Median;
	rename MB ViralLoad_ICU_Q1;
	rename MC ViralLoad_ICU_Q3;
	rename MD ViralLoad_ICU_Unit;
rename InfectionViralLoadNonICUa ViralLoad_NonICU_N;
	rename MF ViralLoad_NonICU_Mean;
	rename MG ViralLoad_NonICU_STDEV;
	rename MH ViralLoad_NonICU_LoWRange;
	rename MI ViralLoad_NonICU_UpRange;
	rename MJ ViralLoad_NonICU_Median;
	rename MK ViralLoad_NonICU_Q1;
	rename ML ViralLoad_NonICU_Q3;
	rename MM ViralLoad_NonICU_Unit;
rename InfectionViralLoadHospitali ViralLoad_Hosp_N;
	rename MO ViralLoad_Hosp_Mean;
	rename MP ViralLoad_Hosp_STDEV;
	rename MQ ViralLoad_Hosp_LowRange;
	rename MR ViralLoad_Hosp_UpRange;
	rename MS ViralLoad_Hosp_Median;
	rename MT ViralLoad_Hosp_Q1;
	rename MU ViralLoad_Hosp_Q3;
	rename MV ViralLoad_Hosp_Unit;
rename InfectionViralLoadNonhospi ViralLoad_Nonhosp_N;
	rename MX ViralLoad_Nonhosp_Mean;
	rename MY ViralLoad_Nonhosp_STDEV;
	rename MZ ViralLoad_Nonhosp_LowRange;
	rename NA ViralLoad_Nonhosp_UpRange;
	rename NB ViralLoad_Nonhosp_Median;
	rename NC ViralLoad_Nonhosp_Q1;
	rename ND ViralLoad_Nonhosp_Q3;
	rename NE ViralLoad_Nonhosp_Unit;
rename InfectionViralLoadIntubated ViralLoad_Intub_N;
	rename NG ViralLoad_Intub_Mean;
	rename NH ViralLoad_Intub_STDEV;
	rename NI ViralLoad_Intub_LowRange;
	rename NJ ViralLoad_Intub_UpRange;
	rename NK ViralLoad_Intub_Median;
	rename NL ViralLoad_Intub_Q1;
	rename NM ViralLoad_Intub_Q3;
	rename NN ViralLoad_Intub_Unit;
rename InfectionViralLoadNonintub ViralLoad_Nonintub_N;
	rename NP ViralLoad_Nonintub_Mean;
	rename NQ ViralLoad_Nonintub_STDEV;
	rename NR ViralLoad_Nonintub_LowRange;
	rename NS ViralLoad_Nonintub_UpRange;
	rename NT ViralLoad_Nonintub_Median;
	rename NU ViralLoad_Nonintub_Q1;
	rename NV ViralLoad_Nonintub_Q3;
	rename NW ViralLoad_Nonintub_Unit;
rename InfectionViralLoadMortality ViralLoad_Mortality_N;
	rename NY ViralLoad_Mortality_Mean;
	rename NZ ViralLoad_Mortality_STDEV;
	rename OA ViralLoad_Mortality_LowRange;
	rename OB ViralLoad_Mortality_UpRange;
	rename OC ViralLoad_Mortality_Median;
	rename OD ViralLoad_Mortality_Q1;
	rename OE ViralLoad_Mortality_Q3;
	rename OF ViralLoad_Mortality_Unit;
rename InfectionViralLoadSurvived ViralLoad_Survived_N;
	rename OH ViralLoad_Survived_Mean;
	rename OI ViralLoad_Survived_STDEV;
	rename OJ ViralLoad_Survived_LowRange;
	rename OK ViralLoad_Survived_UpRange;
	rename OL ViralLoad_Survived_Median;
	rename OM ViralLoad_Survived_Q1;
	rename ON ViralLoad_Survived_Q3;
	rename OO ViralLoad_Survived_Unit;
rename InfectionViralLoadReported ViralLoad_Other;
	rename InfectionViralLoadOtherN ViralLoad_Other_N;
	rename InfectionViralLoadOtherM ViralLoad_Other_Mean;
	rename InfectionViralLoadOtherS ViralLoad_Other_STDEV;
	rename InfectionViralLoadOtherR ViralLoad_Other_LowRange;
	rename OU ViralLoad_Other_UpRange;
	rename OV ViralLoad_Other_Median;
	rename InfectionViralLoadOtherI ViralLoad_Other_Q1;
	rename OX ViralLoad_Other_Q3;
	rename InfectionViralLoadOtherU ViralLoad_Other_Unit;

	
	
*	Edit data;
replace Procalcitonin_Mortality_Mean="3.650" if Procalcitonin_Mortality_Mean=="3650";
replace Procalcitonin_Mortality_STDEV="13.398" if Procalcitonin_Mortality_STDEV=="13398";
replace CRP_Mortality_Mean="107.259" if CRP_Mortality_Mean=="107259";
replace CRP_Mortality_STDEV="117.215" if CRP_Mortality_STDEV=="117215";
*		Procalcitonin;
replace Procalcitonin_ICU_N="27" if Procalcitonin_ICU_N=="27 / 36";
	replace Procalcitonin_ICU_Unit="ng/mL" if Procalcitonin_ICU_Unit=="≥0.05 ng/mL";
replace Procalcitonin_NonICU_N="22" if Procalcitonin_NonICU_N=="22 / 102";
	replace Procalcitonin_NonICU_Unit="ng/mL" if Procalcitonin_NonICU_Unit=="≥0.05 ng/mL";


	
	
*	Destring data ;
quietly ds Timestamp Zotero Reporttitle *Unit, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="unclear" | `v'=="unlcear" |
		`v'=="";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Standardize units;
foreach v of varlist *Unit {;
replace `v'="pg/mL" if `v' == "pg/ml";
	replace `v'="mg/L" if `v'=="mg/l" | `v'=="mg/ L";
	replace `v'="mg/dL" if `v'=="mg/dl" | `v'=="mg/ dL";
	replace `v'="ng/mL" if `v'=="ng/ml" | `v'=="ng/ mL";
	replace `v'="." if `v'=="NA";
	replace `v'="µg/L" if `v'=="mcg/L" | `v'=="ug/L" | `v'=="μg/L" | `v'=="μg/L";
	replace `v'="/µL" if `v'=="/µl" | `v'=="cell/µl" | `v'=="cells/μL" |
		`v'=="1/µL" | `v'=="1/ µL" | `v'=="/ul" | `v'=="µl" | `v'=="per µl";
	replace `v'="mg/dL" if `v'=="mg/dl (?)";
	replace `v'="." if `v'=="#" | `v' =="##" | `v'=="";
};

	

	
*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-ViralLoad_Intub_N;
duplicates drop Zoterokey-ViralLoad_Intub_N, force;


*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";


*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & CRP_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & CRP_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & CRP_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & CRP_Mortality_N==14;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Z=="VN52PHAB" & CRP_Survived_Q1==7.5; //validation cohort





*	Unit conversion;
codebook *_Unit;


*********
***CRP***
*********;


*		CRP - ICU;
replace CRP_ICU_Unit="mg/L" if CRP_ICU_Unit=="mg/dL" & CRP_ICU_Q3==104.5;

foreach v of varlist CRP_ICU_Mean-CRP_ICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if CRP_ICU_Unit == "mg/dL";
	};
	else {;
		replace `v' = "mg/L" if CRP_ICU_Unit == "mg/dL";
	};
};



*		CRP - Non ICU;
foreach v of varlist CRP_NonICU_Mean-CRP_NonICU_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if CRP_NonICU_Unit == "mg/dL";
	};
	else {;
		replace `v' = "mg/L" if CRP_NonICU_Unit == "mg/dL";
	};
};



*		CRP - Hospitalized;
foreach v of varlist CRP_Hosp_Mean-CRP_Hosp_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if CRP_Hosp_Unit == "mg/dL";
	};
	else {;
		replace `v' = "mg/L" if CRP_Hosp_Unit == "mg/dL";
	};
};



*		CRP - Mortality;
foreach v of varlist CRP_Mortality_Mean-CRP_Mortality_STDEV CRP_Mortality_UpRange-CRP_Mortality_Unit{; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if CRP_Mortality_Unit == "mg/dL";
		replace `v' = `v'*10^(3) if CRP_Mortality_Unit =="g/L";
		replace `v' = `v'*10^(-3) if CRP_Mortality_Unit == "ng/mL";
	};
	else {;
		replace `v' = "mg/L" if CRP_Mortality_Unit == "mg/dL";
		replace `v' = "mg/L" if CRP_Mortality_Unit == "g/L";
		replace `v' = "mg/L" if CRP_Mortality_Unit =="ng/mL";
	};
};



*		CRP - Survived;
foreach v of varlist CRP_Survived_Mean-CRP_Survived_STDEV CRP_Survived_UpRange-CRP_Survived_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10 if CRP_Survived_Unit == "mg/dL";
		replace `v' = `v'*10^(3) if CRP_Survived_Unit =="g/L";
		replace `v' = `v'*10^(-3) if CRP_Survived_Unit == "ng/mL";
	};
	else {;
		replace `v' = "mg/L" if CRP_Survived_Unit == "mg/dL";
		replace `v' = "mg/L" if CRP_Survived_Unit == "g/L";
		replace `v' = "mg/L" if CRP_Survived_Unit =="ng/mL";
	};
};




*******************
***Procalcitonin***
*******************

*		Procalcitonin - ICU;
replace Procalcitonin_ICU_Unit="ng/mL" if Procalcitonin_ICU_Unit=="μg/L"; //ng/mL = ug/L



*		Procalcitonin - Non ICU;
replace Procalcitonin_NonICU_Unit="ng/mL" if Procalcitonin_NonICU_Unit=="μg/L"; //ng/mL = ug/L



*		Procalcitonin - Hospitalized;
replace Procalcitonin_Hosp_Unit="ng/mL" if Procalcitonin_Hosp_Unit=="µg/L"; //µg/L=ng/mL



*		Procalcitonin - Non Hospitalized;
replace Procalcitonin_Nonhosp_Unit="ng/mL" if Procalcitonin_Nonhosp_Unit=="µg/L"; //µg/L=ng/mL



*		Procalcitonin - Intubated;
replace Procalcitonin_Intub_Unit="ng/mL" if Procalcitonin_Intub_Unit=="µg/L"; //µg/L=ng/mL



*		Procalcitonin - Non Intubated;
replace Procalcitonin_Nonintub_Unit="ng/mL" if Procalcitonin_Nonintub_Unit=="µg/L"; //µg/L=ng/mL



*		Procalcitonin - Mortality;
replace Procalcitonin_Mortality_Unit="ng/mL" if Procalcitonin_Mortality_Unit=="µg/L"; //µg/L=ng/mL
replace Procalcitonin_Mortality_Unit="ng/mL" if Zotero=="BJEBXVJ2"; //didnt convert



*		Procalcitonin - Survived;
replace Procalcitonin_Survived_Unit="ng/mL" if Procalcitonin_Survived_Unit=="µg/L"; //µg/L=ng/mL
replace Procalcitonin_Survived_Unit="ng/mL" if Zotero=="BJEBXVJ2"; //didn't convert



**********
***IL-6***
**********


*		IL6 - Mortality;
foreach v of varlist IL6_Mortality_Mean-IL6_Mortality_STDEV IL6_Mortality_UpRange-IL6_Mortality_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if IL6_Mortality_Unit =="ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if IL6_Mortality_Unit == "ng/mL";
	};
};



*		IL6 - Survived;
foreach v of varlist IL6_Survived_Mean-IL6_Survived_STDEV IL6_Survived_UpRange-IL6_Survived_Unit {; /*****************************************************************/
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if IL6_Survived_Unit =="ng/mL";
	};
	else {;
		replace `v' = "pg/mL" if IL6_Survived_Unit =="ng/mL";
	};
};



*********
***CD4***
*********


*		CD4 - Mortality;
foreach v of varlist CD4_Mortality_Mean-CD4_Mortality_Unit {;
	capture confirm numeric variable `v';
	if !_rc {;
		replace `v' = `v'*10^(3) if CD4_Mortality_Unit =="10^9/L";
	};
	else {;
		replace `v' = "/µL" if CD4_Mortality_Unit == "10^9/L";
	};
};





codebook *_Unit;





*******************************************************************************;

save "02 Infections/COVIDSR_Infections_CLEAN_20200922 - data", replace;

export delimited using "02 Infections\COVIDSR_Infections_CSV.csv", replace;



capture log close;
































