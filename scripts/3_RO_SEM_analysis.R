#### R sscript for Structural Equation Modeling of mammals in Romania ####
### Marissa A. Dyck ###
## Last edited: 2024-02-14 ##
# Analysis for Dyck et al., 2024 ..... #

# Currently there is a bug with piecewiseSEM and rmarkdown so the summary doesn't print tests of directed separation, running in a basic r script instead of r markdown

# Notes -------------------------------------------------------------------

# 
# A few notes about this script.
# 
# If you are want to run through the full analysis with the published data make sure you download the whole (Romania_SEM repository)[https://github.com/marissadyck/Romania_SEM] from Marissa Dyck's GitHub. This will ensure you have all the files, data, and proper folder structure you will need to run this code and associated analyses.
# 
# Also make sure you open RStudio through the R project (Romania_SEM.Rproj) this will automatically set your working directory to the correct place (wherever you saved the repository) and ensure you don't have to change the file paths for the data. 
# 
# If you have question please email the author,   
# 
# Marissa A. Dyck   
# Postdoctoral research fellow    
# University of Victoria    
# School of Environmental Studies     
# Email: [marissadyck17@gmail.com](marissadyck17@gmail.com)    



# R version ---------------------------------------------------------------

# Before starting you should ensure you have the latest version of R and RStudio downloaded. This code was generated under R version 4.2.3 and with RStudio version 2024.12.0+467 .    
# 
# You can download R and RStudio (https://posit.co/download/rstudio-desktop/)   


# Install packages --------------------------------------------------------

# If you don't already have the following packages installed, use the code below to install them.

install.packages('tidyverse') 
install.packages('piecewiseSEM') 
install.packages("PerformanceAnalytics")
install.packages("purrrlyr")



# Load libraries ----------------------------------------------------------

# Then load the packages to your library for this current session.

library(piecewiseSEM) # used to run piecewise structural equation models
library(tidyverse)  # data tidying, visualization, and much more; this will load all tidyverse packages, can see complete list using tidyverse_packages()
library(PerformanceAnalytics) # generates correlation chart
library(purrrlyr) # data manipulation



# Data --------------------------------------------------------------------

# import data and scale predictor variables
ro_sem_dat <- read_csv('data/processed/ro_sem_data_effort_2018-2019.csv') %>% 
  
  # scale predictor variables
  mutate(z.s = scale(z),
         denslocalr.s = scale(denslocalr),
         tri5.s = scale(tri5),
         clc_forest.s = scale(clc_forest))


# Analysis ----------------------------------------------------------------

# The code chunks below define the models for our three hypotheses including the hypothesized model and final optimized models
# 
# * top-down  
# * bottom-up   
# * combined    





# Top-down: hypothesis ---------------------------------------------------


sem.top_down_a <- 
  psem(
    
    # lynx structured equation
    glm(lynx ~ denslocalr.s + 
          clc_forest.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wolf structured equation
    glm(wolf ~ denslocalr.s + 
          clc_forest.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # fox structured equation
    glm(fox ~ lynx + 
          wolf, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wildcat structured equation
    glm(wild_cat ~ fox + 
          lynx + 
          wolf +
          z.s + 
          tri5.s + 
          clc_forest.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # hare structured equation
    glm(hare ~ lynx + 
          wild_cat + 
          fox, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # red deer structured equation
    glm(red_deer ~ wolf, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # roe deer structured equation
    glm(roe_deer ~ wolf + 
          lynx, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # boar structured equation
    glm(wild_boar ~ wolf, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # correlatated errors
    (lynx %~~% wolf)
  )

# note correlated errors are added for two reasons - 1) when independence claims that have non-symmetrical p-values that may effect if we reject the model/pathway thus a direction needs to be specified or the path removed from the basis set (via correlated error), and 2) when variables are correlated/signficant independence claim but it's suspected this is due to a separate common cause as opposed to a causal relationship between the two variables. 
# check model summary
summary(sem.top_down_a)


# Top-down: optimized ----------------------------------------------------

# Now, based on the tests of directed separation, we will add significant pathways to model that make biological sense and fit hypotheses (top-down) and remove non-significant pathways with coefficient estimates that do not fit the hypothesis (e.g. positive estimate for a hypothesized negative causal pathway) and deemed ecologically unlikely

sem.top_down_b <- 
  psem(
    # lynx structured equation
    glm(lynx ~ tri5.s +
        clc_forest.s, # non-significant, opposite direction of hypothesis - but keeping as ecologically plausible
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # wolf structured equation
    glm(wolf ~ denslocalr.s + 
          clc_forest.s + # non-significant - keeping
          z.s + # added as ecologically significant missing path
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # fox structured equation
    glm(fox ~ lynx + 
          wolf + 
          z.s + # added as ecologically significant missing path
          clc_forest.s, # added as ecologically significant missing path
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # wildcat structured equation
    glm(wild_cat ~ # fox opposite direction of hypothesis - removed
          lynx + 
         # wolf non-significant, opposite direction of hypothesis - removed
          z.s + 
          # tri5.s , non-significant, opposite direction of hypothesis - removed???
          clc_forest.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    glm(hare ~ # lynx # non-significant, opposite direction of hypothesis - removed
          # fox non-significant, opposite direction of hypothesis - removed
          wild_cat, # non-significant - keeping
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # no structured equations for red_deer, roe_deer, or wild_boar due to no retained top-down variables after optimization

    # correlated errors
    (lynx %~~% wolf), # asymmetric p-value
    (wild_cat %~~% fox) # positive coef, correlation likely due to underlying ecological process
  )

# model summary
summary(sem.top_down_b)


# Bottom-up: hypothesis ---------------------------------------------------

sem.bottom_up_a <- 
  psem(
    # boar structured equation
    glm(wild_boar ~ clc_forest.s + 
          denslocalr.s + 
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # roe deer structured equation
    glm(roe_deer ~ clc_forest.s + 
          denslocalr.s + 
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # red deer structured equation
    glm(red_deer ~ clc_forest.s + 
          z.s + 
          denslocalr.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # hare structured equation
    glm(hare ~ clc_forest.s + 
          denslocalr.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wildcat structured equation
    glm(wild_cat ~ hare, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # fox structured equation
    glm(fox ~ hare, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wolf structured equation
    glm(wolf ~ red_deer + 
          wild_boar + 
          roe_deer, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # lynx structured equation
    glm(lynx ~ hare + 
          roe_deer, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # correlated errors
    (roe_deer %~~% wild_boar), # asymmetrical p-value
    (red_deer %~~% wild_boar), # asymmetrical p-value
    (hare %~~% wild_boar), # asymmetrical p-value
    (roe_deer %~~% red_deer), # asymmetrical p-value
    (roe_deer %~~% hare), # asymmetrical p-value
    (red_deer %~~% hare) # asymmetrical p-value
  )


# model summary
summary(sem.bottom_up_a)


# Bottom-up: optimized ----------------------------------------------------

# And again,  based on the tests of directed separation, we will add significant pathways to model that make biological sense and fit hypotheses (top-down) and remove non-significant pathways and pathways with coefficient estimates that do not fit the hypothesis (e.g. positive estimate for a hypothesized negative causal pathway)

sem.bottom_up_b <- 
  psem(
    # boar structured equation
    glm(wild_boar ~ clc_forest.s + 
          denslocalr.s + 
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # roe deer structured equation
    glm(roe_deer ~ clc_forest.s + 
          # denslocalr.s + insignificant predictor, opposite direction of hypothesis - removed ??
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # red deer structured equation
    glm(red_deer ~ clc_forest.s + 
          z.s + # insignificant predictor - kept in model
          denslocalr.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # hare structured equation
    glm(hare ~  # denslocalr.s + insignificant predictor, opposite direction of hypothesis - removed 
          clc_forest.s +  # insignificant predictor - kept in model
          tri5.s + # added as ecologically significant missing path
          z.s, # added as ecologically significant missing path
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # # wildcat structured equation
    # glm(wild_cat ~ hare, # insignificant predictor, opposite direction of hypothesis - removed
    #     family = poisson(link = 'log'), data = ro_sem_dat),
    
    # fox structured equation
    glm(fox ~ hare, # insignificant predictor - kept in model
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wolf  structured equation
    glm(wolf ~ red_deer + # insignificant predictor - kept in model
          wild_boar + 
          roe_deer, # insignificant predictor - kept in model
        family = poisson(link = 'log'), data = ro_sem_dat),
    # lynx structured equation
    glm(lynx ~ hare, 
        # roe_deer insignificant predictor, opposite direction of hypothesis - removed
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # correlated errors 
    (roe_deer %~~% wild_boar), # asymmetrical p-value
    (red_deer %~~% wild_boar), # asymmetrical p-value
    (hare %~~% wild_boar), # asymmetrical p-value
    (roe_deer %~~% red_deer), # asymmetrical p-value
    (roe_deer %~~% hare), # asymmetrical p-value
    (red_deer %~~% hare), # asymmetrical p-value
    (fox %~~% wild_boar),  # correlation likely due to underlying ecological process
    (lynx %~~% wild_boar), # correlation likely due to underlying ecological process
    (fox %~~% roe_deer), # correlation likely due to underlying ecological process
    (wolf %~~% lynx) # correlation likely due to underlying ecological process
  )

# model summary
summary(sem.bottom_up_b)


# Combined model ----------------------------------------------------------


sem.combined <- 
  psem(
    # lynx structured equation
    glm(lynx ~ tri5.s + 
          clc_forest.s + # check direction
          hare, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wolf structured equation
    glm(wolf ~ z.s + 
          tri5.s + 
          clc_forest.s +
          denslocalr.s + 
          # red_deer + # insignificant predictor, opposite direction of hypothesis - removed
          roe_deer +
          wild_boar, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # fox structured equation
    glm(fox ~ z.s + 
          clc_forest.s +
          hare +
          wolf + 
          lynx,
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wildcat structured equation
    glm(wild_cat ~ clc_forest.s + 
          z.s + 
          lynx, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # hare structured equation
    glm(hare ~ tri5.s + 
          clc_forest.s + # non-significant - keeping
          z.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # red deer structured equation
    glm(red_deer ~ clc_forest.s + 
          z.s + # non-significant - keeping
          denslocalr.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # roe deer structured equation
    glm(roe_deer ~ clc_forest.s + 
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # boar structured equation
    glm(wild_boar ~ clc_forest.s + 
          denslocalr.s + 
          z.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    
    # correlated errors - orrelation likely due to underlying ecological process
    (lynx %~~% wolf), 
    (wild_boar %~~% hare), 
    (roe_deer %~~% hare),
    (red_deer %~~% hare), 
    (wild_boar %~~% red_deer),
    (red_deer %~~% roe_deer),
    (wild_boar %~~% roe_deer),
    (wild_cat %~~% fox),
    (red_deer %~~% lynx),
    (wolf %~~% hare),
    (wild_cat %~~% wild_boar),
    (wild_cat %~~% roe_deer),
    (wild_cat %~~% red_deer),
    (lynx %~~% wild_boar),
    (fox %~~% wild_boar),
    (fox %~~% roe_deer)
  )

summary(sem.combined,
        conserve = TRUE) # added due to assymetric p-value for tests of directed separation between roe deer and lynx



# TESTS -------------------------------------------------------------------

# these sections of code were exploratory to better understand how correlations vs conserve=TRUE and scaling of variables affect model outputs

# Conserve + TRUE test --------------------------------------------------------------------
sem.top_down_test <- 
  psem(
    
    # lynx structured equation
    glm(lynx ~ denslocalr.s + 
          clc_forest.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wolf structured equation
    glm(wolf ~ denslocalr.s + 
          clc_forest.s + 
          tri5.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # fox structured equation
    glm(fox ~ lynx + wolf, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # wildcat structured equation
    glm(wild_cat ~ fox + 
          lynx + 
          z.s + 
          tri5.s + 
          clc_forest.s, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # hare structured equation
    glm(hare ~ lynx + 
          wild_cat + 
          fox, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # red deer structured equation
    glm(red_deer ~ wolf, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # roe deer structured equation
    glm(roe_deer ~ wolf + 
          lynx, 
        family = poisson(link = 'log'), data = ro_sem_dat),
    # boar structured equation
    glm(wild_boar ~ wolf, family = poisson(link = 'log'), data = ro_sem_dat)
  )

# check model summary
summary(sem.top_down_test,
        conserve = TRUE)


# Scaling test ------------------------------------------------------------

scale_test.un <- 
  psem(
    glm(lynx ~ denslocalr + 
          z +
          wolf,
        family = poisson(link = 'log'), data = ro_sem_dat),
    glm(wolf ~ tri5,
        family = poisson(link = 'log'), data = ro_sem_dat)
  )

summary(scale_test.un)

scale_test.s <- 
  psem(
    glm(lynx ~ denslocalr.s + 
          z.s +
          wolf,
        family = poisson(link = 'log'), data = ro_sem_dat),
    glm(wolf ~ tri5.s,
        family = poisson(link = 'log'), data = ro_sem_dat)
  )

summary(scale_test.s)
   