
# Natalia Esquenazi Thesis 
# Import libraries 

library(tidyverse)
library(ggplot2)
library(dplyr)
library(summarytools)
library(moments)
library(stargazer)
library(MASS)
library(texreg)
library(Hmisc)
library(texreg)
library(tidyr)
library(readxl)
library(hrbrthemes)
library(fixest)
library(modelsummary)
library(estimatr)
library(texreg)
library(plm)
library(readxl)

# Setting working directory
setwd("C:/Users/usuario/Desktop/Masters Degree CEU/Thesis")

# Import survey
df <- read_excel("C:/Users/usuario/Desktop/Masters Degree CEU/Thesis/caf-capacidades-financieras-argentina-2017.xlsx")

## Building Indicators -------------------------------------------------------

# Financial Knowledge 
# Question 1
table(df$K2)

df <- df %>%
  mutate(knowledge1 = ifelse(K2 == 200000, 1, 0))

table(df$knowledge1)

# Question 2
table(df$K3)

df <- df %>%
  mutate(knowledge2 = ifelse(K3 == "Menos de lo que podrían comprar hoy", 
                             1, 0))

table(df$knowledge2)

# Question 3
table(df$K4)

df <- df %>%
  mutate(knowledge3 = ifelse(K4 == 0, 
                             1, 0))

table(df$knowledge3)

# Question 4
table(df$K5)

df <- df %>%
  mutate(knowledge4 = ifelse(K5 == 102000, 
                             1, 0))

table(df$knowledge4)

# Question 5
table(df$K6)

df <- df %>%
  mutate(knowledge5 = ifelse(K6 == "Más de $110.000", 
                             1, 0))

table(df$knowledge5)

# Question 6
table(df$K7_1_K7)

df <- df %>%
  mutate(knowledge6 = ifelse(K7_1_K7 == "VERDADERO", 
                             1, 0))

table(df$knowledge6)

# Question 7
table(df$K7_2_K7)

df <- df %>%
  mutate(knowledge7 = ifelse(K7_2_K7 == "VERDADERO", 
                             1, 0))

table(df$knowledge7)

# Question 8
table(df$K7_3_K7)

df <- df %>%
  mutate(knowledge8 = ifelse(K7_3_K7 == "VERDADERO", 
                             1, 0))

table(df$knowledge8)

# Creating the index as a summ of variables - scale between 0 and 10

financial_knowledge <- df %>%
  select(knowledge1,knowledge2, knowledge3, knowledge4, knowledge5,
         knowledge6, knowledge7, knowledge8) 

financial_knowledge <- financial_knowledge %>%
  mutate(sum_variable = knowledge1 + knowledge2 + knowledge3 + 
           knowledge4 + knowledge5 + knowledge6 + knowledge7 + knowledge8)














