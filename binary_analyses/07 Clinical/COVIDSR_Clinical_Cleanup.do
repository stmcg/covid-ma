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

Clinical - Data clean up
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Clinical_01Cleanup.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Outcomes - Systematic Literature Review 20200922.xlsx", sheet("Clinical") firstrow;



*	Drop unnecessary variables;
drop FormResponseEditURL Nameofpersonextractingdata;



*	Rename variables;
*		O2 Saturation without Oxygen;
rename O2SaturationwithoutOxygenI O2SatNoOx_ICU_N;
	rename G O2SatNoOx_ICU_Mean;
	rename H O2SatNoOx_ICU_STDEV;
	rename I O2SatNoOx_ICU_LowRange;
	rename J O2SatNoOx_ICU_UpRange;
	rename K O2SatNoOx_ICU_Median;
	rename L O2SatNoOx_ICU_Q1;
	rename M O2SatNoOx_ICU_Q3;
rename O2SaturationwithoutOxygenN O2SatNoOx_NonICU_N;
	rename O O2SatNoOx_NonICU_Mean;
	rename P O2SatNoOx_NonICU_STDEV;
	rename Q O2SatNoOx_NonICU_LowRange;
	rename R O2SatNoOx_NonICU_UpRange;
	rename S O2SatNoOx_NonICU_Median;
	rename T O2SatNoOx_NonICU_Q1;
	rename U O2SatNoOx_NonICU_Q3;
rename O2SaturationwithoutOxygenH O2SatNoOx_Hosp_N;
	rename W O2SatNoOx_Hosp_Mean;
	rename X O2SatNoOx_Hosp_STDEV;
	rename Y O2SatNoOx_Hosp_LowRange;
	rename Z O2SatNoOx_Hosp_UpRange;
	rename AA O2SatNoOx_Hosp_Median;
	rename AB O2SatNoOx_Hosp_Q1;
	rename AC O2SatNoOx_Hosp_Q3;
rename AD O2SatNoOx_Nonhosp_N;
	rename AE O2SatNoOx_Nonhosp_Mean;
	rename AF O2SatNoOx_Nonhosp_STDEV;
	rename AG O2SatNoOx_Nonhosp_LowRange;
	rename AH O2SatNoOx_Nonhosp_UpRange;
	rename AI O2SatNoOx_Nonhosp_Median;
	rename AJ O2SatNoOx_Nonhosp_Q1;
	rename AK O2SatNoOx_Nonhosp_Q3;
rename AL O2SatNoOx_Intub_N;
	rename AM O2SatNoOx_Intub_Mean;
	rename AN O2SatNoOx_Intub_STDEV;
	rename AO O2SatNoOx_Intub_LowRange;
	rename AP O2SatNoOx_Intub_UpRange;
	rename AQ O2SatNoOx_Intub_Median;
	rename AR O2SatNoOx_Intub_Q1;
	rename AS O2SatNoOx_Intub_Q3;
rename AT O2SatNoOx_Nonintub_N;
	rename AU O2SatNoOx_Nonintub_Mean;
	rename AV O2SatNoOx_Nonintub_STDEV;
	rename AW O2SatNoOx_Nonintub_LowRange;
	rename AX O2SatNoOx_Nonintub_UpRange;
	rename AY O2SatNoOx_Nonintub_Median;
	rename AZ O2SatNoOx_Nonintub_Q1;
	rename BA O2SatNoOx_Nonintub_Q3;
rename O2SaturationwithoutOxygenM O2SatNoOx_Mortality_N;
	rename BC O2SatNoOx_Mortality_Mean;
	rename BD O2SatNoOx_Mortality_STDEV;
	rename BE O2SatNoOx_Mortality_LowRange;
	rename BF O2SatNoOx_Mortality_UpRange;
	rename BG O2SatNoOx_Mortality_Median;
	rename BH O2SatNoOx_Mortality_Q1;
	rename BI O2SatNoOx_Mortality_Q3;
rename O2SaturationwithoutOxygenS O2SatNoOx_Survived_N;
	rename BK O2SatNoOx_Survived_Mean;
	rename BL O2SatNoOx_Survived_STDEV;
	rename BM O2SatNoOx_Survived_LowRange;
	rename BN O2SatNoOx_Survived_UpRange;
	rename BO O2SatNoOx_Survived_Median;
	rename BP O2SatNoOx_Survived_Q1;
	rename BQ O2SatNoOx_Survived_Q3;
rename O2SaturationwithoutOxygenR O2SatNoOx_Other;
	rename O2SaturationwithoutOxygeno O2SatNoOx_Other_N;
	rename BT O2SatNoOx_Other_Mean;
	rename BU O2SatNoOx_Other_STDEV;
	rename BV O2SatNoOx_Other_LowRange;
	rename BW O2SatNoOx_Other_UpRange;
	rename BX O2SatNoOx_Other_Median;
	rename BY O2SatNoOx_Other_Q1;
	rename BZ O2SatNoOx_Other_Q3;
*		O2 Saturation with Oxygen;
rename O2SaturationwithOxygenICU O2SatOx_ICU_N;
	rename CB O2SatOx_ICU_Mean;
	rename CC O2SatOx_ICU_STDEV;
	rename CD O2SatOx_ICU_LowRange;
	rename CE O2SatOx_ICU_UpRange;
	rename CF O2SatOx_ICU_Median;
	rename CG O2SatOx_ICU_Q1;
	rename CH O2SatOx_ICU_Q3;
	rename CI O2SatOx_ICU_Type;
rename O2SaturationwithOxygenNon O2SatOx_NonICU_N;
	rename CK O2SatOx_NonICU_Mean;
	rename CL O2SatOx_NonICU_STDEV;
	rename CM O2SatOx_NonICU_LowRange;
	rename CN O2SatOx_NonICU_UpRange;
	rename CO O2SatOx_NonICU_Median;
	rename CP O2SatOx_NonICU_Q1;
	rename CQ O2SatOx_NonICU_Q3;
	rename CR O2SatOx_NonICU_Type;
rename O2SaturationwithOxygenHosp O2SatOx_Hosp_N;
	rename CT O2SatOx_Hosp_Mean;
	rename CU O2SatOx_Hosp_STDEV;
	rename CV O2SatOx_Hosp_LowRange;
	rename CW O2SatOx_Hosp_UpRange;
	rename CX O2SatOx_Hosp_Median;
	rename CY O2SatOx_Hosp_Q1;
	rename CZ O2SatOx_Hosp_Q3;
	rename DA O2SatOx_Hosp_Type;
rename DB O2SatOx_Nonhosp_N;
	rename DC O2SatOx_Nonhosp_Mean;
	rename DD O2SatOx_Nonhosp_STDEV;
	rename DE O2SatOx_Nonhosp_LowRange;
	rename DF O2SatOx_Nonhosp_UpRange;
	rename DG O2SatOx_Nonhosp_Median;
	rename DH O2SatOx_Nonhosp_Q1;
	rename DI O2SatOx_Nonhosp_Q3;
	rename DJ O2SatOx_Nonhosp_Type;
rename O2SaturationwithOxygenIntu O2SatOx_Intub_N;
	rename DL O2SatOx_Intub_Mean;
	rename DM O2SatOx_Intub_STDEV;
	rename DN O2SatOx_Intub_LowRange;
	rename DO O2SatOx_Intub_UpRange;
	rename DP O2SatOx_Intub_Median;
	rename DQ O2SatOx_Intub_Q1;
	rename DR O2SatOx_Intub_Q3;
	rename DS O2SatOx_Intub_Type;
rename DT O2SatOx_Nonintub_N;
	rename DU O2SatOx_Nonintub_Mean;
	rename DV O2SatOx_Nonintub_STDEV;
	rename DW O2SatOx_Nonintub_LowRange;
	rename DX O2SatOx_Nonintub_UpRange;
	rename DY O2SatOx_Nonintub_Median;
	rename DZ O2SatOx_Nonintub_Q1;
	rename EA O2SatOx_Nonintub_Q3;
	rename EB O2SatOx_Nonintub_Type;
rename O2SaturationwithOxygenMort O2SatOx_Mortality_N;
	rename ED O2SatOx_Mortality_Mean;
	rename EE O2SatOx_Mortality_STDEV;
	rename EF O2SatOx_Mortality_LowRange;
	rename EG O2SatOx_Mortality_UpRange;
	rename EH O2SatOx_Mortality_Median;
	rename EI O2SatOx_Mortality_Q1;
	rename EJ O2SatOx_Mortality_Q3;
	rename EK O2SatOx_Mortality_Type;
rename O2SaturationwithOxygenSurv O2SatOx_Survived_N;
	rename EM O2SatOx_Survived_Mean;
	rename EN O2SatOx_Survived_STDEV;
	rename EO O2SatOx_Survived_LowRange;
	rename EP O2SatOx_Survived_UpRange;
	rename EQ O2SatOx_Survived_Median;
	rename ER O2SatOx_Survived_Q1;
	rename ES O2SatOx_Survived_Q3;
	rename ET O2SatOx_Survived_Type;
rename O2SaturationwithOxygenRepo O2SatOx_Other;
	rename O2SaturationwithOxygenothe O2SatOx_Other_N;
	rename EW O2SatOx_Other_Mean;
	rename EX O2SatOx_Other_STDEV;
	rename EY O2SatOx_Other_LowRange;
	rename EZ O2SatOx_Other_UpRange;
	rename FA O2SatOx_Other_Median;
	rename FB O2SatOx_Other_Q1;
	rename FC O2SatOx_Other_Q3;
	rename FD O2SatOx_Other_Type;
*		Respiratory Rate;
rename RespiratoryRateICUadmission RespRate_ICU_N;
	rename FF RespRate_ICU_Mean;
	rename FG RespRate_ICU_STDEV;
	rename FH RespRate_ICU_LowRange;
	rename FI RespRate_ICU_UpRange;
	rename FJ RespRate_ICU_Median;
	rename FK RespRate_ICU_Q1;
	rename FL RespRate_ICU_Q3;
rename RespiratoryRateNonICUadmis RespRate_NonICU_N;
	rename FN RespRate_NonICU_Mean;
	rename FO RespRate_NonICU_STDEV;
	rename FP RespRate_NonICU_LowRange;
	rename FQ RespRate_NonICU_UpRange;
	rename FR RespRate_NonICU_Median;
	rename FS RespRate_NonICU_Q1;
	rename FT RespRate_NonICU_Q3;
rename RespiratoryRateHospitalized RespRate_Hosp_N;
	rename FV RespRate_Hosp_Mean;
	rename FW RespRate_Hosp_STDEV;
	rename FX RespRate_Hosp_LowRange;
	rename FY RespRate_Hosp_UpRange;
	rename FZ RespRate_Hosp_Median;
	rename GA RespRate_Hosp_Q1;
	rename GB RespRate_Hosp_Q3;
rename RespiratoryRateNonhospitali RespRate_Nonhosp_N;
	rename GD RespRate_Nonhosp_Mean;
	rename GE RespRate_Nonhosp_STDEV;
	rename GF RespRate_Nonhosp_LowRange;
	rename GG RespRate_Nonhosp_UpRange;
	rename GH RespRate_Nonhosp_Median;
	rename GI RespRate_Nonhosp_Q1;
	rename GJ RespRate_Nonhosp_Q3;
rename RespiratoryRateIntubatedN RespRate_Intub_N;
	rename RespiratoryRateIntubatedM RespRate_Intub_Mean;
	rename RespiratoryRateIntubatedS RespRate_Intub_STDEV;
	rename RespiratoryRateIntubatedR RespRate_Intub_LowRange;
	rename GO RespRate_Intub_UpRange;
	rename GP RespRate_Intub_Median;
	rename RespiratoryRateIntubatedI RespRate_Intub_Q1;
	rename GR RespRate_Intub_Q3;
rename RespiratoryRateNonintubated RespRate_Nonintub_N;
	rename GT RespRate_Nonintub_Mean;
	rename GU RespRate_Nonintub_STDEV;
	rename GV RespRate_Nonintub_LowRange;
	rename GW RespRate_Nonintub_UpRange;
	rename GX RespRate_Nonintub_Median;
	rename GY RespRate_Nonintub_Q1;
	rename GZ RespRate_Nonintub_Q3;
rename RespiratoryRateMortalityN RespRate_Mortality_N;
	rename RespiratoryRateMortalityM RespRate_Mortality_Mean;
	rename RespiratoryRateMortalityS RespRate_Mortality_STDEV;
	rename RespiratoryRateMortalityR RespRate_Mortality_LowRange;
	rename HE RespRate_Mortality_UpRange;
	rename HF RespRate_Mortality_Median;
	rename RespiratoryRateMortalityI RespRate_Mortality_Q1;
	rename HH RespRate_Mortality_Q3;
rename RespiratoryRateSurvivedNu RespRate_Survived_N;
	rename RespiratoryRateSurvivedME RespRate_Survived_Mean;
	rename RespiratoryRateSurvivedST RespRate_Survived_STDEV;
	rename RespiratoryRateSurvivedRA RespRate_Survived_LowRange;
	rename HM RespRate_Survived_UpRange;
	rename HN RespRate_Survived_Median;
	rename RespiratoryRateSurvivedIQ RespRate_Survived_Q1;
	rename HP RespRate_Survived_Q3;
rename RespiratoryRateReportedfor RespRate_Other;
	rename RespiratoryRateotherNumbe RespRate_Other_N;
	rename RespiratoryRateotherMEAN RespRate_Other_Mean;
	rename RespiratoryRateotherSTDEV RespRate_Other_STDEV;
	rename RespiratoryRateotherRANGE RespRate_Other_LowRange;
	rename HV RespRate_Other_UpRange;
	rename RespiratoryRateotherMEDIA RespRate_Other_Median;
	rename RespiratoryRateotherIQRQ RespRate_Other_Q1;
	rename HY RespRate_Other_Q3;
*		Scores;
rename Curb65Score01ICUadmis CURB65_01_ICU_N;
	rename Curb65Score2ICUadmissi CURB65_2_ICU_N;
	rename Curb65Score35ICUadmis CURB65_35_ICU_N;
	rename SOFAScoreICUadmissionNum SOFA_ICU_N;
	rename SOFAScoreICUadmission SOFA_ICU_Score;
	rename qSOFAScoreICUadmissionNu qSOFA_ICU_N;
	rename qSOFAScoreICUadmission qSOFA_ICU_Score;
	rename APACHEIIScoreICUadmission APACHEII_ICU_N;
	rename IH APACHEII_ICU_Score;
	rename OtherscoresICUadmission OtherScore_ICU_Score;
rename Curb65Score01NonICUa CURB65_01_NonICU_N;
	rename Curb65Score2NonICUadm CURB65_2_NonICU_N;
	rename Curb65Score35NonICUa CURB65_35_NonICU_N;
	rename SOFAScoreNonICUadmission SOFA_NonICU_N;
	rename IN SOFA_NonICU_Score;
	rename qSOFAScoreNonICUadmission qSOFA_NonICU_N;
	rename IP qSOFA_NonICU_Score;
	rename APACHEIIScoreNonICUadmiss APACHEII_NonICU_N;
	rename IR APACHEII_NonICU_Score;
	rename OtherscoresNonICUadmission OtherScore_NonICU_Score;
rename Curb65Score01Hospitali CURB65_01_Hosp_N;
	rename Curb65Score2Hospitalize CURB65_2_Hosp_N;
	rename Curb65Score35Hospitali CURB65_35_N;
	rename SOFAScoreHospitalizedNumb SOFA_Hosp_N;
	rename SOFAScoreHospitalized SOFA_Hosp_Score;
	rename qSOFAScoreHospitalizedNum qSOFA_Hosp_N;
	rename qSOFAScoreHospitalized qSOFA_Hosp_Score;
	rename APACHEIIScoreHospitalized APACHEII_Hosp_N;
	rename JB APACHEII_Hosp_Score;
	rename OtherscoresHospitalized OtherScore_Hosp_Score;
rename Curb65Score01Nonhospi CURB65_01_Nonhosp_N;
	rename Curb65Score2Nonhospita CURB65_2_Nonhosp_N;
	rename Curb65Score35Nonhospi CURB65_Nonhosp_N;
	rename SOFAScoreNonhospitalized SOFA_Nonhosp_N;
	rename JH SOFA_Nonhosp_Score;
	rename qSOFAScoreNonhospitalized qSOFA_Nonhosp_N;
	rename JJ qSOFA_Nonhosp_Score;
	rename APACHEIIScoreNonhospitaliz APACHEII_Nonhosp_N;
	rename JL APACHEII_Nonhosp_Score;
	rename OtherscoresNonhospitalized OtherScore_Nonhosp_Score;
rename CURB65score01Intubated CURB65_01_Intub_N;
	rename CURB65score2Intubated CURB65_2_Intub_N;
	rename CURB65score35Intubated CURB65_35_Intub_N;
	rename SOFAscoreIntubatedNumber SOFA_Intub_N;
	rename SOFAscoreIntubated SOFA_Intub_Score;
	rename qSOFAscoreIntubatedNumber qSOFA_Intub_N;
	rename qSOFAscoreIntubated qSOFA_Intub_Score;
	rename APACHEIIscoreIntubatedNu APACHEII_Intub_N;
	rename APACHEIIscoreIntubated APACHEII_Intub_Score;
	rename OtherscoresIntubated OtherScore_Intub_Score;
rename CURB65score01Nonintub CURB65_01_Nonintub_N;
	rename CURB65score2Nonintubat CURB65_2_Nonintub_N;
	rename CURB65score35Nonintub CURB65_35_Nonintub_N;
	rename SOFAscoreNonintubatedNum SOFA_Nonintub_N;
	rename SOFAscoreNonintubated SOFA_Nonintub_Score;
	rename qSOFAscoreNonintubatedNu qSOFA_Nonintub_N;
	rename qSOFAscoreNonintubated qSOFA_Nonintub_Score;
	rename APACHEIIscoreNonintubated APACHEII_Nonintub_N;
	rename KF APACHEII_Nonintub_Score;
	rename OtherscoresNonintubated OtherScore_Nonintub_Score;
rename CURB65score01Mortality CURB65_01_Mortality_N;
	rename CURB65score2Mortality CURB65_2_Mortality_N;
	rename CURB65score35Mortality CURB65_35_Mortality_N;
	rename SOFAscoreMortalityNumber SOFA_Mortality_N;
	rename SOFAscoreMortality SOFA_Mortality_Score;
	rename qSOFAscoreMortalityNumber qSOFA_Mortality_N;
	rename qSOFAscoreMortality qSOFA_Mortality_Score;
	rename APACHEIIscoreMortalityNu APACHEII_Mortality_N;
	rename APACHEIIscoreMortality APACHEII_Mortality_Score;
	rename OtherscoresMortality OtherScore_Mortality_Score;
rename CURB65score01Survived CURB65_01_Survived_N;
	rename CURB65score2Survived CURB65_2_Survived_N;
	rename CURB65score35Survived CURB65_35_Survived_N;
	rename SOFAscoreSurvivedNumbero SOFA_Survived_N;
	rename SOFAscoreSurvived SOFA_Survived_Score;
	rename qSOFAscoreSurvivedNumber qSOFA_Survived_N;
	rename qSOFAscoreSurvived qSOFA_Survived_Score;
	rename APACHEIIscoreSurvivedNum APACHEII_Survived_N;
	rename APACHEIIscoreSurvived APACHEII_Survived_Score;
	rename OtherscoresSurvived OtherScore_Survived_Score;
rename CURB65score01othern CURB65_01_Other_N;
	rename CURB65score2othernum CURB65_2_Other_N;
	rename CURB65score35othern CURB65_35_Other_N;
	rename SOFAscoreotherNumberofp SOFA_Other_N;
	rename SOFAscoreother SOFA_Other_Score;
	rename qSOFAscoreotherNumberof qSOFA_Other_N;
	rename qSOFAscoreother qSOFA_Other_Score;
	rename APACHEIIscoreotherNumber APACHEII_Other_N;
	rename APACHEIIscoreother APACHEII_Other_Score;
	rename Otherscoresother OtherScore_Other_Score;
*		Antiretroviral;
rename AntiviraltreatmentICUadmiss ART_ICU_Type;
	rename LM ART_ICU_N;
	rename LN ART_ICU_Dose;
	rename LO ART_ICU_Cumulative;
rename AntiviraltreatmentNonICUad ART_NonICU_Type;
	rename LQ ART_NonICU_N;
	rename LR ART_NonICU_Dose;
	rename LS ART_NonICU_Cumulative;
rename AntiviraltreatmentHospitaliz ART_Hosp_Type;
	rename LU ART_Hosp_N;
	rename LV ART_Hosp_Dose;
	rename LW ART_Hosp_Cumulative;
rename AntiviraltreatmentNonhospit ART_Nonhosp_Type;
	rename LY ART_Nonhosp_N;
	rename LZ ART_Nonhosp_Dose;
	rename MA ART_Nonhosp_Cumulative;
rename AntiviraltreatmentIntubated ART_Intub_Type;
	rename MC ART_Intub_N;
	rename MD ART_Intub_Dose;
	rename ME ART_Intub_Cumulative;
rename AntiviraltreatmentNonintuba ART_Nonintub_Type;
	rename MG ART_Nonintub_N;
	rename MH ART_Nonintub_Dose;
	rename MI ART_Nonintub_Cumulative;
rename AntiviraltreatmentMortality ART_Mortality_Type;
	rename MK ART_Mortality_N;
	rename ML ART_Mortality_Dose;
	rename MM ART_Mortality_Cumulative;
rename AntiviraltreatmentSurvived ART_Survived_Type;
	rename MO ART_Survived_N;
	rename MP ART_Survived_Dose;
	rename MQ ART_Survived_Cumulative;
rename AntiviraltreatmentotherTy ART_Other_Type;
	rename AntiviraltreatmentotherNu ART_Other_N;
	rename AntiviraltreatmentotherDo ART_Other_Dose;
	rename AntiviraltreatmentotherCu ART_Other_Cumulative;
rename Additionalantiviraltreatments AdditionalART;
*		TNF-alpha;
rename TNFaICUadmissionType TNFa_ICU_Type;
	rename TNFaICUadmissionNumbero TNFa_ICU_N;
	rename TNFaICUadmissionDosage TNFa_ICU_Dose;
	rename TNFaICUadmissionCumulati TNFa_ICU_Cumulative;
rename TNFaNonICUadmissionType TNFa_NonICU_Type;
	rename TNFaNonICUadmissionNumb TNFa_NonICU_N;
	rename TNFaNonICUadmissionDosa TNFa_NonICU_Dose;
	rename TNFaNonICUadmissionCumu TNFa_NonICU_Cumulative;
rename TNFaHospitalizedType TNFa_Hosp_Type;
	rename TNFaHospitalizeNumberofc TNFa_Hosp_N;
	rename TNFaHospitalizedDosage TNFa_Hosp_Dose;
	rename TNFaHospitalizedCumulativ TNFa_Hosp_Cumulative;
rename TNFaNonhospitalizedType TNFa_Nonhosp_Type;
	rename TNFaNonhospitalizedDosag TNFa_Nonhosp_Dose;
	rename TNFaNonhospitalizedCumul TNFa_Nonhosp_Cumulative;
rename TNFaIntubationType TNFa_Intub_Type;
	rename TNFaIntubationNumberofc TNFa_Intub_N;
	rename TNFaIntubationDosage TNFa_Intub_Dose;
	rename TNFaIntubationCumulative TNFa_Dose_Cumulative;
rename TNFaMortalityType TNFa_Mortality_Type;
	rename TNFaMortalityNumberofca TNFa_Mortality_N;
	rename TNFaMortalityDosage TNFa_Mortality_Dose;
	rename TNFaMortalityCumulative TNFa_Mortality_Cumulative;
rename TNFaSurvivedType TNFa_Survived_Type;
	rename TNFaSurvivedNumberofcas TNFa_Survived_N;
	rename TNFaSurvivedDosage TNFa_Survived_Dose;
	rename TNFaSurvivedCumulative TNFa_Survived_Cumulative;
rename TNFaotherType TNFa_Other_Type;
	rename TNFaotherNumberofcases TNFa_Other_N;
	rename TNFaotherDosage TNFa_Other_Dose;
	rename TNFaotherCumulative TNFa_Other_Cumulative;
	
	
	
	*	Data;
replace ART_ICU_N="13" if ART_ICU_N=="Lopinavir/ritonavir";
replace ART_ICU_Type="Lopinavir/ritonavir" if ART_ICU_Type=="13";
replace ART_Hosp_N="80" if Z=="YUHMYM8R";
replace ART_Hosp_N="34" if ART_Hosp_N=="10 ; 14 ; 9 ; 1";
replace TNFa_Hosp_N="." if TNFa_Hosp_N=="0";
replace TNFa_Mortality_N="." if TNFa_Mortality_N=="0";

	
	
	
*	Destring data ;
quietly ds Timestamp Zotero Reporttitle, not;
foreach v of var `r(varlist)' {;
	replace `v' = subinstr(`v', ",", ".",.);
	replace `v'="." if `v'=="#" | `v'=="##" | `v'=="not specified" | `v'=="NA" |
		`v'=="$";
	destring `v', replace dpcomma;
	destring `v', replace;
};



*	Drop duplicate entries;
tab Zotero;
quietly duplicates report Zoterokey-TNFa_Other_Cumulative;
duplicates drop Zoterokey-TNFa_Other_Cumulative, force;



*	Drop Zotero with only mortality data;
drop if Z=="SKX3GCG6";



*	Duplicate Zotero keys;
*	Diabetes studies with multiple entries;
replace Z="3LSGJJ58-DIAB" if Z=="3LSGJJ58" & O2SatNoOx_Mortality_N==31;
replace Z="3LSGJJ58-NONDIAB" if Z=="3LSGJJ58" & O2SatNoOx_Mortality_N==16;
*	Study with two entries;
replace Z="P7S9CPSD-1" if Z=="P7S9CPSD" & O2SatNoOx_Mortality_N==19;
replace Z="P7S9CPSD-2" if Z=="P7S9CPSD" & O2SatNoOx_Mortality_N==14;
*	Validation study;
replace Zotero="VN52PHAB-VAL" if Zotero=="VN52PHAB" & O2SatNoOx_Mortality_N==69; //validation cohort had no data







*******************************************************************************;

save "07 Clinical/COVIDSR_Clinical_CLEAN_20200922 - data", replace;

export delimited using "07 Clinical\COVIDSR_Clinical_CSV.csv", replace;


*	Save binary data only;

drop O2SatNoOx_ICU_N-OtherScore_Other_Score;

save "07 Clinical\COVIDSR_Clinical_MERGE_BINARY_20200922 - data", replace;


*	Save mortality/survived binary data;

preserve;
drop *_ICU_* *_NonICU_* *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_*;
save "Mortality/COVIDSR_Clinical_Mortality_20200922 - data", replace;
restore;


*	Save ICU/NonICU binary data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_Intub_* *_Nonintub_* *_Mortality_* *_Survived_*;
save "ICU/COVIDSR_Clinical_ICU_20200922 - data", replace;
restore;

capture log close;



*	Save Hospital/NonHosp binary data;

preserve;
drop *_Intub_* *_Nonintub_* *_ICU_* *_NonICU_* *_Mortality_* *_Survived_*;
save "Hospital/COVIDSR_Clinical_Hosp_20200922 - data", replace;
restore;

capture log close;



*	Save Intub/Nonintub binary data;

preserve;
drop *_Hosp_* *_Nonhosp_* *_ICU_* *_NonICU_* *_Mortality_* *_Survived_*;
save "Intubated/COVIDSR_Clinical_Intub_20200922 - data", replace;
restore;

capture log close;













