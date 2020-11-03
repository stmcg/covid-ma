## Running analyses
rm(list = ls())
source('age_analysis.R')
source('blood_analysis.R')
source('clinical_noscore_analysis.R')
source('coagulation_analysis.R')
source('heart_analysis.R') 
source('infections_analysis.R') 
source('kidney_analysis.R')
source('liver_analysis.R')
source('sensitivity_analyses.R')

## Loading helper functions and data
rm(list = ls())
source('helper-functions.R')
load('./Results/Age.RData')
load('./Results/Blood.RData')
load('./Results/Clinical.RData')
load('./Results/Coagulation.RData')
load('./Results/Heart.RData')
load('./Results/Infections.RData')
load('./Results/Kidney.RData')
load('./Results/Liver.RData')


# Getting the relevant outcome names
all_objects <- ls()
res1_objects <- all_objects[sub("1res.*", "", all_objects) != all_objects]
res2_objects <- all_objects[sub("2res.*", "", all_objects) != all_objects]
res3_objects <- all_objects[sub("3res.*", "", all_objects) != all_objects]
res4_objects <- all_objects[sub("4res.*", "", all_objects) != all_objects]


## Function for making tables
create_table <- function(outcome_objects, analysis){
  # analysis = 1: group 1; analysis = 2: group 2; analysis = 3: dif
  res_tab <- data.frame(Outcome = rep(NA, length(outcome_objects)), 
                        N = rep(NA, length(outcome_objects)), 
                        Estimate = rep(NA, length(outcome_objects)), 
                        I2 = rep(NA, length(outcome_objects)), 
                        Range = rep(NA, length(outcome_objects)), 
                        Category = rep(NA, length(outcome_objects)))
  for (i in 1:length(outcome_objects)){
    temp <- get(outcome_objects[i])
    temp <- temp[[analysis]]
    if (!is.null(temp)){
      var_name <- sub("\\dres.*", "", outcome_objects[i])
      res_tab[i,]$Outcome <- units[units$Outcome == var_name,]$Outcome.Name
      res_tab[i,]$Category <- units[units$Outcome == var_name,]$Category
      res_tab[i,]$N <- temp$k
      res_tab[i,]$Estimate <- paste0(round(temp$beta, 2), ' [', 
                                     round(temp$ci.lb, 2), ', ', 
                                     round(temp$ci.ub, 2), ']')
      res_tab[i,]$I2 <- round(temp$I2, 2)
      dat <- get(paste0(var_name, analysis, 'clean'))
      if (!all(is.na(c(dat$lowrange.g1, dat$lowrange.g2)))){
        lb <- min(c(dat$lowrange.g1, dat$lowrange.g2), na.rm = T)
      } else {
        lb <- NA
      }
      if (!all(is.na(c(dat$uprange.g1, dat$uprange.g2)))){
        ub <- max(c(dat$uprange.g1, dat$uprange.g2), na.rm = T)
      } else {
        ub <- NA
      }
      res_tab[i,]$Range <- paste0('[', round(lb, 2), ', ', round(ub, 2), ']')
    }
  }
  res_tab <- res_tab[!is.na(res_tab$Estimate),]
  
  cat_order <- c('demographic', 'Clinical', 'Lab, Blood', 'Lab, Coagulation', 
                 'Lab, Liver', 'Lab, Kidney', 'Lab, Infection', 'Lab, Heart')
  res_tab <- res_tab[order(match(res_tab$Category, cat_order)), ]
  row.names(res_tab) <- 1:nrow(res_tab)
  
  return(res_tab)
}

# Creating tables
table1a <- create_table(res1_objects, analysis = 1)
table1b <- create_table(res1_objects, analysis = 2)
table1c <- create_table(res1_objects, analysis = 3)

table2a <- create_table(res2_objects, analysis = 1)
table2b <- create_table(res2_objects, analysis = 2)
table2c <- create_table(res2_objects, analysis = 3)

table3a <- create_table(res3_objects, analysis = 1)
table3b <- create_table(res3_objects, analysis = 2)
table3c <- create_table(res3_objects, analysis = 3)

table4a <- create_table(res4_objects, analysis = 1)
table4b <- create_table(res4_objects, analysis = 2)
table4c <- create_table(res4_objects, analysis = 3)


if (!dir.exists(paste0('./Tables'))){
  dir.create(paste0('./Tables'))
}

write.csv(table1a, './Tables/Mortality_Continuous.csv', row.names = FALSE)
write.csv(table1b, './Tables/Survived_Continuous.csv', row.names = FALSE)
write.csv(table1c, './Tables/Mortality_vs_Survived_Continuous.csv', row.names = FALSE)

write.csv(table2a, './Tables/Hosp_Continuous.csv', row.names = FALSE)
write.csv(table2b, './Tables/Nonhosp_Continuous.csv', row.names = FALSE)
write.csv(table2c, './Tables/Hosp_vs_Nonhosp_Continuous.csv', row.names = FALSE)

write.csv(table3a, './Tables/ICU_Continuous.csv', row.names = FALSE)
write.csv(table3b, './Tables/nonICU_Continuous.csv', row.names = FALSE)
write.csv(table3c, './Tables/ICU_vs_nonICU_Continuous.csv', row.names = FALSE)

write.csv(table4a, './Tables/Intub_Continuous.csv', row.names = FALSE)
write.csv(table4b, './Tables/Nonintub_Continuous.csv', row.names = FALSE)
write.csv(table4c, './Tables/Intub_vs_Nonintub_Continuous.csv', row.names = FALSE)




add_pooled <- function(outcome_name){
  res1 <- get(paste0(outcome_name, '1res'))
  res2 <- get(paste0(outcome_name, '3res'))
  
  if (!is.null(res1) & !is.null(res2)){
    out_name <- units[units$Outcome == outcome_name,]$Outcome.Name
    
    ests <- c(res1[[1]]$beta, res1[[2]]$beta, 
              res2[[1]]$beta, res2[[2]]$beta)
    ci.lbs <- c(res1[[1]]$ci.lb, res1[[2]]$ci.lb, 
                res2[[1]]$ci.lb, res2[[2]]$ci.lb)
    ci.ubs <- c(res1[[1]]$ci.ub, res1[[2]]$ci.ub, 
                res2[[1]]$ci.ub, res2[[2]]$ci.ub)
    ys <- c(5,4,2,1)
    
    par(mar = c(5.1, 9.1, 4.1, 2.1))
    plot(x = ests, y = ys, 
         xlim = c(min(c(0, ci.lbs)), max(c(0, ci.ubs))), 
         ylim=c(0.5,5.5), yaxt='n', ylab = "",
         frame.plot = FALSE,
         xlab= paste0("Pooled Median ", out_name), pch=16, cex=2)
    arrows(x0=ci.lbs, y0=ys, 
           x1=ci.ubs, y1=ys, 
           code=3, angle=90, 
           length=0.1, col="black", lwd=1)
    axis(2, las=2, tick = F, at = ys,
         labels = c('Mortality', 'Survived', 
                    'ICU', 'Non-ICU'))
    
    if (outcome_name == 'CRP'){
      range.lb <- 0; range.ub <- 19
    } else if (outcome_name == 'DDimer'){
      range.lb <- 0; range.ub <- 0.5
    } else if (outcome_name == 'LDH'){
      range.lb <- 9; range.ub <- 270
    } else if (outcome_name == 'Leukocyte'){
      range.lb <- 3.5; range.ub <- 11
    } else if (outcome_name == 'Lymphocyte'){
      range.lb <- 0.9; range.ub <- 4
    } else if (outcome_name == 'Neutrophil'){
      range.lb <- 1.5; range.ub <- 8
    }
    
    rect(range.lb,0,range.ub,10,col = rgb(0.5,0.5,0.5,1/4))
  }
}
selected_outcomes <- units[units$Selection == 1,]$Outcome

pdf('./Figures/Continuous_Summary.pdf', width = 8, height = 8)
par(mfrow=c(3,2))
add_pooled(selected_outcomes[1])
add_pooled(selected_outcomes[2])
add_pooled(selected_outcomes[3])
add_pooled(selected_outcomes[4])
add_pooled(selected_outcomes[5])
add_pooled(selected_outcomes[6])
dev.off()

