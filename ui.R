source("global_source.R")

# Define UI for Application that shows ALL
ui <- fluidPage(
  theme = shinytheme("sandstone"),
  
  navbarPage(
    p(strong("ALL - Shiny App")),
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
      h1(em(
        "Willkommen zu unserer Leukämie - Shiny App!"
      ), Style = "color: grey; font-size:40px"),
      
      withMathJax(includeMarkdown("aboutapp.md"))
      
    ),
    
    
    tabPanel(
      icon = icon("info"),
      "Über Leukämie",
      
      mainPanel(HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/8jtw3OcLi3Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')),
      br(),
      br(),
      
      mainPanel(
        tabsetPanel(
          tabPanel("Pathophysiologie",
                   
                   p(withMathJax(
                     includeMarkdown("patho.md")
                   )),
                   br(), ),
          
          tabPanel("Ursachen",
                   
                   p(withMathJax(
                     includeMarkdown("causes.md")
                   )),
                   br()),
          
          
          tabPanel("Symptome",
                   p(withMathJax(
                     includeMarkdown("symptoms.md")
                   )),
                   br(), ),
          
          tabPanel("Diagnostik",
                   p(withMathJax(
                     includeMarkdown("diagnosis.md")
                   )),
                   br(), ),
          
          
          tabPanel("Therapie",
                   p(withMathJax(
                     includeMarkdown("therapy.md")
                   )),
                   br(), ),
        )
      ),
    ),
    tabPanel(
      icon=icon("tint"),
      "Blutwerte",
      
      mainPanel(img(
        src = 'blood.png',
        align = "center",
        height = "160 px"
      ), ),
      br(),
      br(),
      
      mainPanel(
        tabsetPanel(
          tabPanel("Erythrozyten",
                   
                   p(withMathJax(
                     includeMarkdown("erys.md")
                   )),
                   br(), ),
          
          tabPanel("Hämoglobin",
                   
                   p(withMathJax(
                     includeMarkdown("hemo.md")
                   )),
                   br()),
          
          
          tabPanel("Leukozyten",
                   p(withMathJax(
                     includeMarkdown("leuk.md")
                   )),
                   br(), ),
          
          tabPanel("Kreatinin",
                   p(withMathJax(
                     includeMarkdown("creatinine.md")
                   )),
                   br(), ),
          
          
          tabPanel("GBT",
                   p(withMathJax(
                     includeMarkdown("gbt.md")
                   )),
                   br(), ),
          tabPanel("Differentialblutbild",
                   p(withMathJax(
                     includeMarkdown("dif.md")
                   )),
                   br(), ),
        ),
        
      
      
      withMathJax(includeMarkdown("bloodtable.md"))
      ),
    ),
    tabPanel(
      "Datensatz",
      icon = icon("list-alt"),
      h2(strong("Datensatz")),
      sidebarLayout(sidebarPanel(
        # Initialisierung des Popover Buttons mit hilfe des shinyBS Pakets
        bsButton("q1", label = "", icon = icon("question"),
                 style = "default", size = "extra-small"),
        
        # Initialisierung des Popover mit dem shinyBS Paket
        bsPopover(id = "q1", title = "Hilfe zur Erklärung der Spalte: ",
                  content = popover_txt,
                  placement = "right", 
                  trigger = "hover", 
                  options = list(container = "body")
        ),
        
        
        checkboxGroupInput(
          inputId = "check_choices_input",
          label = "Wähle die Spalte aus:",
          choices = check_choices_input,
          selected = check_choices_input
        ),
        
        
        width = 3
      ),
      
      mainPanel(dataTableOutput(outputId = "table"))
      ), ),
    tabPanel(
      icon=icon("cube"),
      "Datenvisualisierung",
      navbarPage(
        title =
          "Grafiken",
        tabPanel(
          "Scatterplot",
          h2("Scatterplot"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "scat_var_x",
              "Wähle eine Variable X aus",
              choices = label_options,
              selected = "age"
            ),
            (
              selectInput(
                inputId = "scat_var_y",
                "Wähle eine Variable Y aus",
                choices = label_options,
                selected = "hemoglobine"
              )
            ),
            (
              selectInput(
                inputId = "scat_var_group",
                "Wähle die Gruppierungsvariable aus",
                choices = label_options,
                selected = "smoking"
              )
            )
          ),
          mainPanel(plotOutput("scatterplotss")))
        ),
        tabPanel(
          "Boxplot",
          h2("Boxplot"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "box_var_x",
              "Wähle eine Variable X aus",
              choices =  label_options,
              selected = "gbt"
            ),
            (
              selectInput(
                inputId = "box_var_group",
                "Wähle die Gruppierungsvariable aus",
                choices =  label_options_group_b,
                selected = "alcohol"
              )
            )
          ),
          mainPanel(plotOutput("box"))),
        ),
        tabPanel(
          "Histogramm",
          h2("Histogramm"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "histo_var_x",
              "Wähle eine Variable X aus",
              choices =  label_options,
              selected = "wbc"
            )
          ),
          mainPanel(plotOutput("histo")))
        ),
        tabPanel(
          "Liniendiagramm",
          h2("Liniendiagramm"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "sline_var_x",
              "Wähle eine Variable X aus",
              choices = label_options,
              selected = "age"
            ),
            (
              selectInput(
                inputId = "sline_var_y",
                "Wähle eine Variable Y aus",
                choices = label_options,
                selected = "height"
              )
            ),
          ),
          mainPanel(plotOutput("sline")))
        ),
      )
    ),
    
    
    
    tabPanel(
      "Tabellen",
      icon = icon("columns"),
      sidebarLayout(sidebarPanel(
        h5("Lagemaße"),
        selectInput(
          inputId = "column",
          "Wähle eine Variable aus",
          choice = sel_input_table,
          selected = "age"
          
        ),
        
      ),
      mainPanel(tabsetPanel(
        tabPanel(title = "Lagemaße",
                 
                 verbatimTextOutput("summary")))),
      
      ),
      
      sidebarLayout(sidebarPanel(
        h5("Häufigkeiten"),
        selectInput(
          inputId = "column2",
          "Wähle eine Variable aus",
          choice = freq_table,
          selected = "bmi"
          
        ),
        
      ),
      
      
      mainPanel(tabsetPanel(
        tabPanel(title = "Häufigkeiten",
                 
                 verbatimTextOutput("freq")))),
      ),
      
      
      sidebarLayout(sidebarPanel(
        h5("Regression"),
        selectInput(
          inputId = "column3",
          "Wähle eine Zielgröße aus",
          choice = check_choices ,
          selected = "age"
          
        ),(
          selectInput(
            inputId = "column4",
            "Wähle eine Einflussgröße aus",
            choice = check_choices ,
            selected = "bmi"
            
            
            
          )
        ),
      ),
      
      mainPanel(tabsetPanel(
        tabPanel(title = "Regression",
                 
                 verbatimTextOutput("reg"))),
        
      )
      )
    ),
    
    
    
    tabPanel("Über uns",
             icon = icon("user-friends"),
             
             
             
             mainPanel(
               tabsetPanel(
                 tabPanel(title = "Hind Bayasi",br(),
                          mainPanel("Hochschule: Technische Hochschule Ulm", br(),br(),
                                    "Studiengang: Data Science in der Medizin", br(),br(),
                                    "Semester: 5", br(),br(),
                                    "Email-Adresse: bayasi@mail.hs-ulm.de", br(),br(),
                                    )),
                 
                      
                 tabPanel(title = "Alexander Heimbuch", br(),
                          mainPanel("Hochschule: Technische Hochschule Ulm", br(),br(),
                                    "Studiengang: Data Science in der Medizin", br(),br(),
                                    "Semester: 5", br(),br(),
                                    "Email-Adresse: heimbuch@mail.hs-ulm.de", br(),br(), )),
                 tabPanel(title = "Arlinda Mucaj", br(),
                          mainPanel("Hochschule: Technische Hochschule Ulm", br(),br(),
                                    "Studiengang: Data Science in der Medizin", br(),br(),
                                    "Semester: 5", br(),br(),
                                    "Email-Adresse: amucaj@mail.hs-ulm.de", br(),br(),)),
                 tabPanel(title = "Moritz Stengel", br(),
                          mainPanel("Hochschule: Technische Hochschule Ulm", br(),br(),
                                    "Studiengang: Informationsmanagement im Gesundheitswesen", br(),br(),
                                    "Semester: 8", br(),br(),
                                    "Email-Adresse: stengel@mail.hs-ulm.de", br(),br(),)),
                 
                 
               )
             ))
  )
)






#M?gliche Ausgaben
#selectInput(inputId ="stable","Suchen Sie eine Variable aus",choices=check_choices),
#fileInput("csv_input", "Select CSV File to Import", accept = ".csv"),
#selectInput("num_var","Nummerical Variable 1", choices=c(not_sel)),
# actionButton("run_button", "Run Analysis", icon=icon("play"))
#selectInput(inputId ="stable","Suchen Sie eine Variable aus",choices=check_choices)
#tableOutput(outputId = "stable")



#Markdown einbilden mithilfe von:
#https://stackoverflow.com/questions/33499651/rmarkdown-in-shiny-application