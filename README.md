# covid-ma

## Description 

This repository contains the data and code used for the analyses in “Can we predict the severe course of COVID-19  – a systematic review and meta-analysis of indicators of clinical outcome?”

## Binary data analyses

The folders “Mortality - Meta analysis binary”, “ICU - Meta analysis (binary)”, “Hospitalization - Meta analysis (binary)”, and “Intubation - Meta analysis (binary)” contain the do-files and input data sets for the mortality, ICU, hospitalization, and intubation analyses, respectively.

Data cleaning
- The “COVID-19 Outcomes - Systematic Literature Review 20200922” file is the initial, uncleaned data sets for the analyses
- The “COVID-19 Authors - Systematic Literature Review 20200922.xlsx” file contains additional information (e.g., author names) from the primary studies
- The “COVIDSR_Authors.do”, “COVIDSR_General_Cleanup.do”, and “COVIDSR_Outcomes_Cleanup.do” files perform some initial data cleaning
- The folders for continuous data (01 Blood - 07 Clinical) contain do-file for cleaning data in these respective categories
- The folders for binary data (08 Comorbidities - 10 Symptoms) contain do-files for cleaning data in these respective categories

These analyses were originally run on Stata version 16.1.  


## Continuous data analyses

The file “summary_tables.R” creates all figures and tables in the manuscript concerning continuous indicators. When running the code, all figures and tables will be saved in “Figures” and “Tables” folders and all results will be saved in .RData files in a “Results” folder

Helper functions and data cleaning
- The file “helper-functions.R” contains numerous helper functions used in the data cleaning and analysis
- The files “age_analysis.R”, “blood_analysis.R”, “clinical_noscore_analysis.R”, “coagulation_analysis.R”, “kidney_analysis.R”, “liver_analysis.R”, “heart_analysis.R”, and “infections_analysis.R” contain helper functions that run the data cleaning and analysis for the indicators in these respective categories

These analyses were originally run on R version 4.0.2 with packages `metamedian` (version 0.1.5), `metafor` (version 2.4-0), and `stringr` (version 1.4.0).
