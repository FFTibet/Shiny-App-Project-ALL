library(tidyverse)
library(ggplot2)

# Define server logic required to draw a plot in shiny ALL App
server <- function(input, output) {
  
  
    # initialize given cancer data via cancer_data.csv
    df <- read.csv("cancer_data.csv", header =TRUE)
    
    # giva an output of the dataframe
    output$tableCancer <- renderTable(head(df))
    
    
    # generate input smoking based on input$smoking from ui.R
    output$smokersPlot <- renderPlot({
      
      df %>% 
        ggplot(aes( x=age, y=smoking)) +
        geom_col() +
        theme_bw() +
        labs( x = "Patient Age in Years",
              y = "Patient habit of Smoking")
       })
  
  
}