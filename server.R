library(tidyverse)
library(ggplot2)

# Define server logic required to draw a plot in shiny ALL App
server <- function(input, output) {
  
  
    # initialize given cancer data via cancer_data.csv
    df <- read.csv("cancer_data.csv", header =TRUE)
    
    # Filter table 
    data <- reactive(df %>% select.list(c(input$tab_opt)))
    
    
    # giva an output of the dataframe
    output$tableCancer <- renderTable({
      
      # creating subset of dataframe, min.value of slider input < df$age <  max.value of slider input
      ageintervall <-
        subset(df, df$age > input$inage[1] & df$age < input$inage[2])
      
      # give columns every column name if nothing is selected, result = show all columns
      columns = names(df)
      
      # if tab_opt is not empty then overwrite columns with the current selections
      if (!is.null(input$tab_opt)) {
        columns = input$tab_opt
      }
      
      # set dataframe with the selected columns
      ageintervall[order(ageintervall$age), columns, drop = FALSE]
      
    })
    
    
     
    
    # generate input smoking based on input$smoking from ui.R
    output$smokersPlot <- renderPlot({
      
      df %>% 
        ggplot(aes( x = age, y=smoking)) +
        geom_col() +
        theme_bw() +
        labs( x = "Patient Age in Years",
              y = "Patient habit of Smoking")
       })
  
  
}