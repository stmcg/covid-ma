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
ICU, intubation and ICU in COVID-19 patients

Exporting pooled estimates to Excel for all binary ICU data & generating
combined summary forestplot
*******************************************************************************/

#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\COVIDSR_ICU_Analysis.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\ICU";

use "COVIDSR_Outcomes_CLEAN_20200922 - data.dta";



*	Merge with comorbidities, symptoms, clinical datasets for ICU;
merge 1:1 Zotero using "COVIDSR_Comorbidities_ICU_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Symptoms_ICU_20200922 - data";
drop _merge;

merge 1:1 Zotero using "COVIDSR_Clinical_ICU_20200922 - data";
drop _merge;


*******************************************************************************;

*	GENERATE NEGATIVES (PATIENTS WITH OUTCOME BUT NO SYMPTOM);

foreach v of varlist *_ICU_N {;
	gen `v'_neg = ICU_N - `v';
};
	
foreach v of varlist *_NonICU_N {;
	gen `v'_neg = NonICU_N - `v';
};

*******************************************************************************;
	


*	Global macro for Excel sheet;
putexcel set "COVIDSR_ICU_PooledResults.xlsx", replace; // global macro for excel OUTPUT *

putexcel
	A1=("Variable") 
	B1=("N")
	C1=("OR")
	D1=("Lower CI")
	E1=("Upper CI")
	F1=("I2")
	G1=("Group");

	
*	Local varlist;
local vlist Fever Cough Dyspnea Headache Abdom Fatigue Confusion Diarrhea Pharyn Asymptom
	Hypertension Cardiomyopathy CVD CerebroVD PrevPneum COPD Asthma ChronicLung Diabetes
	KidneyDis Smoke Cancer LiverDis DigestiveDis NervousSys ImmunoChemo ImmunoBio TB ART 
	KidneyInj NIV;
	
local row=2;
	
* Meta-analysze and add to Excel sheet;
foreach v of local vlist {;
	meta esize `v'_ICU_N `v'_ICU_N_neg `v'_NonICU_N `v'_NonICU_N_neg, esize(lnoratio) studylabel(Zotero);
	capture meta summarize, random eform iterate(1000);
	local N=r(N);
	local tau=r(converged);
	
	if !_rc {;
		if `N'>3 {;
				meta summarize, random eform iterate(1000);
					local N=r(N);
					local OR=exp(r(theta));
					local Low_CI=exp(r(ci_lb));
					local Up_CI=exp(r(ci_ub));
					local I2=r(I2);
			putexcel A`row'= ("`v'") B`row'=("`N'") C`row'=("`OR'")
				D`row' = ("`Low_CI'") E`row'= ("`Up_CI'") F`row' = ("`I2'");
			};

		else {;
			display as error "Variable `v' ICU/NonICU has N<4";
		};
	};
		

	else {;
		display as error "Variable `v' ICU/NonICU does not exist";
	};
	
	local row=`row'+1;
};


*******************************************************************************
Generating combined forestplot graph for ICU data
******************************************************************************;

import excel "COVIDSR_ICU_PooledResults.xlsx", sheet("Sheet1") firstrow clear;


*	Destring data;
destring N, replace;
destring OR, replace;
destring LowerCI, replace;
destring UpperCI, replace;
destring I2, replace;
tostring Group, replace;

drop if N==.;

*	Add rename variables and add group label;
replace Variable="Cardiovascular disease" if Variable=="CVD";
replace Variable="Cerebrovascular disease" if Variable=="CerebroVD";
replace Variable="Chronic lung disease" if Variable=="ChronicLung";
replace Variable="Acute kidney injury" if Variable=="KidneyInj";
replace Variable="Chronic kidney disease" if Variable=="KidneyDis";
replace Variable="Liver disease" if Variable=="LiverDis";
replace Variable="Digestive system disease" if Variable=="DigestiveDis";
replace Variable="Immunosuppressive therapy" if Variable=="ImmunoChemo";
replace Variable="Renal replacement therapy" if Variable=="RenalReplace";
replace Variable="Abdominal pain" if Variable=="Abdom";
replace Variable="Sore throat" if Variable=="Pharyn";
replace Variable="Smoking" if Variable=="Smoke";

replace Group="Symptoms" if Variable=="Fever" | Variable=="Cough" | Variable=="Dyspnea"
	| Variable=="Headache" | Variable=="Abdominal pain" | Variable=="Fatigue"
	| Variable=="Diarrhea" | Variable=="Sore throat";
	
replace Group="Comorbidities" if Variable=="Hypertension" | Variable=="Cardiovascular disease"
	| Variable=="Cerebrovascular disease" | Variable=="COPD" | Variable=="Asthma"
	| Variable=="Chronic lung disease" | Variable=="Diabetes" | Variable=="Chronic kidney disease"
	| Variable=="Smoking" | Variable=="Cancer" | Variable=="Liver disease" 
	| Variable=="Digestive system disease" | Variable=="Immunosuppressive therapy";
	
replace Group="Clinical/Treatment" if Variable=="ART" | Variable=="ECMO"
	| Variable=="Acute kidney injury" | Variable=="NIV" 
	| Variable=="Renal replacement therapy";

	
*	Order data;
gsort -Group;
gen ORDER = _n;

gen obsorder=_n;
expand 2 if Group!=Group[_n-1], gen(expanded);
for var N OR LowerCI UpperCI I2: replace X = . if expanded==1;

sort obsorder;
gsort -Group -expanded ORDER;
replace Variable="" if expanded==1;
drop obsorder;



*	Create variables for plotting labels on graph;
gen groupx = 0.018;
gen varx = 0.02055;
gen nx = 0.15;
gen orx = 125;
gen cix = 200;
gen i2x = 575;




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
	replace I2 = I2 + ".0" if strlen(I2) == 1;
	replace I2 = "" if I2=="..0";
	replace I2 = "0" + I2 if substr(I2, 1, 1) == ".";
	replace I2 = I2 + ".0" if strlen(I2) == 2;
	
gen lci=LowerCI; //generate string lower CI for plotting on graph
	replace LowerCI=round(LowerCI, 0.01);
	tostring LowerCI, force replace;
	replace LowerCI = "(" + LowerCI; //add parenthesis
	replace LowerCI = "(0." + substr(LowerCI, 3, 5) if substr(LowerCI, 1, 2) == "(.";
	replace LowerCI = LowerCI + "0" if strlen(LowerCI) == 4;
	replace LowerCI="" if LowerCI=="(0.";

gen uci=UpperCI; //generate string upper CI for ploting on graph
	replace UpperCI=round(UpperCI, 0.01);
	tostring UpperCI, force replace;
	replace UpperCI = UpperCI + ")";
	replace UpperCI = substr(UpperCI, 1, 1) + ".00)" if substr(UpperCI, 2, .) == ")";
	replace UpperCI = substr(UpperCI, 1, 3) + "0)" if substr(UpperCI, 4, .) == ")";
	replace UpperCI = "21.90)" if UpperCI=="21.9)";
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
		text(26 0.18 "{bf:N}", size(vsmall)) text(26 160 "{bf:OR}", size(vsmall)) 
			text(26 320 "{bf:95% CI}", size(vsmall)) text(26 700 "{bf:I{superscript:2}(%)}", size(vsmall))
		xscale(range(0.5 750) log) xlab(0.25 0.5 1 2 5 10 20 50 100) xtitle("{bf:Odds ratio & 95% CI (log scale)}") ylab(none) ytitle("")	
		legend(off)  graphregion(color(white)) xsize(10) ysize(6) title("ICU vs Non-ICU", size(medium));

graph export "COVIDSR_Binary_ICU_GroupedForest.png", replace width(2400);


*******************************************************************************;

capture log close;
	
	
	