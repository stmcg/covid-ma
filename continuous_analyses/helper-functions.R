## Loading packages
library('metamedian')
library('metafor')
library('stringr')

## Loading unit/category link
units <- read.csv('./Data/Units_Categories.csv')

## Functions

## Find names of all outcome variables
get_all_outcome_names <- function(df){
  # Specifically gets all the unique values before _Mortality_N
  colnam <- colnames(df)
  pot_matches <- colnam[sub("_Mortality_N.*", "", colnam) != colnam]
  return(unique(sub("_.*", "", pot_matches)))
}

## Gets subset of data for an outcome
get_outcome_data <- function(df, outcome, group){
  if (group == 1){
    group1 <- 'Mortality'; group2 <- 'Survived'
  } else if (group == 2){
    group1 <- 'Hosp'; group2 <- 'Nonhosp'
  } else if (group == 3){
    group1 <- 'ICU'; group2 <- 'NonICU'
  } else if (group == 4){
    group1 <- 'Intub'; group2 <- 'Nonintub'
  }
  if (outcome == 'Age'){
    n.g1 <- df[, paste(group1, 'N', sep = '_')]
    n.g2 <- df[, paste(group2, 'N', sep = '_')]
  } else {
    n.g1 <- df[, paste(outcome, group1, 'N', sep = '_')]
    n.g2 <- df[, paste(outcome, group2, 'N', sep = '_')]
  }
  if (paste(outcome, group1, 'UpRange', sep = '_') %in% colnames(df)){
    uprange.g1 <- df[, paste(outcome, group1, 'UpRange', sep = '_')]
  } else {
    uprange.g1 <- rep(NA, nrow(df))
  }
  if (paste(outcome, group2, 'UpRange', sep = '_') %in% colnames(df)){
    uprange.g2 <- df[, paste(outcome, group2, 'UpRange', sep = '_')]
  } else {
    uprange.g2 <- rep(NA, nrow(df))
  }
  if (paste(outcome, group1, 'LowRange', sep = '_') %in% colnames(df)){
    lowrange.g1 <- df[, paste(outcome, group1, 'LowRange', sep = '_')]
  } else {
    lowrange.g1 <- rep(NA, nrow(df))
  }
  if (paste(outcome, group2, 'LowRange', sep = '_') %in% colnames(df)){
    lowrange.g2 <- df[, paste(outcome, group2, 'LowRange', sep = '_')]
  } else {
    lowrange.g2 <- rep(NA, nrow(df))
  }
  
  df <- data.frame(
    ID = df$Zoterokey, 
    
    n.g1 = n.g1,
    q1.g1 = df[, paste(outcome, group1, 'Q1', sep = '_')],
    med.g1 = df[, paste(outcome, group1, 'Median', sep = '_')],
    q3.g1 = df[, paste(outcome, group1, 'Q3', sep = '_')],
    mean.g1 = df[, paste(outcome, group1, 'Mean', sep = '_')],
    sd.g1 = df[, paste(outcome, group1, 'STDEV', sep = '_')],
    
    n.g2 = n.g2,
    q1.g2 = df[, paste(outcome, group2, 'Q1', sep = '_')],
    med.g2 = df[, paste(outcome, group2, 'Median', sep = '_')],
    q3.g2 = df[, paste(outcome, group2, 'Q3', sep = '_')],
    mean.g2 = df[, paste(outcome, group2, 'Mean', sep = '_')],
    sd.g2 = df[, paste(outcome, group2, 'STDEV', sep = '_')], 
    
    uprange.g1 =  uprange.g1,
    uprange.g2 = uprange.g2,
    
    lowrange.g1 = lowrange.g1,
    lowrange.g2 =lowrange.g2,
    
    author = df$Author
    
  )
  return(df)
}

## Cleans data sets (excludes studies that don't report appropriate summary data)
get_subsets <- function(df){
  ## Removes studies that don't report appropriate summary data 
  df <- df[
    !is.na(df$n.g1) & !is.na(df$n.g2) & 
      ((!is.na(df$med.g1) & !is.na(df$q1.g1) & !is.na(df$q3.g1)) | 
         (!is.na(df$mean.g1) & !is.na(df$sd.g1))) & 
      ((!is.na(df$med.g2) & !is.na(df$q1.g2) & !is.na(df$q3.g2)) | 
         (!is.na(df$mean.g2) & !is.na(df$sd.g2))), 
    ]
  if (nrow(df) > 0){
    row.names(df) <- 1:nrow(df)
  }
  
  ## Check that n.g1 are integers
  if (any(df$n.g1 %% 1 != 0)){
    print('n.g1 is not an integer')
    print(df[df$n.g1 %% 1 != 0,])
    stop()
  }
  ## Check that n.g2 are integers
  if (any(df$n.g2 %% 1 != 0)){
    print('n.g2 is not an integer')
    print(df[df$n.g2 %% 1 != 0,])
    stop()
  }
  
  if (is.character(df$uprange.g1)){
    df$uprange.g1 <- as.numeric(str_remove(df$uprange.g1, '.'))
  }
  if (is.character(df$uprange.g2)){
    df$uprange.g2 <- as.numeric(str_remove(df$uprange.g2, '.'))
  }
  if (is.character(df$lowrange.g1)){
    df$lowrange.g1 <- as.numeric(str_remove(df$lowrange.g1, '.'))
  }
  if (is.character(df$lowrange.g2)){
    df$lowrange.g2 <- as.numeric(str_remove(df$lowrange.g2, '.'))
  }
  
  # Find out which columns have characters
  temp <- sapply(df, class) == 'character'
  char_cols <- names(temp[temp])
  char_cols <- char_cols[! (char_cols %in% c("ID", "author"))]
  if (length(char_cols) > 0){
    print('Character columns: ')
    print(char_cols)
    stop()
  }
  
  ## Labels studies as reporting medians or means
  df$med_g1_ind <- !is.na(df$med.g1) & !is.na(df$q1.g1) & !is.na(df$q3.g1)
  df$med_g2_ind <- !is.na(df$med.g2) & !is.na(df$q1.g2) & !is.na(df$q3.g2)
  
  if (sum(df$med_g1_ind) > 0 | sum(df$med_g2_ind) > 0){
    df_medians <- df[df$med_g1_ind,]
    ## Checks that the quantiles are in the correct order in group 1
    cor_order_ind <- (df_medians$q3.g1 >= df_medians$med.g1) & 
      (df_medians$med.g1 >= df_medians$q1.g1) 
    if (!all(cor_order_ind)){
      print('Quartiles in group 1 are not in correct order')
      bad_ids <- df_medians[!cor_order_ind,]$ID
      print(df_medians[df_medians$ID %in% bad_ids,])
      stop()
    }
    df_medians <- df[df$med_g2_ind,]
    ## Checks that the quantiles are in the correct order in group 2
    cor_order_ind <- (df_medians$q3.g2 >= df_medians$med.g2) & 
      (df_medians$med.g2 >= df_medians$q1.g2) 
      if (!all(cor_order_ind)){
        print('Quartiles in group 2 are not in correct order')
        bad_ids <- df_medians[!cor_order_ind,]$ID
        print(df_medians[df_medians$ID %in% bad_ids,])
        stop()
      }
  } 
  
  return(df)
}

## Applies median-based methods
median_analysis <- function(df, outcome_name = 'NA'){
  if (nrow(df) >= 4){
    if (outcome_name %in% c('DDimer', 'TroponinI', 'CRP')){
      method <- 'DL'
    } else {
      method <- 'REML'
    }
    res_g1 <- qe(q1.g1 = df$q1.g1, med.g1 = df$med.g1, q3.g1 = df$q3.g1, 
                 mean.g1 = df$mean.g1, sd.g1 = df$sd.g1, n.g1 = df$n.g1,
                 method = method)
    res_g2 <- qe(q1.g1 = df$q1.g2, med.g1 = df$med.g2, q3.g1 = df$q3.g2, 
                 mean.g1 = df$mean.g2, sd.g1 = df$sd.g2, n.g1 = df$n.g2,
                 method = method)
    res_dif <- qe(q1.g1 = df$q1.g1, med.g1 = df$med.g1, q3.g1 = df$q3.g1, 
                  mean.g1 = df$mean.g1, sd.g1 = df$sd.g1, n.g1 = df$n.g1, 
                  q1.g2 = df$q1.g2, med.g2 = df$med.g2, q3.g2 = df$q3.g2, 
                  mean.g2 = df$mean.g2, sd.g2 = df$sd.g2, n.g2 = df$n.g2, 
                  method = method)
    res <- list(res_g1 = res_g1, res_g2 = res_g2, res_dif = res_dif)
  } else {
    res <- NULL
  }
  return(res)
}


# Creates a forest plot
save_forest_plot <- function(res, df, outcome, group, file, sensitivity = FALSE){
  if (!is.null(res)){
    if (!dir.exists('./Figures')){
      dir.create('./Figures')
    }
    if (!dir.exists(paste0('./Figures/', file))){
      dir.create(paste0('./Figures/', file))
    }
    if (!dir.exists(paste0('./Figures/', file, '/Funnel'))){
      dir.create(paste0('./Figures/', file, '/Funnel'))
    }
    if (!dir.exists(paste0('./Figures/', file, '/Forest'))){
      dir.create(paste0('./Figures/', file, '/Forest'))
    }
    if (group == 1){
      analysis <- 'Mortality_vs_Survived'
    } else if (group == 2){
      analysis <- 'Hosp_vs_Nonhosp'
    } else if (group == 3){
      analysis <- 'ICU_vs_NonICU'
    } else if (group == 4){
      analysis <- 'Intub_vs_Nonintub'
    } 
    res <- res$res_dif
    height <- max(round(nrow(df) / 1.8, 0), 5)
    out_name <- units[units$Outcome == outcome,]$Outcome.Name
    if ((outcome == 'DDimer' & group == 1) |
        (outcome == 'CRP' & group == 1)){
      width <- 15
    } else {
      width <- 14
    }
    
    # Forest plot
    if (sensitivity){
      forest_name <- paste0('./Figures/', file, '/Forest/Outcome=', outcome, 
                            '_Analysis=',analysis, '_Sensitivity.png')
      funnel_name <- paste0('./Figures/', file, '/Funnel/Outcome=', outcome, 
                            '_Analysis=',analysis, '_Sensitivity.png')
    } else {
      forest_name <- paste0('./Figures/', file, '/Forest/Outcome=', outcome, 
                           '_Analysis=',analysis, '.png')
      funnel_name <- paste0('./Figures/', file, '/Funnel/Outcome=', outcome, 
                            '_Analysis=',analysis, '.png')
    }
    forest_name
    bitmap(
      forest_name,
      height = height,
      width = width,
      units = 'cm',
      type = "png256",
      family = "Times", 
      res = 300
    )
    forest(res, header = c('Study', 'Difference of Medians [95% CI]'), 
           slab = df$author, xlab = paste0('Difference of Median ', out_name), 
           mlab = bquote(paste('RE Model (I'^'2', ' = ', .(round(res$I2, 2)), '%)', sep = '')))
    dev.off()
    
    # Funnel plot
    bitmap(
      funnel_name, 
      height = 8,
      width = 8,
      units = 'cm',
      type = "png256",
      family = "Times", 
      res = 300
    )
    funnel(res, xlab = paste0('Difference of Median ', out_name))
    dev.off()
  }
}

save_results <- function(file){
  if (!dir.exists(paste0('./Results'))){
    dir.create(paste0('./Results'))
  }
  save.image(paste0('./Results/', file, '.RData'))
}