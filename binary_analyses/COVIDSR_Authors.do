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

Authors
*******************************************************************************/


#delimit;

log using "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922\00 Logs\00COVIDSR_Authors.log", replace;

cd "C:\Users\user\OneDrive - McGill University\PROJECTS\COVID Systematic Review\Data\20200922";

import excel "COVID-19 Authors - Systematic Literature Review 20200922", sheet("Authors") firstrow;

rename Key Zoterokey;

drop PublicationYear PublicationTitle G-CH;


*	Renaming Zotero keys;

replace Zotero="3LSGJJ58-DIAB" if Zotero=="3LSGJJ58";
replace Zotero="MJH7839I-UNDER50" if Zotero=="MJH7839I";
replace Zotero="P7S9CPSD-1" if Zotero=="P7S9CPSD";


replace Zotero = "3LSGJJ58-NONDIAB" in 186;
replace Author = "Shi, Qiao" in 186;
replace Zotero = "MJH7839I-OVER50" in 187;
replace Author = "Klang, Eyal" in 187;
replace Zotero = "P7S9CPSD-2" in 188;
replace Author = "Wang, Kun" in 188;
replace Zotero = "VN52PHAB-VAL" in 189;
replace Author = "Xie, Jianfeng" in 189;


*	Reformatting authors;

replace Author="Cao, Weiliang" if Z=="XR955MNP";
replace Author="Deng, Xiaowei" if Z=="GEHCFW6F";
replace Author="Herold, Tobias" if Z=="TIBAVX6J";
replace Author="Li, Kaiyan" if Z=="BPR7A47M";
replace Author="Liu, Yanli" if Z=="BQ2FZA7C";
replace Author="Wang, Yafei" if Z=="HQT79H5P";
replace Author="Wang, Zhihua" if Z=="RNETXBCW";
replace Author="Wu, Yingjie" if Z=="9WF9GBE5";
replace Author="Xu, Huayan" if Z=="CG3VT43E";
replace Author="Xu, Shen" if Z=="6JHBRBBS";
replace Author="Xu, Yonghao" if Z=="9ZZKBBU6";
replace Author="Yang, Penghui" if Z=="JEJXEQF7";


drop if Zotero=="";


*	Concatenate Author + Journal abbreviation;
rename Author author;

gen Author = author + " (" + Abbrevation + ")";

drop author Title;


*	Differentiate papers with identical authors/journals;
replace Author="Tang, Ning (JTH, 02/20)" if Z=="5HTSBVYA";
replace Author="Tang, Ning (JTH, 03/20)" if Z=="J8KXG38Q";

replace Author="Youbin, Liu (Preprint, 04/20)" if Z=="GT9MSVX9";
replace Author="Youbin, Liu (Preprint, 03/20)" if Z=="RZXU3XJK";

replace Author="Shi, Qiao (DC) Diabetic cohort" if Z=="3LSGJJ58-DIAB";
replace Author="Shi, Qiao (DC) Non-diabetic cohort" if Z=="3LSGJJ58-NONDIAB";

replace Author="Klang, Eyal (Oby) <50 cohort" if Z=="MJH7839I-UNDER50";
replace Author="Klang, Eyal (Oby) >50 cohort" if Z=="MJH7839I-OVER50";

replace Author="Wang, Kun (CID) Training cohort" if Z=="P7S9CPSD-1";
replace Author="Wang, Kun (CID) Validation cohort" if Z=="P7S9CPSD-2";

replace Author="Xie, Jianfeng (Preprint) Training cohort" if Z=="VN52PHAB";
replace Author="Xie, Jianfeng (Preprint) Validation cohort" if Z=="VN52PHAB-VAL";




*******************************************************************************;

*	Save dataset;
save "COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "01 Blood/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "02 Infections/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "03 Kidney/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "04 Liver/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "05 Heart/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "06 Coagulation/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "07 Clinical/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "08 Comorbidities/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "09 Medication/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

save "10 Symptoms/COVIDSR_Outcomes_AUTHORS_20200922 - data", replace;

capture log close;


