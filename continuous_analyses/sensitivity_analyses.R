## Loading helper functions and data
rm(list = ls())
source('helper-functions.R')
df <- read.csv('./Data/COVIDSR_Heart_MERGE_v13.csv')
file <- 'Heart'

################################################################################
## Outcome: DDimer
################################################################################
outcome <- 'DDimer'

## Comparison: Mortality vs Survived
group <- 1
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
DDimer1clean <- DDimer1clean[(DDimer1clean$ID != '7CAQ5CRL'),]

set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')), 
                                  outcome_name = outcome)))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file, sensitivity = TRUE)

## Comparison: ICU vs Non-ICU
group <- 3
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
DDimer3clean <- DDimer3clean[!(DDimer3clean$ID %in% c('BQ2FZA7C', 'H6TRPFU5', 'TIGUKN74')),]

set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')), 
                                  outcome_name = outcome)))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file, sensitivity = TRUE)


## Loading helper functions and data
df <- read.csv('./Data/COVIDSR_Infections_MERGE_v13.csv')
df[df$Author == "Nowak, Błażej (PAMW)",]$Author <- "Nowak, Blazej (PAMW)"
file <- 'Infections'


################################################################################
## Outcome: CRP
################################################################################
outcome <- 'CRP'

## Comparison: Mortality vs Survived
group <- 1
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
CRP1clean <- CRP1clean[!(CRP1clean$ID %in% c('VN52PHAB-VAL', 'VN52PHAB')),]

set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')), 
                                  outcome_name = outcome)))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file, sensitivity = TRUE)


save_results(file = 'Sensitivity')
