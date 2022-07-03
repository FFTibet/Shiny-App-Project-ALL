source("global_source.R")

# Define UI for Application that shows ALL
ui <- fluidPage(
  theme = shinytheme("sandstone"),
  
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
      h1(em(
        "Willkommen zu unserem Leukaemie Dashboard !"
      ), Style = "color: grey; font-size:40px"),
      
      withMathJax(includeMarkdown("aboutapp.md"))
      
    ),
    
    
    tabPanel(
      icon = icon("info"),
      "Ueber Leukaemie",
      
      mainPanel(withMathJax(includeMarkdown("general.md"))),
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
          
          tabPanel("Haemoglobin",
                   
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
        
      ),
      
      withMathJax(includeMarkdown("bloodtable.md"))
      
    ),
    tabPanel(
      "Datensatz",
      icon = icon("list-alt"),
      fluidRow(h2("Dataset")),
      column(
        2,
        checkboxGroupInput(
          inputId = "check_choices_input",
          label = "Select columns",
          choices = check_choices,
          selected = check_choices
        ),
      ),
      column(10, dataTableOutput(outputId = "table"))
    ),
    tabPanel(
      icon=icon("cube"),
      "Data Visualisation",
      navbarPage(
        title =
          "Graphics",
        tabPanel(
          "Scatterplot",
          h2("Scatterplot"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "scat_var_x",
              "Choose variable for x",
              choices = label_options,
              selected = "age"
            ),
            (
              selectInput(
                inputId = "scat_var_y",
                "Choose variable for y",
                choices = label_options,
                selected = "hemoglobine"
              )
            ),
            (
              selectInput(
                inputId = "scat_var_group",
                "Choose grouping variable",
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
              "Choose variable for x",
              choices =  label_options,
              selected = "gbt"
            ),
            (
              selectInput(
                inputId = "box_var_group",
                "Choose grouping variable",
                choices =  label_options,
                selected = "alcohol"
              )
            )
          ),
          mainPanel(plotOutput("box"))),
        ),
        tabPanel(
          "Histogram",
          h2("Histogram"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "histo_var_x",
              "Choose variable for x",
              choices =  label_options,
              selected = "wbc"
            )
          ),
          mainPanel(plotOutput("histo")))
        ),
        tabPanel(
          "Smooth Line Chart",
          h2("Smooth Line Chart"),
          sidebarLayout(sidebarPanel(
            selectInput(
              inputId = "sline_var_x",
              "Choose variable for x",
              choices = label_options,
              selected = "age"
            ),
            (
              selectInput(
                inputId = "sline_var_y",
                "Choose variable for y",
                choices = check_choices,
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
      sidebarPanel(
        h5("Zusammenfassung"),
        br(),
        selectInput(
          inputId = "column",
          "Suchen Sie eine Variable aus",
          choice = sel_input_table,
          selected = "age"
        ),
        
        
        
      ),
      mainPanel(tabsetPanel(
        tabPanel(title = "Statistik",
                 
                 verbatimTextOutput("summary"))
      ))
      
      
      
      
      
    ),
    tabPanel("Über uns",
             icon = icon("user-friends"),
             
             
             
             mainPanel(
               tabsetPanel(
                 tabPanel(title = "Hind Bayasi"),
                 tabPanel(title = "Alexander Heimbuch"),
                 tabPanel(title = "Arlinda Mucaj"),
                 tabPanel(title = "Moritz Stengel")
                 
                 
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