library(shiny)
library(shinythemes)
library(datasets)

# set global variabels for choices
check_choices <- c("ID","age","chol","diet","gender","height","smoking","weight","previousdiseasinfam","surroundings","diagnose",
                   "alcohol","bmi","eosinphils","monocytes","lymphocytes","neutrophiles","gbt","wbc","rbc","hemoglobine","creatinine")

# set global variables for Table summary
sel_input_table <- c("age", "chol", "height", "weight", "bmi","eosinphils", "monocytes","lymphocytes","neutrophiles",
                     "gbt","wbc","rbc","hemoglobine","creatinine")


# Define UI for Application that shows ALL
ui <- fluidPage(theme = shinytheme("sandstone"),
                
                navbarPage(
                  p(strong("ALL - Dashboard")),
                  tabPanel(
                    icon = icon("home"),
                    
                    br(),
                    img(
                      src = 'leukemiabild.png',
                      align = "center",
                      height = "230 px"
                    ),
                    
                    br(),
                    br(),
                    h1(em("Willkommen zu unserem Leukaemie Dashboard !"), Style = "color: grey; font-size:40px"),
                    
                    withMathJax(includeMarkdown("aboutapp.md"))
                    
                  ),
                  
                  
                  tabPanel( icon = icon("info"),
                    "Ueber Leukaemie",
                    
                    mainPanel(
                      withMathJax(includeMarkdown("general.md"))
                    ),
                    br(),
                    br(),
                    
                    mainPanel(
                      tabsetPanel(
                        tabPanel(
                          "Pathophysiologie",
                          
                          p(
                            withMathJax(includeMarkdown("patho.md"))
                          ),
                          br(),
                        ),
                        
                        tabPanel(
                          "Ursachen",
                          
                          p(
                            withMathJax(includeMarkdown("causes.md"))
                          ),
                          br()
                        ),
                        
                        
                        tabPanel(
                          "Symptome",
                          p(
                            withMathJax(includeMarkdown("symptoms.md"))
                          ),
                          br(),
                          
                        ),
                        
                        tabPanel(
                          "Diagnostik",
                          p(
                            withMathJax(includeMarkdown("diagnosis.md"))
                          ),
                          br(),
                          
                        ),
                        
                        
                        tabPanel(
                          "Therapie",
                          p(
                            withMathJax(includeMarkdown("therapy.md"))
                            
                          ),
                          br(),
                          
                        ),
                      )
                    ),
                  ),
                  tabPanel(icon = icon("book-medical"),
                    "Blutwerte",
                    
                    mainPanel(
                      img(
                        src = 'blood.png',
                        align = "center",
                        height = "160 px"
                      ),
                    ),
                    br(),
                    br(),
                    
                    mainPanel(
                      tabsetPanel(
                        tabPanel(
                          "Erythrozyten",
                          
                          p(
                            withMathJax(includeMarkdown("erys.md"))
                          ),
                          br(),
                        ),
                        
                        tabPanel(
                          "Haemoglobin",
                          
                          p(
                            withMathJax(includeMarkdown("hemo.md"))
                          ),
                          br()
                        ),
                        
                        
                        tabPanel(
                          "Leukozyten",
                          p(
                            withMathJax(includeMarkdown("leuk.md"))
                          ),
                          br(),
                          
                        ),
                        
                        tabPanel(
                          "Kreatinin",
                          p(
                            withMathJax(includeMarkdown("creatinine.md"))
                          ),
                          br(),
                          
                        ),
                        
                        
                        tabPanel(
                          "GBT",
                          p(
                            withMathJax(includeMarkdown("gbt.md"))
                            
                          ),
                          br(),
                          
                        ),
                        tabPanel(
                          "Differentialblutbild",
                          p(
                            withMathJax(includeMarkdown("dif.md"))
                          ),
                          br(),
                          
                        ),
                      ),
                      
                    ),
                    
                    withMathJax(includeMarkdown("bloodtable.md"))
                    
                  ),
                  tabPanel("Datensatz",
                           icon = icon("list-alt"), fluidRow(h2("Dataset")),
                           column(
                             2,
                             checkboxGroupInput(
                               inputId = "check_choices_input", label = "Select columns",
                               choices = check_choices, selected = check_choices
                             ),
                           ),
                           column(10, dataTableOutput(outputId = "table"))
                           
                  ),
                  
                  tabPanel(
                    "Datenvisualisierung",
                    
                    
                    navlistPanel(
                      
                      # add to every graphic a description and comparison to mean values of healthy humans 
                      tabPanel("Liver and alcohol",
                               
                               # gbt to alcohol (and bmi)
                               plotOutput("boxplot_gbt_alc")
                               
                      ),
                      
                      
                      tabPanel("white blood cells and age",
                               
                               # age to white blood cells (and gender, smoker)
                               plotOutput("ggplot_age_wbc")
                               
                      ),
                      
                      
                      
                      tabPanel("hemoglobin and age",
                               
                               # age to hemoglobin (and gender)
                               plotOutput("ggplot_age_hemoglobine")
                               
                      ),
                      
                      
                      
                      tabPanel("erythrocyten and age",
                               
                               # age to rbc (and gender, smoker)
                               plotOutput("ggplot_age_rbc")
                               
                      ),
                      
                      
                      tabPanel("Reactive Plot",
                               
                               verticalLayout(
                                 a(href="https://shiny.rstudio.com/reference/shiny/0.14/verticalLayout.html", "Link One"),
                                 a(href="https://shiny.rstudio.com/reference/shiny/0.14/verticalLayout.html", "Link Two"),
                                 a(href="https://shiny.rstudio.com/reference/shiny/0.14/verticalLayout.html", "Link Three"
                                 ),
                                 
                               )
                               
                               
                      ),
                      
                    )
                    
                    
                  ),
                  
                  
                         
                      tabPanel("Tabellen",
                       icon = icon("table"),
                       sidebarPanel(h5("Zusammenfassung"), br(),
                         selectInput(
                           inputId ="column","Suchen Sie eine Variable aus",
                           choice= sel_input_table, selected = "age"
                           ),
                                    
                                    
                                    
                       ),
                       mainPanel(
                         tabsetPanel(
                           tabPanel(
                             title = "Statistik",
                            
                             verbatimTextOutput("summary")
                             
                             
                             
                           )
                         )
                       )
                                    
                                
                
                                    
                  
                )))
                
                
                
         

           
     #M?gliche Ausgaben
#selectInput(inputId ="stable","Suchen Sie eine Variable aus",choices=check_choices),
#fileInput("csv_input", "Select CSV File to Import", accept = ".csv"),
#selectInput("num_var","Nummerical Variable 1", choices=c(not_sel)),
# actionButton("run_button", "Run Analysis", icon=icon("play"))
#selectInput(inputId ="stable","Suchen Sie eine Variable aus",choices=check_choices)
#tableOutput(outputId = "stable")



#Markdown einbilden mithilfe von:
#https://stackoverflow.com/questions/33499651/rmarkdown-in-shiny-application