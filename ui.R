library(shiny)
library(shinythemes)

# Define UI for Application that shows ALL
ui <- fluidPage(
  
  theme = shinytheme("slate"),
  
  # Application title
  titlePanel("ALL-Dashboard"),
  
  # Set tabset Panels
  tabsetPanel(
    
    # set tab Panel 1
    tabPanel("Tab 1",

          # sidebar Panel
          sidebarLayout(
            sidebarPanel(h4("This is our SidebarPanel:"),
                         p("This is the section where our Users can choose the things they want to investigate"),
                         helpText("Toggle your Option on/off wich you want to see in the table"),
                         checkboxGroupInput(
                           "tab_opt", "Table toggle Options", 
                           c("age" = "age",
                             "Cholesterine" = "chol",
                             "Diet" = "diet",
                             "sex" = "gender",
                             "height" = "height",
                             "Smoker" = "smoking",
                             "Tumor Size" = "tumour_size",
                             "weight" = "weight",
                             "ID" = "ID"),
                           selected = 
                             c("age" = "age",
                               "Cholesterine" = "chol",
                               "Diet" = "diet",
                               "sex" = "gender",
                               "height" = "height",
                               "Smoker" = "smoking",
                               "Tumor Size" = "tumour_size",
                               "weight" = "weight",
                               "ID" = "ID")
                         ),
                         selectInput("sel_opt",
                                     "Sort your table",
                                     choices = c("Ascedent"= "asc",
                                                 "Descedent" = "desc"),
                         ),
                         sliderInput("inage",
                                     "Age Intervall",
                                     min = 0,
                                     max = 100,
                                     value = c(1,30))
            ),
            
    
            # Show a plot of the smokers and years 
            mainPanel(h1("This is our Main Panel:", align = "center"),br(),
                      h5(strong("This Plot shows an Example of Smokers and their age:")),br(),
                          plotOutput("smokersPlot"),br(),
                      h5(strong("This example show the Head of our Database of Cancer Data:")),br(),
                          tableOutput("tableCancer")
                      
                      ) # main panel closing bracket
    
            ) # side bar layout closing bracket
    
    ), # tab Panel 1 closing bracket  
  
    # set tab panel 2
    tabPanel("About Leukämie", br(),
             p(tags$a(href="https://flexikon.doccheck.com/de/Leukämie", "doccheck")),
             h3('About this R Shiny App'),br(),
             p('Shiny Visualization. R Shiny App for ALL dataset'),br(), 
             p('Wahlfach R und Shiny Apps, Sommersemester 2022'),br(), 
             p('Version 1.0'),br(),
             p('Last update: 23-MAY-2022'),br(),
             p('Used packages: tidyverse (1.3.0), shiny (1.6.0)'),br(), 
             p('Author: Moritz Stengel')
      
    ), # tab Panel 2 closing bracket
  
    # set tab panel 3
    tabPanel("Tab 3",
            p("This section has no content yet")
           
    ) # tab Panel 3 closing bracket
    
  ) # tab set Panel closing bracket
) # fluid Page closing bracket
  
    
  
