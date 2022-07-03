library(tidyverse)
library(ggplot2)
library(data.table)
library(shiny)
library(shinythemes)
library(datasets)


# labels as names and variables
label_options <-
  c(
    "ID"="ID",
    "Alter" = "age",
    "
Cholesterin" = "chol",
    "Diet" = "diet",
    "Gender" = "gender",
    "Height" = "height",
    "Smoking" = "smoking",
    "Weight" = "weight",
    "Previous disease in Family" = "previousdiseasinfam",
    "Surroundings" = "surroundings",
    "Diagnose" = "diagnose",
    "Alcohol" = "alcohol",
    "Body mass index" = "bmi",
    "Eosinophilic granulocyte" = "eosinphils",
    "Monocytes " = "monocytes",
    "Lymphocytes" = "lymphocytes",
    "Neutrophiles" = "neutrophiles",
    "Glutamat pyruvat transaminase" = "gbt",
    "White blood cells" = "wbc",
    "Red blood cells" = "rbc",
    "Hemoglobine" = "hemoglobine",
    "Creatinine" = "creatinine"
  )

# set global variabels for choices
check_choices <- c("ID","age","chol","diet","gender","height","smoking","weight","previousdiseasinfam","surroundings","diagnose",
                   "alcohol","bmi","eosinphils","monocytes","lymphocytes","neutrophiles","gbt","wbc","rbc","hemoglobine","creatinine")

# set global variables for Table summary
sel_input_table <- c("age", "chol", "height", "weight", "bmi","eosinphils", "monocytes","lymphocytes","neutrophiles",
                     "gbt","wbc","rbc","hemoglobine","creatinine")
