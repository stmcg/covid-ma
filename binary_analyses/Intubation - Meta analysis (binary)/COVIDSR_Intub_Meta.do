***************************** STATA Housekeeping *******************************
capture log close
clear all
macro drop _all
set graphics on
set more off, permanently
version 16.1

/*******************************************************************************
Author: Alexandra Zimmer
Date: September 22, 2020
Project: Systematic review of clinical & lab indicators that predict intubation

Exporting pooled estimates to Excel for all binary Intub data & generating
combined summary forestplot
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Intub_Analysis.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\Intubated";

use "COVIDSR_Outcomes_CLEAN_20200922 - data.dta";



*	Merge with comorbidities, symptoms, clinical datasets for Intub;
merge 1:1 Zotero using "COVIDSR_Comorbidities_Intub_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Symptoms_Intub_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Clinical_Intub_20200922 - data";
drop _merge;



*	Global macro for Excel sheet;
putexcel set "COVIDSR_Intub_PooledResults.xlsx", replace; // global macro for excel OUTPUT *

putexcel
	A1=("Variable") 
	B1=("N")
	C1=("OR")
	D1=("SE")
	E1=("Lower CI")
	F1=("Upper CI")
	G1=("Group")
	H1=("I2");



*******************************************************************************;

*	GENERATE NEGATIVES (PATIENTS WITH OUTCOME BUT NO SYMPTOM);


foreach v of varlist *_Intub_N {;
	gen `v'_neg = Intub_N - `v';
};
	
foreach v of varlist *_Nonintub_N {;
	gen `v'_neg = Nonintub_N - `v';
};
	
	
	
	
	
*******************************************************************************
Meta analysis for each binary Intub outcome
Exporting the pooled estimates, CI, SE and N to Excel sheet
*******************************************************************************;


*********************************COMORBIDITIES**********************************;



********************************************************************************
								HYPERTENSION
********************************************************************************;
meta esize Hypertension_Intub_N Hypertension_Intub_N_neg Hypertension_Nonintub_N Hypertension_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;

*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A2=("Hypertension")
	B2=("`N'")
	C2=("`Estimate'")
	D2=("`SE'")
	E2=("`Low_CI'")
	F2=("`Up_CI'")
	G2=("Comorbidities")
	H2=("`I2'");

	
macro drop _all;

	


********************************************************************************
							CARDIOVASCULAR DISEASE
********************************************************************************;
meta esize CVD_Intub_N CVD_Intub_N_neg CVD_Nonintub_N CVD_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A3=("Cardiovascular disease")
	B3=("`N'")
	C3=("`Estimate'")
	D3=("`SE'")
	E3=("`Low_CI'")
	F3=("`Up_CI'")
	G3=("Comorbidities")
	H3=("`I2'");
	
macro drop _all;



********************************************************************************
							CEREBROVASCULAR DISEASE
********************************************************************************;
meta esize CerebroVD_Intub_N CerebroVD_Intub_N_neg CerebroVD_Nonintub_N CerebroVD_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A4=("Cerebrovascular disease")
	B4=("`N'")
	C4=("`Estimate'")
	D4=("`SE'")
	E4=("`Low_CI'")
	F4=("`Up_CI'")
	G4=("Comorbidities")
	H4=("`I2'");
	
macro drop _all;



********************************************************************************
								COPD
********************************************************************************;
meta esize COPD_Intub_N COPD_Intub_N_neg COPD_Nonintub_N COPD_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A5=("COPD")
	B5=("`N'")
	C5=("`Estimate'")
	D5=("`SE'")
	E5=("`Low_CI'")
	F5=("`Up_CI'")
	G5=("Comorbidities")
	H5=("`I2'");
	
macro drop _all;



********************************************************************************
								ASTHMA
********************************************************************************;
meta esize Asthma_Intub_N Asthma_Intub_N_neg Asthma_Nonintub_N Asthma_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A6=("Asthma")
	B6=("`N'")
	C6=("`Estimate'")
	D6=("`SE'")
	E6=("`Low_CI'")
	F6=("`Up_CI'")
	G6=("Comorbidities")
	H6=("`I2'");
	
macro drop _all;



********************************************************************************
							CHRONIC LUNG DISEASE
********************************************************************************;
meta esize ChronicLung_Intub_N ChronicLung_Intub_N_neg ChronicLung_Nonintub_N ChronicLung_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A7=("Chronic lung disease")
	B7=("`N'")
	C7=("`Estimate'")
	D7=("`SE'")
	E7=("`Low_CI'")
	F7=("`Up_CI'")
	G7=("Comorbidities")
	H7=("`I2'");
	
macro drop _all;



********************************************************************************
								DIABETES
********************************************************************************;
meta esize Diabetes_Intub_N Diabetes_Intub_N_neg Diabetes_Nonintub_N Diabetes_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A8=("Diabetes")
	B8=("`N'")
	C8=("`Estimate'")
	D8=("`SE'")
	E8=("`Low_CI'")
	F8=("`Up_CI'")
	G8=("Comorbidities")
	H8=("`I2'");
	
macro drop _all;



********************************************************************************
								KIDNEY DISEASE
********************************************************************************;
meta esize KidneyDis_Intub_N KidneyDis_Intub_N_neg KidneyDis_Nonintub_N KidneyDis_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A9=("Chronic kidney disease")
	B9=("`N'")
	C9=("`Estimate'")
	D9=("`SE'")
	E9=("`Low_CI'")
	F9=("`Up_CI'")
	G9=("Comorbidities")
	H9=("`I2'");
	
macro drop _all;



********************************************************************************
								RENAL REPLACEMENT
********************************************************************************;
meta esize RenalReplace_Intub_N RenalReplace_Intub_N_neg RenalReplace_Nonintub_N RenalReplace_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A10=("Renal replacement therapy")
	B10=("`N'")
	C10=("`Estimate'")
	D10=("`SE'")
	E10=("`Low_CI'")
	F10=("`Up_CI'")
	G10=("Comorbidities")
	H10=("`I2'");
	
macro drop _all;



********************************************************************************
								SMOKING
********************************************************************************;
meta esize Smoke_Intub_N Smoke_Intub_N_neg Smoke_Nonintub_N Smoke_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A11=("Smoking")
	B11=("`N'")
	C11=("`Estimate'")
	D11=("`SE'")
	E11=("`Low_CI'")
	F11=("`Up_CI'")
	G11=("Comorbidities")
	H11=("`I2'");
	
macro drop _all;



********************************************************************************
								CANCER
********************************************************************************;
meta esize Cancer_Intub_N Cancer_Intub_N_neg Cancer_Nonintub_N Cancer_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A12=("Cancer")
	B12=("`N'")
	C12=("`Estimate'")
	D12=("`SE'")
	E12=("`Low_CI'")
	F12=("`Up_CI'")
	G12=("Comorbidities")
	H12=("`I2'");
	
macro drop _all;



********************************************************************************
								LIVER DISEASE
********************************************************************************;
meta esize LiverDis_Intub_N LiverDis_Intub_N_neg LiverDis_Nonintub_N LiverDis_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A13=("Liver disease")
	B13=("`N'")
	C13=("`Estimate'")
	D13=("`SE'")
	E13=("`Low_CI'")
	F13=("`Up_CI'")
	G13=("Comorbidities")
	H13=("`I2'");
	
macro drop _all;




********************************************************************************
								IMMUNO CHEMO
********************************************************************************;
meta esize ImmunoChemo_Intub_N ImmunoChemo_Intub_N_neg ImmunoChemo_Nonintub_N ImmunoChemo_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A14=("Immunosuppressive therapy")
	B14=("`N'")
	C14=("`Estimate'")
	D14=("`SE'")
	E14=("`Low_CI'")
	F14=("`Up_CI'")
	G14=("Comorbidities")
	H14=("`I2'");
	
macro drop _all;




********************************SYMPTOMS****************************************



********************************************************************************
									FEVER
********************************************************************************;
meta esize Fever_Intub_N Fever_Intub_N_neg Fever_Nonintub_N Fever_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A15=("Fever")
	B15=("`N'")
	C15=("`Estimate'")
	D15=("`SE'")
	E15=("`Low_CI'")
	F15=("`Up_CI'")
	G15=("Symptoms")
	H15=("`I2'");
	
macro drop _all;



********************************************************************************
									COUGH
********************************************************************************;
meta esize Cough_Intub_N Cough_Intub_N_neg Cough_Nonintub_N Cough_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;



*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A16=("Cough")
	B16=("`N'")
	C16=("`Estimate'")
	D16=("`SE'")
	E16=("`Low_CI'")
	F16=("`Up_CI'")
	G16=("Symptoms")
	H16=("`I2'");
	
macro drop _all;



********************************************************************************
								DYSPNEA
********************************************************************************;
meta esize Dyspnea_Intub_N Dyspnea_Intub_N_neg Dyspnea_Nonintub_N Dyspnea_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A17=("Dyspnea")
	B17=("`N'")
	C17=("`Estimate'")
	D17=("`SE'")
	E17=("`Low_CI'")
	F17=("`Up_CI'")
	G17=("Symptoms")
	H17=("`I2'");
	
macro drop _all;



********************************************************************************
								HEADACHE
********************************************************************************;
meta esize Headache_Intub_N Headache_Intub_N_neg Headache_Nonintub_N Headache_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A18=("Headache")
	B18=("`N'")
	C18=("`Estimate'")
	D18=("`SE'")
	E18=("`Low_CI'")
	F18=("`Up_CI'")
	G18=("Symptoms")
	H18=("`I2'");
	
macro drop _all;



********************************************************************************
							ABDOMINAL PAIN
********************************************************************************;
meta esize Abdom_Intub_N Abdom_Intub_N_neg Abdom_Nonintub_N Abdom_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A19=("Abdominal pain")
	B19=("`N'")
	C19=("`Estimate'")
	D19=("`SE'")
	E19=("`Low_CI'")
	F19=("`Up_CI'")
	G19=("Symptoms")
	H19=("`I2'");
	
macro drop _all;



********************************************************************************
								FATIGUE
********************************************************************************;
meta esize Fatigue_Intub_N Fatigue_Intub_N_neg Fatigue_Nonintub_N Fatigue_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A20=("Fatigue")
	B20=("`N'")
	C20=("`Estimate'")
	D20=("`SE'")
	E20=("`Low_CI'")
	F20=("`Up_CI'")
	G20=("Symptoms")
	H20=("`I2'");
	
macro drop _all;




********************************************************************************
								DIARRHEA
********************************************************************************;
meta esize Diarrhea_Intub_N Diarrhea_Intub_N_neg Diarrhea_Nonintub_N Diarrhea_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A21=("Diarrhea")
	B21=("`N'")
	C21=("`Estimate'")
	D21=("`SE'")
	E21=("`Low_CI'")
	F21=("`Up_CI'")
	G21=("Symptoms")
	H21=("`I2'");
	
macro drop _all;





********************************************************************************
							PHARYNGALIA
********************************************************************************;
meta esize Pharyn_Intub_N Pharyn_Intub_N_neg Pharyn_Nonintub_N Pharyn_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A22=("Sore throat")
	B22=("`N'")
	C22=("`Estimate'")
	D22=("`SE'")
	E22=("`Low_CI'")
	F22=("`Up_CI'")
	G22=("Symptoms")
	H22=("`I2'");
	
macro drop _all;





********************************CLINICAL****************************************


********************************************************************************
									ART
********************************************************************************;
meta esize ART_Intub_N ART_Intub_N_neg ART_Nonintub_N ART_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A23=("ART")
	B23=("`N'")
	C23=("`Estimate'")
	D23=("`SE'")
	E23=("`Low_CI'")
	F23=("`Up_CI'")
	G23=("Clinical/Treatment")
	H23=("`I2'");
	
macro drop _all;



********************************************************************************
								KIDNEY INJURY
********************************************************************************;
meta esize KidneyInj_Intub_N KidneyInj_Intub_N_neg KidneyInj_Nonintub_N KidneyInj_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A24=("Acute kidney injury")
	B24=("`N'")
	C24=("`Estimate'")
	D24=("`SE'")
	E24=("`Low_CI'")
	F24=("`Up_CI'")
	G24=("Clinical/Treatment")
	H24=("`I2'");
	
macro drop _all;



********************************************************************************
									NIV
********************************************************************************;
meta esize NIV_Intub_N NIV_Intub_N_neg NIV_Nonintub_N NIV_Nonintub_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);


putexcel
	A25=("NIV")
	B25=("`N'")
	C25=("`Estimate'")
	D25=("`SE'")
	E25=("`Low_CI'")
	F25=("`Up_CI'")
	G25=("Clinical/Treatment")
	H25=("`I2'");
	
macro drop _all;






*******************************************************************************
Generating combined forestplot graph for Intub data
******************************************************************************;

import excel "COVIDSR_Intub_PooledResults.xlsx", sheet("Sheet1") firstrow clear;


*	Order data;

destring N, replace;
destring OR, replace;
destring SE, replace;
destring LowerCI, replace;
destring UpperCI, replace;
destring I2, replace;

drop if N<4; //remove variables with fewer than 4 studie
drop SE; //SE not needed for analysis

gen ORDER = _n;

gen obsorder=_n;
expand 2 if Group!=Group[_n-1], gen(expanded);
for var N OR LowerCI UpperCI I2: replace X = . if expanded==1;

sort obsorder;
gsort -Group -expanded ORDER;
replace Variable="" if expanded==1;
drop obsorder;



*	Create variables for plotting labels on graph;
gen groupx = 0.03;
gen varx = 0.04;
gen nx = 0.15;
gen orx = 4.5;
gen cix = 8;
gen i2x = 20;



*	Order the observations;

gen obsorder=_n;
gsort -obsorder;
gen graphorder = _n;
sort obsorder;

gen Category = Group if (Variable=="");



*	Prepare variables for plotting on the graph;

tostring N, replace; //restring N for plotting on graph
	replace N="" if N==".";
	
gen or=OR;  //generate string OR for plotting on graph
	replace OR=round(OR, 0.01);
	tostring OR, force replace;
	replace OR = "0." + substr(OR, 2, 3) if substr(OR, 1, 1) == ".";
	replace OR = substr(OR, 1, 3) + "0" if strlen(OR) == 3;
	replace OR = substr(OR, 1, 1) + ".00" if strlen(OR) == 1;
	replace OR="" if OR=="0.";

gen i2=I2;
	replace I2=round(I2, 0.1);
	tostring I2, force replace;
	replace I2 = "0"+ I2 if substr(I2, 1, 1) == ".";
	replace I2 = I2 + ".0" if strlen(I2) == 1;
	replace I2 = "" if I2=="0.";
	
gen lci=LowerCI; //generate string lower CI for plotting on graph
	replace LowerCI=round(LowerCI, 0.01);
	tostring LowerCI, force replace;
	replace LowerCI = "(" + LowerCI; //add parenthesis
	replace LowerCI = "(0." + substr(LowerCI, 3, 5) if substr(LowerCI, 1, 2) == "(.";
	replace LowerCI = LowerCI + ".00" if strlen(LowerCI) == 2;
	replace LowerCI="" if LowerCI=="(0.";

gen uci=UpperCI; //generate string upper CI for ploting on graph
	replace UpperCI=round(UpperCI, 0.01);
	tostring UpperCI, force replace;
	replace UpperCI = UpperCI + ")";
	replace UpperCI = substr(UpperCI, 1, 1) + ".00)" if substr(UpperCI, 2, .) == ")";
	replace UpperCI = substr(UpperCI, 1, 3) + "0)" if substr(UpperCI, 4, .) == ")";
	replace UpperCI = "" if UpperCI=="..00)";
	
egen CI = concat(LowerCI UpperCI), punct(-); // concatenate lower + upper CI 
	replace CI="" if CI=="-";
	

	
*	Forestplot;

scatter graphorder or, mcol(black)	msize(small)
	|| rcap lci uci graphorder, hor mcol(black)	lcol(black)
	|| scatter graphorder groupx, m(i) mlab(Category) mlabsize(vsmall) mlabcol(black)
	|| scatter graphorder varx, m(i) mlab(Variable) mlabsize(vsmall) mlabcol(gs7)
	|| scatter graphorder nx, m(i) mlab(N) mlabsize(vsmall) mlabcol(gs7)
	|| scatter graphorder orx, m(i) mlab(OR) mlabsize(vsmall) mlabcol(gs7)
	|| scatter graphorder cix, m(i) mlab(CI) mlabsize(vsmall) mlabcol(gs7)
	|| scatter graphorder i2x, m(i) mlab(I2) mlabsize(vsmall) mlabcol(gs7)
		xline(1,lp(dash)) 	
		text(13.3 0.17 "{bf:N}", size(vsmall)) text(13.3 5.5 "{bf:OR}", size(vsmall)) 
			text(13.3 11 "{bf:95% CI}", size(vsmall)) text(13.3 24 "{bf:I{superscript:2}(%)}", size(vsmall))
		xscale(range(0.25 25) log) xlab(0.25 0.5 1 2 5) xtitle("Odds ratio & 95% CI (log scale)") ylab(none) ytitle("")	
		legend(off)  graphregion(color(white)) title("Intubated vs Non-intubated", size(medium));


graph export "COVIDSR_Binary_Intub_GroupedForest.png", replace width(2400);




*******************************************************************************;

capture log close;

























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

