library(shiny)
library(shinythemes)

# Define UI for Aplication that shows ALL
ui <- fluidPage(
  
  
  
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
                     "ID" = "ID")
                 )
                 
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
    tabPanel("Tab 2",
             p("This section has no content yet")
      
    ), # tab Panel 2 closing bracket
  
    # set tab panel 3
    tabPanel("Tab 3",
            p("This section has no content yet")
           
    ) # tab Panel 3 closing bracket
    
  ) # tab set Panel closing bracket
) # fluid Page closing bracket
  
    
  
