***************************** STATA Housekeeping *******************************
capture log close
clear all
macro drop all
set more off, permanently
version 16.1


/*******************************************************************************
Author: Alexandra Zimmer
Date: September 22, 2020
Project: Systematic review of clinical & lab indicators that predict hospitalization
ICU, intubation and mortality in COVID-19 patients

Clinical - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Comorbidities_Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("CoMorbidities") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Reporttitle Nameofperson;



*	Recode data as numeric;
foreach v of varlist HypertensionICUadmissionN-ECMONonIntubatedNumberof {;
	capture confirm string variable `v';
	if !_rc {;
		replace `v' = "." if `v' == "NA";
		replace `v' = "." if `v' == "not specified";
		replace `v' = "." if `v'=="#" | `v' =="##" | `v'=="";
	destring `v', replace dpcomma;
	};
};




*	Rename variables;
*		Hypertension;
rename HypertensionICUadmissionN Hypertension_ICU_N;
rename HypertensionNonICUadmission Hypertension_NonICU_N;
rename HypertensionHospitalizedNu Hypertension_Hosp_N;
rename HypertensionNonhospitalized Hypertension_Nonhosp_N;
rename HypertensionIntubatedNumbe Hypertension_Intub_N;
rename HypertensionNonintubatedN Hypertension_Nonintub_N;
rename HypertensionMortalityNumbe Hypertension_Mortality_N;
rename HypertensionSurvivedNumber Hypertension_Survived_N;
drop HypertensionotherNumberof;
*		Cardiomyopathy;
rename CardiomyopathyICUadmission Cardiomyopathy_ICU_N;
rename CardiomyopathyNonICUadmissi Cardiomyopathy_NonICU_N;
rename CardiomyopathyHospitalized Cardiomyopathy_Hosp_N;
rename CardiomyopathyNonhospitalize Cardiomyopathy_Nonhosp_N;
rename CardiomyopathyIntubatedNum Cardiomyopathy_Intub_N;
rename CardiomyopathyNonintubated Cardiomyopathy_Nonintub_N;
rename CardiomyopathyMortalityNum Cardiomyopathy_Mortality_N;
rename CardiomyopathySurvivedNumb Cardiomyopathy_Survived_N;
*		Cardiovascular disease (CVD);
rename CardiovasculardiseaseICUadm CVD_ICU_N;
rename CardiovasculardiseaseNonICU CVD_NonICU_N;
rename CardiovasculardiseaseHospita CVD_Hosp_N;
rename CardiovasculardiseaseNonhos CVD_Nonhosp_N;
rename CardiovasculardiseaseIntubat CVD_Intub_N;
rename CardiovasculardiseaseNonint CVD_Nonintub_N;
rename CardiovasculardiseaseMortali CVD_Mortality_N;
rename CardiovasculardiseaseSurvive CVD_Survived_N;
rename CardiomyopathyotherNumber CVD_Other_N;
drop Cardiovasculardiseaseother;
*		Cerebrovascular disease;
rename CerebrovasculardiseaseICUad CerebroVD_ICU_N;
rename CerebrovasculardiseaseNonIC CerebroVD_NonICU_N;
rename CerebrovasculardiseaseHospit CerebroVD_Hosp_N;
rename CerebrovasculardiseaseNonho CerebroVD_Nonhosp_N;
rename CerebrovasculardiseaseIntuba CerebroVD_Intub_N;
rename CerebrovasculardiseaseNonin CerebroVD_Nonintub_N;
rename CerebrovasculardiseaseMortal CerebroVD_Mortality_N;
rename CerebrovasculardiseaseSurviv CerebroVD_Survived_N;
drop Cerebrovasculardiseaseother;
*		Preventable Pneumonia;
rename PrevPneumoniaICUadmission PrevPneum_ICU_N;
rename PrevPneumoniaNonICUadmiss PrevPneum_NonICU_N;
rename PrevPneumoniaHospitalized PrevPneum_Hosp_N;
rename PrevPneumoniaNonhospitaliz PrevPneum_Nonhosp_N;
rename PrevPneumoniaIntubatedNu PrevPneum_Intub_N;
rename PrevPneumoniaNonintubated PrevPneum_Nonintub_N;
rename PrevPneumoniaMortalityNu PrevPneum_Mortality_N;
rename PrevPneumoniaSurvivedNum PrevPneum_Survived_N;
drop PrevPneumoniaotherNumber;
*		COPD;
rename COPDICUadmissionNumberof COPD_ICU_N;
rename COPDNonICUadmissionNumbe COPD_NonICU_N;
rename COPDHospitalizedNumberof COPD_Hosp_N;
rename COPDNonhospitalizedNumber COPD_Nonhosp_N;
rename COPDIntubatedNumberofcas COPD_Intub_N;
rename COPDNonintubatedNumberof COPD_Nonintub_N;
rename COPDMortalityNumberofcas COPD_Mortality_N;
rename COPDSurvivedNumberofcase COPD_Survived_N;
drop COPDotherNumberofcases;
*		Asthma;
rename AsthmaICUadmissionNumber Asthma_ICU_N;
rename AsthmaNonICUadmissionNum Asthma_NonICU_N;
rename AsthmaHospitalizedNumbero Asthma_Hosp_N;
rename AsthmaNonhospitalizedNumb Asthma_Nonhosp_N;
rename AsthmaIntubatedNumberofc Asthma_Intub_N;
rename AsthmaNonintubatedNumber Asthma_Nonintub_N;
rename AsthmaMortalityNumberofc Asthma_Mortality_N;
rename AsthmaSurvivedNumberofca Asthma_Survived_N;
drop AsthmaotherNumberofcases;
*		Chronic/any lung disease;
rename ChronicanylungdiseaseICU ChronicLung_ICU_N;
rename ChronicanylungdiseaseNon ChronicLung_NonICU_N;
rename ChronicanylungdiseaseHos ChronicLung_Hosp_N;
rename BT ChronicLung_Nonhosp_N;
rename ChronicanylungdiseaseInt ChronicLung_Intub_N;
rename BV ChronicLung_Nonintub_N;
rename ChronicanylungdiseaseMor ChronicLung_Mortality_N;
rename ChronicanylungdiseaseSur ChronicLung_Survived_N;
drop Chronicanylungdiseaseoth;
*		Diabetes;
rename DiabetesICUadmissionNumbe Diabetes_ICU_N;
rename DiabetesNonICUadmissionN Diabetes_NonICU_N;
rename DiabetesHospitalizedNumber Diabetes_Hosp_N;
rename DiabetesNonhospitalizedNu Diabetes_Nonhosp_N;
rename DiabetesIntubatedNumberof Diabetes_Intub_N;
rename DiabetesNonintubatedNumbe Diabetes_Nonintub_N;
rename DiabetesMortalityNumberof Diabetes_Mortality_N;
rename DiabetesSurvivedNumberof Diabetes_Survived_N;
drop DiabetesotherNumberofcas;
*		Acute kidney injury;
rename acuteKidneyInjuryICUadmi KidneyInj_ICU_N;
rename acuteKidneyInjuryNonICU KidneyInj_NonICU_N;
rename acuteKidneyInjuryHospital KidneyInj_Hosp_N;
rename acuteKidneyInjuryNonhosp KidneyInj_Nonhosp_N;
rename acuteKidneyInjuryIntubate KidneyInj_Intub_N;
rename acuteKidneyInjuryNonintu KidneyInj_Nonintub_N;
rename acuteKidneyInjuryMortalit KidneyInj_Mortality_N;
rename acuteKidneyInjurySurvived KidneyInj_Survived_N;
drop acuteKidneyInjuryother;
*		Chronic kidney disease;
rename ChronicKidneydiseaseICUadm KidneyDis_ICU_N;
rename ChronicKidneydiseaseNonICU KidneyDis_NonICU_N;
rename ChronicKidneydiseaseHospita KidneyDis_Hosp_N;
rename ChronicKidneydiseaseNonhos KidneyDis_Nonhosp_N;
rename ChronicKidneydiseaseIntubat KidneyDis_Intub_N;
rename ChronicKidneydiseaseNonint KidneyDis_Nonintub_N;
rename ChronicKidneydiseaseMortali KidneyDis_Mortality_N;
rename ChronicKidneydiseaseSurvive KidneyDis_Survived_N;
drop ChronicKidneydiseaseother;
*		Smoker;
rename SmokerICUadmissionNumber Smoke_ICU_N;
rename SmokerNonICUadmissionNum Smoke_NonICU_N;
rename SmokerHospitalizedNumbero Smoke_Hosp_N;
rename SmokerIntubatedNumberofc Smoke_Intub_N;
rename SmokerNonintubatedNumber Smoke_Nonintub_N;
rename SmokerNonhospitalizedNumb Smoke_Nonhosp_N;
rename SmokerMortalityNumberofc Smoke_Mortality_N;
rename SmokerSurvivedNumberofca Smoke_Survived_N;
drop SmokerotherNumberofcases;
*		Cancer;
rename CancerICUadmission Cancer_ICU_N;
rename CancerNonICUadmission Cancer_NonICU_N;
rename CancerHospitalized Cancer_Hosp_N;
rename CancerNonhospitalized Cancer_Nonhosp_N;
rename CancerIntubated Cancer_Intub_N;
rename CancerNonintubated Cancer_Nonintub_N;
rename CancerMortality Cancer_Mortality_N;
rename CancerSurvived Cancer_Survived_N;
drop Cancerother;
*		Chronic liver disease;
rename ChronicLiverdiseaseICUadmi LiverDis_ICU_N;
rename ChronicLiverdiseaseNonICU LiverDis_NonICU_N;
rename ChronicLiverdiseaseHospital LiverDis_Hosp_N;
rename ChronicLiverdiseaseNonhosp LiverDis_Nonhosp_N;
rename ChronicLiverdiseaseIntubate LiverDis_Intub_N;
rename ChronicLiverdiseaseNonintu LiverDis_Nonintub_N;
rename ChronicLiverdiseaseMortalit LiverDis_Mortality_N;
rename ChronicLiverdiseaseSurvived LiverDis_Survived_N;
drop ChronicLiverdiseaseother;
*		Digestive system disease;
rename DigestivesystemdiseaseICUa DigestiveDis_ICU_N;
rename DigestivesystemdiseaseNonI DigestiveDis_NonICU_N;
rename DigestivesystemdiseaseHospi DigestiveDis_Hosp_N;
rename DigestivesystemdiseaseNonh DigestiveDis_Nonhosp_N;
rename DigestivesystemdiseaseIntub DigestiveDis_Intub_N;
rename DigestivesystemdiseaseNoni DigestiveDis_Nonintub_N;
rename DigestivesystemdiseaseMorta DigestiveDis_Mortality_N;
rename DigestivesystemdiseaseSurvi DigestiveDis_Survived_N;
drop Digestivesystemdiseaseother;
*		Nervous system disease;
rename NervoussystemdiseaseICUadm NervousSys_ICU_N;
rename NervoussystemdiseaseNonICU NervousSys_NonICU_N;
rename NervoussystemdiseaseHospita NervousSys_Hosp_N;
rename NervoussystemdiseaseNonhos NervousSys_Nonhosp_N;
rename NervoussystemdiseaseIntubat NervousSys_Intub_N;
rename NervoussystemdiseaseNonint NervousSys_Nonintub_N;
rename NervoussystemdiseaseMortali NervousSys_Mortality_N;
rename NervoussystemdiseaseSurvive NervousSys_Survived_N; 
drop ES;
drop Nervoussystemdiseaseother;
*		Immunodeficiency chemotherapy, hematologic malignancy;
rename ImmunodeficiencyChemotherapyh ImmunoChemo_ICU_N;
rename EV ImmunoChemo_NonICU_N;
rename EW ImmunoChemo_Hosp_N;
rename EX ImmunoChemo_Nonhosp_N;
rename EY ImmunoChemo_Intub_N;
rename EZ ImmunoChemo_Nonintub_N;
rename FA ImmunoChemo_Mortality_N;
rename FB ImmunoChemo_Survived_N;
drop FC;
*		Immunodeficiency biologics;
rename ImmunodeficiencyBiologicsI ImmunoBio_ICU_N;
rename ImmunodeficiencyBiologicsN ImmunoBio_NonICU_N;
rename ImmunodeficiencyBiologicsH ImmunoBio_Hosp_N;
rename FG ImmunoBio_Nonhosp_N;
rename FH ImmunoBio_Intub_N;
rename FI ImmunoBio_Nonintub_N;
rename ImmunodeficiencyBiologicsM ImmunoBio_Mortality_N;
rename ImmunodeficiencyBiologicsS ImmunoBio_Survived_N;
drop ImmunodeficiencyBiologicso;
*		Tuberculosis;
rename TuberculosisICUadmission TB_ICU_N;
rename TuberculosisNonICUadmissio TB_NonICU_N;
rename TuberculosisHospitalizedN TB_Hosp_N;
rename TuberculosisNonhospitalized TB_Nonhosp_N;
rename TuberculosisIntubatedNumb TB_Intub_N;
rename TuberculosisNonintubated TB_Nonintub_N;
rename TuberculosisMortalityNumb TB_Mortality_N;
rename TuberculosisSurvivedNumbe TB_Survived_N;
drop TuberculosisotherNumbero;
*		NIV;
rename NIVICUadmissionNumberof NIV_ICU_N;
rename NIVNonICUadmissionNumber NIV_NonICU_N;
rename NIVHospitalizedNumberofc NIV_Hosp_N;
rename NIVNonhospitalizedNumber NIV_Nonhosp_N;
rename NIVIntubatedNumberofcase NIV_Intub_N;
rename NIVNonintubatedNumberof NIV_Nonintub_N;
rename NIVSurvivedNumberofcases NIV_Survived_N;
rename NIVotherNumberofcases NIV_Mortality_N;
*		ECMO;
rename ECMOMortalityType ECMO_Mortality_Type;
rename ECMOMortalityNumberofcase ECMO_Mortality_N;
rename ECMOSurvivedType ECMO_Survived_Type;
rename ECMOSurvivedNumberofcase ECMO_Survived_N;
rename ECMOHospitalizedType ECMO_Hosp_Type;
rename ECMONonHospitalizedType ECMO_Nonhosp_Type;
rename ECMOICUadmissionType ECMO_ICU_Type;
rename ECMONonICUadmissionType ECMO_NonICU_Type;
rename ECMOIntubatedType ECMO_Intub_Type;
rename ECMONonIntubatedType ECMO_Nonintub_Type;
rename ECMOHospitalizedNumberof ECMO_Hosp_N;
rename ECMONonHospitalizedNumber ECMO_Nonhosp_N;
rename ECMOICUadmissionNumberof ECMO_ICU_N;
rename ECMONonICUadmissionNumbe ECMO_NonICU_N;
rename ECMOIntubatedNumberofcas ECMO_Intub_N;
rename ECMONonIntubatedNumberof ECMO_Nonintub_N;
*		ARDS;
drop ARDSMortalityNumberofcas; //too many inconsistent values 
*		Renal replacement therapy;
rename RenalReplacementTherapyMort RenalReplace_Mortality_Type;
rename GJ RenalReplace_Mortality_N;
rename RenalReplacementTherapySurv RenalReplace_Survived_Type;
rename GL RenalReplace_Survived_N;
rename RenalReplacementTherapyHosp RenalReplace_Hosp_Type;
rename GN RenalReplace_Hosp_N;
rename RenalReplacementTherapyNon RenalReplace_Nonhosp_Type;
rename GP RenalReplace_Nonhosp_N;
rename RenalReplacementTherapyICU RenalReplace_ICU_Type;
rename GR RenalReplace_ICU_N;
rename GS RenalReplace_NonICU_Type;
rename GT RenalReplace_NonICU_N;
rename RenalReplacementTherapyIntu RenalReplace_Intub_Type;
rename GV RenalReplace_Intub_N;
rename GW RenalReplace_Nonintub_Type;
rename GX RenalReplace_Nonintub_N;



*	Drop duplicate entries;
tab Zotero;
duplicates report Zoterokey-ECMO_Nonintub_N;
duplicates drop Zoterokey-ECMO_Nonintub_N, force;


*	Data;
*		Kidney injury;
replace KidneyInj_Mortality_N="12" if KidneyInj_Mortality_N=="12/38";
	destring KidneyInj_Mortality_N, replace;
replace KidneyInj_Survived_N="1" if KidneyInj_Survived_N=="1/161";
	destring KidneyInj_Survived_N, replace;
*		Cancers;
replace Cancer_ICU_N="." if Cancer_ICU_N=="NA - NA- 0";
	replace Cancer_ICU_N="1" if Cancer_ICU_N=="NA - NA - 1#";
	replace Cancer_ICU_N="4" if Cancer_ICU_N=="NA - NA - 4";
	replace Cancer_ICU_N="5" if Cancer_ICU_N=="NA-NA-5";
	replace Cancer_ICU_N="6" if Cancer_ICU_N==`""NA" 6"';
	replace Cancer_ICU_N="17" if Cancer_ICU_N=="cancer - active - 17";
	replace Cancer_ICU_N="18" if Cancer_ICU_N=="NA-NA-18";
	replace Cancer_ICU_N="1" if Cancer_ICU_N==`""NA" - "NA" - "1""';
	replace Cancer_ICU_N="2" if Z=="G2H4UH3K";
	replace Cancer_ICU_N="." if Cancer_ICU_N==`""NA" - "NA" - "0""';
	replace Cancer_ICU_N="3" if Cancer_ICU_N==`""NA" - "NA" - "3""';
	replace Cancer_ICU_N="1" if Cancer_ICU_N=="#-#-1";
destring Cancer_ICU_N, replace;
replace Cancer_ICU_N=. if Cancer_ICU_N==0;

replace Cancer_NonICU_N="1" if Cancer_NonICU_N=="NA - NA - 1";
	replace Cancer_NonICU_N="6" if Cancer_NonICU_N=="NA - NA - 6";
	replace Cancer_NonICU_N="4" if Cancer_NonICU_N=="NA-NA-4";
	replace Cancer_NonICU_N="12" if Cancer_NonICU_N==`""NA" 12"';
	replace Cancer_NonICU_N="46" if Cancer_NonICU_N=="cancer - active - 46";
	replace Cancer_NonICU_N="65" if Cancer_NonICU_N=="NA-NA-65";
	replace Cancer_NonICU_N="3" if Cancer_NonICU_N==`""NA" - "NA" - "3""';
	replace Cancer_NonICU_N="27" if Z=="G2H4UH3K";
	replace Cancer_NonICU_N="1" if Cancer_NonICU_N==`""NA" - "active stage IV" - "1""';
	replace Cancer_NonICU_N="16" if Cancer_NonICU_N==`""NA" - "NA" - "16""';
	replace Cancer_NonICU_N="1" if Cancer_NonICU_N==`"#-#-1"';
destring Cancer_NonICU_N, replace;
replace Cancer_NonICU_N=. if Cancer_NonICU_N==0;

replace Cancer_Hosp_N="7" if Cancer_Hosp_N==`""malignancy" - "NA" - "7""';
	replace Cancer_Hosp_N="28" if Z=="EGMSS6WE";
	replace Cancer_Hosp_N="18" if Cancer_Hosp_N==`""NA" 18"';
	replace Cancer_Hosp_N="45" if Cancer_Hosp_N=="NA-NA-45";
destring Cancer_Hosp_N, replace;
replace Cancer_Hosp_N=. if Cancer_Hosp_N==0;

replace Cancer_Nonhosp_N="38" if Cancer_Nonhosp_N=="NA-NA-38";
destring  Cancer_Nonhosp_N, replace;
replace Cancer_Nonhosp_N=. if Cancer_Nonhosp_N==0;

replace Cancer_Intub_N="20" if Cancer_Intub_N=="# - # - 20";
	replace Cancer_Intub_N="2" if Cancer_Intub_N=="metastatic solid tumor - # - 2";
destring Cancer_Intub_N, replace;
replace Cancer_Intub_N=. if Cancer_Intub_N==0;

replace Cancer_Nonintub_N="40" if Cancer_Nonintub_N=="# - # - 40";
	replace Cancer_Nonintub_N="3" if Cancer_Nonintub_N=="metastatic solid tumor - # - 3";
destring Cancer_Nonintub_N, replace;
replace Cancer_Nonintub_N=. if Cancer_Nonintub_N==0;

replace Cancer_Mortality_N="5" if Cancer_Mortality_N==`""malignancy" - "NA" - "5""';
	replace Cancer_Mortality_N="1" if Cancer_Mortality_N=="NA - NA - 1";
	replace Cancer_Mortality_N="1" if Cancer_Mortality_N=="NA - NA - 1";
	replace Cancer_Mortality_N="3" if Cancer_Mortality_N==`""NA" - "NA" - "3""';
	replace Cancer_Mortality_N="6" if Cancer_Mortality_N==`""NA" - "NA" - "6""';
	replace Cancer_Mortality_N="4" if Cancer_Mortality_N==`""NA" - "NA" - "4""';
	replace Cancer_Mortality_N="40" if Z=="H6LL7HW4";
	replace Cancer_Mortality_N="9" if Z=="RWZ9NV42";
	replace Cancer_Mortality_N="226" if Z=="DNNPPKQN";
	replace Cancer_Mortality_N="2" if Cancer_Mortality_N=="# - # -2";
destring Cancer_Mortality_N, replace;
replace Cancer_Mortality_N=. if Cancer_Mortality_N==0;

replace Cancer_Survived_N="2" if Cancer_Survived_N==`""malignancy" - "NA" - "2""';
	replace Cancer_Survived_N="1" if Cancer_Survived_N=="NA - NA - 1";
	replace Cancer_Survived_N="3" if Cancer_Survived_N=="NA - NA - 3";
	replace Cancer_Survived_N="3" if Cancer_Survived_N=="3#";
	replace Cancer_Survived_N="17" if Cancer_Survived_N==`""NA" - "NA" - "17""';
	replace Cancer_Survived_N="101" if Cancer_Survived_N==`""NA" - "NA" - "101""';
	replace Cancer_Survived_N="5" if Cancer_Survived_N==`""NA" - "NA" - "5""';
	replace Cancer_Survived_N="165" if Z=="H6LL7HW4";
	replace Cancer_Survived_N="16" if Z=="RWZ9NV42";
	replace Cancer_Survived_N="574" if Z=="DNNPPKQN";
	replace Cancer_Survived_N="6" if Cancer_Survived_N==`"# - # -6"';
	replace Cancer_Survived_N="4" if Cancer_Survived_N==`"# - # -4"';
destring Cancer_Survived_N, replace;
replace Cancer_Survived_N=. if Cancer_Survived_N==0;

*		NIV;
replace NIV_Mortality_N="76" if NIV_Mortality_N=="76 mortality";
	replace NIV_Mortality_N="23" if NIV_Mortality_N=="23 (mortality)";
	replace NIV_Mortality_N="19" if NIV_Mortality_N=="19 - Mortality";
	replace NIV_Mortality_N="14" if NIV_Mortality_N=="14 - mortality";
	replace NIV_Mortality_N="3" if NIV_Mortality_N=="3 (mortality)";
	replace NIV_Mortality_N="11" if NIV_Mortality_N=="mortality: 11";
	replace NIV_Mortality_N="." if NIV_Mortality_N=="mortality : 0";
	replace NIV_Mortality_N="6" if NIV_Mortality_N=="Mortality: 6";
	replace NIV_Mortality_N="." if NIV_Mortality_N=="mortality - 0";
	replace NIV_Mortality_N="4" if NIV_Mortality_N=="Mortality 4";
	replace NIV_Mortality_N="1" if NIV_Mortality_N=="mortality: 1";
	replace NIV_Mortality_N="3" if NIV_Survived_N=="NIV - mortality -3 / NIV- survived - 1";
	replace NIV_Mortality_N="12" if NIV_Mortality_N=="mortality: 12";
	replace NIV_Mortality_N="8" if NIV_Mortality_N=="mortality: 8";
	replace NIV_Mortality_N="13" if NIV_Mortality_N=="mortality: 13";
	replace NIV_Mortality_N="34" if NIV_Mortality_N=="Mortality 34";
destring NIV_Mortality_N, replace;
replace NIV_Survived_N="1" if NIV_Survived_N=="NIV - mortality -3 / NIV- survived - 1";
	replace NIV_Survived_N="5" if NIV_Survived_N=="mortality - 16 / survived - 5";
	replace NIV_Survived_N="1" if NIV_Survived_N=="mortality - 7 / survived - 1";
destring NIV_Survived_N, replace;
*		Renal replacement;
replace RenalReplace_Mortality_N="18" if RenalReplace_Mortality_N=="AVF/AVG - 15, Dialysis catheter - 3, Peritoneal dialysis - 0";
	destring RenalReplace_Mortality_N, replace;
replace RenalReplace_Survived_N="41" if RenalReplace_Survived_N=="AVF/AVG - 32, Dialysis catheter - 7, Peritoneal dialysis - 2";
	destring RenalReplace_Survived_N, replace;
replace RenalReplace_Intub_N="8" if RenalReplace_Intub_N=="AVF/AVG - 4, Dialysis catheter - 4, Peritoneal dialysis - 0";
	destring RenalReplace_Intub_N, replace;
replace RenalReplace_Nonintub_N="40" if RenalReplace_Nonintub_N=="AVF/AVG - 33, Dialysis catheter - 5, Peritoneal dialysis - 2";
	destring RenalReplace_Nonintub_N, replace;



*	Duplicates;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & Hypertension_Mortality_N==26;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & Hypertension_Mortality_N==6;
*	Age study with multiple entries;
replace Z="MJH7839I-UNDER50" if Z=="MJH7839I" & Hypertension_Mortality_N==24;
replace Z="MJH7839I-OVER50" if Z=="MJH7839I" & Hypertension_Mortality_N==864;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & Hypertension_Mortality_N==9;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & Hypertension_Mortality_N==4;
*	Replace Zotero key for validation cohort;
replace Zotero="VN52PHAB-VAL" if Zotero=="VN52PHAB" & Hypertension_Mortality_N==31;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";

	
 


*******************************************************************************;

save "08 Comorbidities/COVIDSR_Comorbidities_CLEAN_20200922 - data", replace;



*	Save mortality/survived data;

preserve;
drop *_ICU_* *_NonICU_* *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_*;
save "Mortality/COVIDSR_Comorbidities_Mortality_20200922 - data", replace;
restore;


*	Save ICU/NonICU data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_* *_Mortality_* *_Survived_*;
save "ICU/COVIDSR_Comorbidities_ICU_20200922 - data", replace;
restore;



*	Save Hosp/Nonhosp data;

preserve;
drop *_ICU_* *_NonICU_* *_Intub_* *_Nonintub_* *_Mortality_* *_Survived_*;
save "Hospital/COVIDSR_Comorbidities_Hosp_20200922 - data", replace;
restore;



*	Save Intub/Nonintub data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_ICU_* *_NonICU_* *_Mortality_* *_Survived_*;
save "Intubated/COVIDSR_Comorbidities_Intub_20200922 - data", replace;
restore;




capture log close;


