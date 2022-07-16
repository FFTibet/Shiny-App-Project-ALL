library(tidyverse)
library(ggplot2)
library(data.table)
library(shiny)
library(shinythemes)
library(datasets)
library(shinyBS)


# labels as names and variables
label_options <-
  c(
    "--Keine Auswahl--" = "None",
    "Alter" = "age",
    "Cholesterin" = "chol",
    "Ernährung" = "diet",
    "Geschlecht" = "gender",
    "Größe" = "height",
    "Rauchen" = "smoking",
    "Gewicht" = "weight",
    "Erkankungen in der Familie" = "previousdiseasinfam",
    "Radioaktivität" = "surroundings",
    "Diagnose" = "diagnose",
    "Alkoholkonsum" = "alcohol",
    "BMI" = "bmi",
    "Eosinophile Granulozyten" = "eosinphils",
    "Monozyten " = "monocytes",
    "Lymphozyten" = "lymphocytes",
    "Neutrophile Granulozyten" = "neutrophiles",
    "Leberenzym" = "gbt",
    "Leukozyten" = "wbc",
    "Erythrozyten" = "rbc",
    "Hämoglobin" = "hemoglobine",
    "Kreatinin" = "creatinine"
  )

# varibales for grouping
label_options_group_b <-
  c(
    "--Keine Auswahl--" = "None",
    "Ernährung" = "diet",
    "Geschlecht" = "gender",
    "Rauchen" = "smoking",
    "Erkankungen in der Familie" = "previousdiseasinfam",
    "Radioaktivität" = "surroundings",
    "Diagnose" = "diagnose",
    "Alkoholkonsum" = "alcohol"
  )
# set global variabels for choices
check_choices <- c("--Keine Auswahl--" = "None",
                   "Alter" = "age",
                   "Cholesterin" = "chol",
                   "Ernährung" = "diet",
                   "Geschlecht" = "gender",
                   "Größe" = "height",
                   "Rauchen" = "smoking",
                   "Gewicht" = "weight",
                   "Erkankungen in der Familie" = "previousdiseasinfam",
                   "Radioaktivität" = "surroundings",
                   "Diagnose" = "diagnose",
                   "Alkoholkonsum" = "alcohol",
                   "BMI" = "bmi",
                   "Eosinophile Granulozyten" = "eosinphils",
                   "Monozyten " = "monocytes",
                   "Lymphozyten" = "lymphocytes",
                   "Neutrophile Granulozyten" = "neutrophiles",
                   "Leberenzym" = "gbt",
                   "Leukozyten" = "wbc",
                   "Erythrozyten" = "rbc",
                   "Hämoglobin" = "hemoglobine",
                   "Kreatinin" = "creatinine")

check_choices_input <- c("ID" = "ID",
                         "Alter" = "age",
                         "Cholesterin" = "chol",
                         "Ernährung" = "diet",
                         "Geschlecht" = "gender",
                         "Größe" = "height",
                         "Rauchen" = "smoking",
                         "Gewicht" = "weight",
                         "Erkankungen in der Familie" = "previousdiseasinfam",
                         "Radioaktivität" = "surroundings",
                         "Diagnose" = "diagnose",
                         "Alkoholkonsum" = "alcohol",
                         "BMI" = "bmi",
                         "Eosinophile Granulozyten" = "eosinphils",
                         "Monozyten " = "monocytes",
                         "Lymphozyten" = "lymphocytes",
                         "Neutrophile Granulozyten" = "neutrophiles",
                         "Leberenzym" = "gbt",
                         "Leukozyten" = "wbc",
                         "Erythrozyten" = "rbc",
                         "Hämoglobin" = "hemoglobine",
                         "Kreatinin" = "creatinine")
# set global variables for Table summary
sel_input_table <- c(
"Alter" = "age",
"Cholesterin" = "chol",
"Größe" = "height",
"Gewicht" = "weight",
"BMI" = "bmi",
"Eosinophile Granulozyten" = "eosinphils",
"Monozyten " = "monocytes",
"Lymphozyten" = "lymphocytes",
"Neutrophile Granulozyten" = "neutrophiles",
"Leberenzym" = "gbt",
"Leukozyten" = "wbc",
"Erythrozyten" = "rbc",
"Hämoglobin" = "hemoglobine",
"Kreatinin" = "creatinine"
)

#set global variables for freq
freq_table <- c(
"Ernährung" = "diet",
"Geschlecht" = "gender",
"Rauchen" = "smoking",
"Erkankungen in der Familie" = "previousdiseasinfam",
"Radioaktivität" = "surroundings",
"Diagnose" = "diagnose",
"Alkoholkonsum" = "alcohol"
)

# set Text for the popover
popover_txt <- paste0(
  "Dieser Bereich erklärt die im Datensatz gezeigten"," ", strong("Tabellennamen ")," ", "und ihre zugehörigen"," ", strong("Werte"),".",br(), br(),
  "# Das Geschlecht steht in der Spalte Gender", br(),
  "Männlich = 0 ",br(), "Weiblich = 1", br(), br(),
  "# Das Rauchverhalten steht in der Spalte Smoking", br(),
  "Nichtraucher = 0 ",br(), "Raucher = 1", br(), br(),
  "# Die Spalte previousdeseaseinfam beschreibt die Anzahl an Vorerkrankungen innerhalb der Familie", br(), br(),
  "# Die Spalte surroundings beschreibt die Anzahl der Berührungspunkte mit radioaktiver Strahlung", br(),
  " Kein Kontakt = 1", br(), "Mäßigen Kontakt = 2", br(), "Häufigen Kontakt = 3", br(), br(), 
  "# Die Spalte diagnose beschreibt, vor wievielen Jahren Leuk?mie diagnostiziert wurde", br(), br(),
  "# Die Spalte alcohol beschreibt die Häufigkeit des Alcoholkonsums", br(),
  "Kein/kaum Alkoholkonsum = 0", br(), "Regelmäßiger Alkoholkonsum = 1" 
)

