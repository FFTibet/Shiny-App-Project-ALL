library(tidyverse)

cancer_data <- read_csv("cancer_data.csv")

cancer_data <- select(cancer_data, -tumour_size) #Entfernt Spalte tumour_size, da diese f¸r ALL nicht relevant ist

set.seed(3)

#wbc

wbcfirst <- sample(30:150,300,replace=TRUE)
wbcfirstround <- wbcfirst/10

wbcsecond <- sample(99:200,300,replace=TRUE)
wbcsecondround <- wbcsecond/10


wbcthird <- sample(30:115,300,replace=TRUE)
wbcthirdround <- wbcthird/10


#hemoglobine
hemofirst <-sample(99:230,300,replace=TRUE)
hemofirstround <- hemofirst/10
hemosecond <- sample(89:210,300,replace=TRUE)
hemosecondround <- hemosecond/10
hemothird <- sample(97:200,300,replace=TRUE)
hemothirdround <- hemothird/10
hemofourth <- sample(87:170,300,replace=TRUE)
hemofourthround<- hemofourth/10
hemofifth<- sample(90:200,300,replace=TRUE)
hemofifthround<- hemofifth/10

#creatinine
creafirst <- sample(6:20,300,replace=TRUE)
creafirstround <- creafirst/10

creasecond <- sample (5:19,300,replace=TRUE)
creasecondround <- creasecond/10


#rbc
rbcfirst <- sample(40:100, 300, replace=TRUE)
rbcfirstround <-rbcfirst/10

rbcsecound <-sample(35:90, 300, replace=TRUE)
rbcsecoundround <- rbcsecound/10

rbcthird <-sample(38:70, 300, replace=TRUE)
rbcthirdround <- rbcthird/10

rbcfourth <- sample(35:65, 300, replace=TRUE)
rbcfourthround <- rbcfourth/10

rbcfifth <- sample(32:70, 300, replace=TRUE)
rbcfifthround <-rbcfifth/10

#Alter anpassen
set.seed(3)
cancer_data<-cancer_data %>% mutate(age= 
                                      case_when(
                                        ID <= 15 ~ sample(3:8,300, replace = TRUE),
                                        ID <= 60 ~ sample(10:20,300, replace = TRUE), 
                                        ID <= 80 ~ sample(55:88,300, replace = TRUE), 
                                        ID <= 110 ~ sample(55:88,300, replace = TRUE),
                                        ID <= 160 ~ sample(60:88,300, replace = TRUE), 
                                        ID <= 210 ~ sample(5:8,300, replace = TRUE), 
                                        ID <= 230 ~ sample(11:40,300, replace = TRUE), 
                                        ID <= 300 ~ sample(61:88,300, replace = TRUE)))

#https://bookdown.org/joone/ComputationalMethods/workingwithdata.html
#https://databraineo.com/data-science/set-seed/
#http://mawu.org/homepages/nerdfield/?p=3
#https://statologie.de/umkodieren-werte-r/
#https://www.produnis.de/R/Kapitel-RGrundlagen.html

#Epidemiologie
#https://www.kompetenznetz-leukaemie.de/content/aerzte/all/epidemiologie/
#table(cancer_data$age)

#uebersicht <- table(cancer_data$age)
#barplot(uebersicht)

#Koerpergroessen anpassen
#https://www.kita.de/wissen/koerpergroesse-kinder/ 

cancer_data<-cancer_data %>% mutate(height= 
                                      case_when(
                                        
                                        age <= 4 & gender == 0 ~ sample(95:105,300, replace = TRUE),
                                        age <=4 & gender == 1 ~ sample(90:100,300, replace = TRUE),
                                        
                                        age <=7 & gender == 0 ~ sample(105:130,300, replace = TRUE),
                                        age <=7 & gender == 1 ~ sample(99:125,300, replace = TRUE),
                                        
                                        age <= 11 & gender == 0 ~ sample(125:145,300, replace = TRUE),
                                        age <=11 & gender == 1 ~ sample(123:140,300, replace = TRUE),
                                        
                                        age <=15 & gender == 0 ~ sample(150:165,300, replace = TRUE),
                                        age <=15 & gender == 1 ~ sample(140:165,300, replace = TRUE),
                                        
                                        age >= 16 & gender == 0 ~ sample(160:195,300, replace = TRUE),
                                        age >= 16 & gender == 1 ~ sample(150:185,300, replace = TRUE)))




##Gewicht anpassen
##https://www.netmoms.de/magazin/kinder/kindesentwicklung/kinder-gewichtstabelle-2-10-jahre/

cancer_data <- cancer_data %>% mutate(weight= 
                                        case_when(
                                          
                                          age <= 4 & gender == 0 ~ sample(11:20,300, replace = TRUE),
                                          age <=4 & gender == 1 ~ sample(11:20,300, replace = TRUE),
                                          
                                          age <=7 & gender == 0 ~ sample(17:32,300, replace = TRUE),
                                          age <=7 & gender == 1 ~ sample(14:30,300, replace = TRUE),
                                          
                                          age <= 11 & gender == 0 ~ sample(31:47,300, replace = TRUE),
                                          age <=11 & gender == 1 ~ sample(25:45,300, replace = TRUE),
                                          
                                          age <=15 & gender == 0 ~ sample(47:70,300, replace = TRUE),
                                          age <=15 & gender == 1 ~ sample(45:75,300, replace = TRUE),
                                          
                                          age >= 16 & gender == 0 ~ sample(69:155,300, replace = TRUE),
                                          age >= 16 & gender == 1 ~ sample(57:130,300, replace = TRUE)
                                        ))                                  



#Cholesterin anpassen
#https://www.kinderaerzte-im-netz.de/krankheiten/blutfettwerte-erhoehte-hypercholesterinaemie/symptome-krankheitsbild/


cancer_data <- cancer_data %>% mutate(chol= 
                                        case_when(
                                          age <= 17 & gender == 0 ~ sample(151:202,300, replace = TRUE),
                                          age <=17 & gender == 1 ~ sample(156:228,300, replace = TRUE),
                                          
                                          age >= 18 & gender == 0 ~ sample(150:250,300, replace = TRUE),
                                          age >=18 & gender == 1 ~ sample(158:260,300, replace = TRUE)
                                        ))


#Raucher anpassen
cancer_data <- cancer_data %>% mutate(smoking= 
                                        case_when( age < 18 ~ sample(0:0,300,replace=TRUE),
                                                   age >=18 ~ sample(0:1,300,replace=TRUE,
                                                                     prob=c(0.35,0.65))
                                        ))  %>%
  
  #HINZUGEF‹GTE VARIABLEN:
  #abgebildet wird, wieviele Vorerkrankungen es in der Familie gab  
  mutate(previousdiseasinfam= sample(0:3, 300, replace= TRUE)) %>%
  
  #surroundings beschreibt, ob die Person einer radioaktiver Stahlung ausgesetzt war/ist z.B. durch Arbeit
  #1=keinen Kontakt 2=maessigen Kontakt 3=haeufigen Kontakt                                        
  mutate(surroundings=sample(1:3, 300, replace=TRUE,
                             prob=c(0.25,0.35,0.40))) %>%
  
  #beschreibt, vor wievielen Jahren die Person diagnostiziert wurde
  mutate(diagnose =        case_when(
    cancer_data$age < 6 ~ sample(1:2, 300, replace= TRUE),
    cancer_data$age >= 6 ~ sample(1:5, 300, replace= TRUE)) )  %>%
  
  #Konsumiert die Person regelm‰ﬂig Alkohol, 0= nein, 1=ja
  
  mutate(alcohol =       case_when(
    age < 18 ~ sample(0:0, 300, replace= TRUE),
    age >= 18 ~ sample(0:1, 300, replace=TRUE, prob=c(0.4,0.6)))) %>%
  
  #BMI berechnen
  mutate(bmi = weight / ( (height / 100)^2) )    %>%
  
  
  
  # Groﬂes Blutbild: eosinphils, monocytes, lymphocytes, neutrophils
  #eosinphils
  mutate(eosinphils = runif(300, min=0.03, max= 0.075)) %>%
  
  #monocytes
  mutate(monocytes = runif(300, min=0.03, max= 0.1)) %>%
  #view(monocytes)
  
  #lymphocytes
  mutate(lymphocytes = runif(n=300, min = 0.10, max = 0.57)) %>%
  #view(lymphocytes)
  
  #neutrophiles
  mutate(neutrophiles = 1-lymphocytes - eosinphils - monocytes) %>% 
  
  
  #gbt (Leberwerte)
  mutate(gbt = case_when(
    gender == 0 & alcohol == 0  ~ sample(17:60, 300, replace= TRUE),
    gender == 1 & alcohol == 0 ~ sample(20:63, 300, replace= TRUE),
    gender == 0 & alcohol == 1 ~ sample(30:70, 300, replace= TRUE),
    gender == 1 & alcohol == 1 ~ sample(35:73, 300, replace= TRUE),
    gender == 0 & bmi < 25 ~ sample(17:60, 300, replace= TRUE),
    gender == 0 & bmi >= 25 ~ sample(30:70, 300, replace= TRUE),
    gender == 1 & bmi < 25 ~ sample(20:63, 300, replace= TRUE),
    gender == 1 & bmi >= 25 ~ sample(35:73, 300, replace= TRUE))) %>%
  
  
  #wbc (Leukozyten)
  #wir haben erst ein 10faches der gew√ºnschten Zufallszahlen generiert, diese dann durch 10 geteilt, um eine Dezimalzahl zu bekommen
  #Diese Variablen wurden dann bei case_when f√ºr den wbc-Wert eingesetzt
  
  mutate(wbc =   case_when(
    age < 18 ~ wbcfirstround,
    age >= 18 & smoking==1 ~ wbcsecondround,
    age >= 18 & smoking==0 ~ wbcthirdround)) %>%
  
  
  #rbc (Erythrocyten)
  mutate(rbc = case_when(
    smoking ==1 & gender==0 & age >=18 ~ rbcfirstround,
    smoking ==1 & gender==1 & age >=18 ~ rbcsecoundround,
    smoking ==0 & gender==0 & age >=18 ~ rbcthirdround,
    smoking ==0 & gender==1 & age >=18 ~ rbcfourthround,
    age < 18 ~ rbcfifthround )) %>%
  
  
  
  #Hemoglobin
  mutate(hemoglobine =  case_when(
    smoking ==1 & gender==0 & age >=18 ~ hemofirstround,
    smoking ==1 & gender==1 & age >=18 ~ hemosecondround,
    smoking ==0 & gender==0 & age >=18 ~ hemothirdround, 
    smoking ==0 & gender==1 & age >=18 ~ hemofourthround,
    age < 18 ~ hemofifthround   )) %>%
  
  #Creatinin (Nierenwerte)
  mutate(creatinine = case_when(
    gender==0 ~ creafirstround,
    gender==1 ~ creasecondround)) 

#Spalte ID an die erste Position von DataFrame in R verschieben
cancer_data <- cancer_data %>% dplyr::select(ID, 
                                             everything())
view(cancer_data)

library(data.table)
fwrite(cancer_data, "C:\\Users\\muarl\\Desktop\\cancer_data.csv")

#https://www.netdoktor.de/laborwerte/gpt-erhoeht/
#https://www.lifeline.de/diagnose/laborwerte/kreatinin-id47722.html#:~:text=Der%20Kreatininwert%20(Abk%C3%BCrzung%3A%20KREA%20oder,auf%20Nierensch%C3%A4den%20oder%20chronische%20Nierenerkrankungen