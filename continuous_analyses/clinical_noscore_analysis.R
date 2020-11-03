## Loading helper functions and data
rm(list = ls())
source('helper-functions.R')
df <- read.csv('./Data/COVIDSR_Clinical_MERGE_v13_NOSCORE.csv')
df[df$Author == "Nowak, Błażej (PAMW)",]$Author <- "Nowak, Blazej (PAMW)"
file <- 'Clinical'
get_all_outcome_names(df)



################################################################################
## Outcome: O2SatNoOx
################################################################################
outcome <- 'O2SatNoOx'

## Comparison: Mortality vs Survived
group <- 1
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Hospitalized vs Survived
group <- 2
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: ICU vs Non-ICU
group <- 3
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Intubated vs Non-Intubated
group <- 4
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)



################################################################################
## Outcome: O2SatOx
################################################################################
outcome <- 'O2SatOx'

## Comparison: Mortality vs Survived
group <- 1
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Hospitalized vs Survived
group <- 2
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: ICU vs Non-ICU
group <- 3
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Intubated vs Non-Intubated
group <- 4
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)



################################################################################
## Outcome: RespRate
################################################################################
outcome <- 'RespRate'

## Comparison: Mortality vs Survived
group <- 1
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Hospitalized vs Survived
group <- 2
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: ICU vs Non-ICU
group <- 3
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)


## Comparison: Intubated vs Non-Intubated
group <- 4
do.call("<-",list(paste0(outcome, group), 
                  get_outcome_data(df = df, outcome = outcome, group = group)))
do.call("<-",list(paste0(outcome, group, 'clean'), 
                  get_subsets(get(paste0(outcome, group)))))
set.seed(2020)
do.call("<-",list(paste0(outcome, group, 'res'), 
                  median_analysis(get(paste0(outcome, group, 'clean')))))
save_forest_plot(get(paste0(outcome, group, 'res')), 
                 get(paste0(outcome, group, 'clean')), 
                 outcome, group = group, file = file)



save_results(file = file)
