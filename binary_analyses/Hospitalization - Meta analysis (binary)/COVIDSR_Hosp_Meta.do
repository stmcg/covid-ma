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
Project: Systematic review of clinical & lab indicators that predict hospitalization

Exporting pooled estimates to Excel for all binary mortality data & generating
combined summary forestplot
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_Hosp_Analysis.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\Hospital";

use "COVIDSR_Outcomes_CLEAN_20200922 - data.dta";



*	Merge with comorbidities, symptoms, clinical datasets for mortality;
merge 1:1 Zotero using "COVIDSR_Comorbidities_Hosp_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Symptoms_Hosp_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Clinical_Hosp_20200922 - data";
drop _merge;



*	Global macro for Excel sheet;
putexcel set "COVIDSR_Hosp_PooledResults.xlsx", replace; // global macro for excel OUTPUT *

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


foreach v of varlist *_Hosp_N {;
	gen `v'_neg = Hosp_N - `v';
};
	
foreach v of varlist *_Nonhosp_N {;
	gen `v'_neg = Nonhosp_N - `v';
};
	
	
	
	
	
*******************************************************************************
Meta analysis for each binary mortality outcome
Exporting the pooled estimates, CI, SE and N to Excel sheet
*******************************************************************************;



********************************************************************************
								HYPERTENSION
********************************************************************************;
meta esize Hypertension_Hosp_N Hypertension_Hosp_N_neg Hypertension_Nonhosp_N Hypertension_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
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
meta esize CVD_Hosp_N CVD_Hosp_N_neg CVD_Nonhosp_N CVD_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
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
								COPD
********************************************************************************;
meta esize COPD_Hosp_N COPD_Hosp_N_neg COPD_Nonhosp_N COPD_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A4=("COPD")
	B4=("`N'")
	C4=("`Estimate'")
	D4=("`SE'")
	E4=("`Low_CI'")
	F4=("`Up_CI'")
	G4=("Comorbidities")
	H4=("`I2'");
	
macro drop _all;



********************************************************************************
								ASTHMA
********************************************************************************;
meta esize Asthma_Hosp_N Asthma_Hosp_N_neg Asthma_Nonhosp_N Asthma_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A5=("Asthma")
	B5=("`N'")
	C5=("`Estimate'")
	D5=("`SE'")
	E5=("`Low_CI'")
	F5=("`Up_CI'")
	G5=("Comorbidities")
	H5=("`I2'");
	
macro drop _all;



********************************************************************************
							CHRONIC LUNG DISEASE
********************************************************************************;
meta esize ChronicLung_Hosp_N ChronicLung_Hosp_N_neg ChronicLung_Nonhosp_N ChronicLung_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A6=("Chronic lung disease")
	B6=("`N'")
	C6=("`Estimate'")
	D6=("`SE'")
	E6=("`Low_CI'")
	F6=("`Up_CI'")
	G6=("Comorbidities")
	H6=("`I2'");
	
macro drop _all;



********************************************************************************
								DIABETES
********************************************************************************;
meta esize Diabetes_Hosp_N Diabetes_Hosp_N_neg Diabetes_Nonhosp_N Diabetes_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A7=("Diabetes")
	B7=("`N'")
	C7=("`Estimate'")
	D7=("`SE'")
	E7=("`Low_CI'")
	F7=("`Up_CI'")
	G7=("Comorbidities")
	H7=("`I2'");
	
macro drop _all;




********************************************************************************
								KIDNEY DISEASE
********************************************************************************;
meta esize KidneyDis_Hosp_N KidneyDis_Hosp_N_neg KidneyDis_Nonhosp_N KidneyDis_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A8=("Chronic kidney disease")
	B8=("`N'")
	C8=("`Estimate'")
	D8=("`SE'")
	E8=("`Low_CI'")
	F8=("`Up_CI'")
	G8=("Comorbidities")
	H8=("`I2'");
	
macro drop _all;



********************************************************************************
								RENAL REPLACEMENT
********************************************************************************;
//CCONVERGENCE NOT ACHIEVED - MLE;
meta esize RenalReplace_Hosp_N RenalReplace_Hosp_N_neg RenalReplace_Nonhosp_N RenalReplace_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random(mle) eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A9=("Renal replacement")
	B9=("`N'")
	C9=("`Estimate'")
	D9=("`SE'")
	E9=("`Low_CI'")
	F9=("`Up_CI'")
	G9=("Comorbidities")
	H9=("`I2'");
	
macro drop _all;



********************************************************************************
								SMOKING
********************************************************************************;
meta esize Smoke_Hosp_N Smoke_Hosp_N_neg Smoke_Nonhosp_N Smoke_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A10=("Smoking")
	B10=("`N'")
	C10=("`Estimate'")
	D10=("`SE'")
	E10=("`Low_CI'")
	F10=("`Up_CI'")
	G10=("Comorbidities")
	H10=("`I2'");
	
macro drop _all;



********************************************************************************
								CANCER
********************************************************************************;
//CONVERGENCE NOT ACHIEVED - MLE;
meta esize Cancer_Hosp_N Cancer_Hosp_N_neg Cancer_Nonhosp_N Cancer_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random(mle) eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A11=("Cancer")
	B11=("`N'")
	C11=("`Estimate'")
	D11=("`SE'")
	E11=("`Low_CI'")
	F11=("`Up_CI'")
	G11=("Comorbidities")
	H11=("`I2'");
	
macro drop _all;



********************************************************************************
								LIVER DISEASE
********************************************************************************;
meta esize LiverDis_Hosp_N LiverDis_Hosp_N_neg LiverDis_Nonhosp_N LiverDis_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A12=("Liver disease")
	B12=("`N'")
	C12=("`Estimate'")
	D12=("`SE'")
	E12=("`Low_CI'")
	F12=("`Up_CI'")
	G12=("Comorbidities")
	H12=("`I2'");
	
macro drop _all;




********************************************************************************
								IMMUNO CHEMO
********************************************************************************;
meta esize ImmunoChemo_Hosp_N ImmunoChemo_Hosp_N_neg ImmunoChemo_Nonhosp_N ImmunoChemo_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A13=("Immunosuppressive therapy")
	B13=("`N'")
	C13=("`Estimate'")
	D13=("`SE'")
	E13=("`Low_CI'")
	F13=("`Up_CI'")
	G13=("Comorbidities")
	H13=("`I2'");
	
	
macro drop _all;




********************************************************************************



********************************************************************************
									FEVER
********************************************************************************;
meta esize Fever_Hosp_N Fever_Hosp_N_neg Fever_Nonhosp_N Fever_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A14=("Fever")
	B14=("`N'")
	C14=("`Estimate'")
	D14=("`SE'")
	E14=("`Low_CI'")
	F14=("`Up_CI'")
	G14=("Symptoms")
	H14=("`I2'");
	
macro drop _all;



********************************************************************************
									COUGH
********************************************************************************;
meta esize Cough_Hosp_N Cough_Hosp_N_neg Cough_Nonhosp_N Cough_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;



*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A15=("Cough")
	B15=("`N'")
	C15=("`Estimate'")
	D15=("`SE'")
	E15=("`Low_CI'")
	F15=("`Up_CI'")
	G15=("Symptoms")
	H15=("`I2'");
	
macro drop _all;



********************************************************************************
								DYSPNEA
********************************************************************************;
meta esize Dyspnea_Hosp_N Dyspnea_Hosp_N_neg Dyspnea_Nonhosp_N Dyspnea_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A16=("Dyspnea")
	B16=("`N'")
	C16=("`Estimate'")
	D16=("`SE'")
	E16=("`Low_CI'")
	F16=("`Up_CI'")
	G16=("Symptoms")
	H16=("`I2'");
	
macro drop _all;



********************************************************************************
								HEADACHE
********************************************************************************;
meta esize Headache_Hosp_N Headache_Hosp_N_neg Headache_Nonhosp_N Headache_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A17=("Headache")
	B17=("`N'")
	C17=("`Estimate'")
	D17=("`SE'")
	E17=("`Low_CI'")
	F17=("`Up_CI'")
	G17=("Symptoms")
	H17=("`I2'");
	
macro drop _all;



********************************************************************************
							ABDOMINAL PAIN
********************************************************************************;
meta esize Abdom_Hosp_N Abdom_Hosp_N_neg Abdom_Nonhosp_N Abdom_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A18=("Abdominal pain")
	B18=("`N'")
	C18=("`Estimate'")
	D18=("`SE'")
	E18=("`Low_CI'")
	F18=("`Up_CI'")
	G18=("Symptoms")
	H18=("`I2'");
	
macro drop _all;



********************************************************************************
								FATIGUE
********************************************************************************;
meta esize Fatigue_Hosp_N Fatigue_Hosp_N_neg Fatigue_Nonhosp_N Fatigue_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A19=("Fatigue")
	B19=("`N'")
	C19=("`Estimate'")
	D19=("`SE'")
	E19=("`Low_CI'")
	F19=("`Up_CI'")
	G19=("Symptoms")
	H19=("`I2'");
	
macro drop _all;



********************************************************************************
								DIARRHEA
********************************************************************************;
meta esize Diarrhea_Hosp_N Diarrhea_Hosp_N_neg Diarrhea_Nonhosp_N Diarrhea_Nonhosp_N_neg, esize(lnoratio) studylabel(Zotero);
meta summarize, random eform;


*	Local macros for meta analysis;
local N=r(N);
local Estimate=exp(r(theta));
local SE=exp(r(se));
local Low_CI=exp(r(ci_lb));
local Up_CI=exp(r(ci_ub));
local I2=r(I2);

putexcel
	A20=("Diarrhea")
	B20=("`N'")
	C20=("`Estimate'")
	D20=("`SE'")
	E20=("`Low_CI'")
	F20=("`Up_CI'")
	G20=("Symptoms")
	H20=("`I2'");
	
macro drop _all;




*******************************************************************************
Generating combined forestplot graph for hospitalized data
******************************************************************************;

import excel "COVIDSR_Hosp_PooledResults.xlsx", sheet("Sheet1") firstrow clear;


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
gen groupx = 0.06;
gen varx = 0.07;
gen nx = 0.3;
gen orx = 12;
gen cix = 17;
gen i2x = 33;



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
	replace I2 = I2 + ".0" if strlen(I2) == 2;
	replace I2 = I2 + ".0" if strlen(I2) == 1;
	replace I2 = "" if I2=="..0";
	
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
		text(14 0.335 "{bf:N}", size(vsmall)) text(14 14 "{bf:OR}", size(vsmall)) 
			text(14 22 "{bf:95% CI}", size(vsmall)) text(14 38 "{bf:I{superscript:2}(%)}", size(vsmall))
		xscale(range(0.5 45) log) xlab(0.5 1 2 5 10) xtitle("{bf:Odds ratio & 95% CI (log scale)}") ylab(none) ytitle("")	
		legend(off)  graphregion(color(white)) title("Hospitalized vs Non-hospitalized", size(medium));

graph export "COVIDSR_Binary_Hosp_GroupedForest.png", replace width(2400);


*******************************************************************************;

capture log close;

























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

