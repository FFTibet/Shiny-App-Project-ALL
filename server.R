library(tidyverse)
library(ggplot2)
library(DT)
library(data.table)
library(forestplot)

# Define server logic required to draw a plot in shiny ALL App
server <- function(input, output) {
  # initialize given cancer data via cancer_data.csv
  df <- read.csv("cancer_data.csv", header = TRUE)
  
  # Filter table
  data <- reactive(df %>% select.list(c(input$tab_opt)))
  
  # convert table to data.table
  dt_df <- data.table::copy(df)
  
  # giva an output of the dataframe
  output$tableCancer <- renderTable({
    # creating subset of dataframe, min.value of slider input < df$age <  max.value of slider input
    ageintervall <-
      subset(df, df$age > input$inage[1] &
               df$age < input$inage[2])
    
    # give columns every column name if nothing is selected, result = show all columns
    columns = names(df)
    
    # if tab_opt is not empty then overwrite columns with the current selections
    if (!is.null(input$tab_opt)) {
      columns = input$tab_opt
    }
    
    # set dataframe with the selected columns
    ageintervall[order(ageintervall$age), columns, drop = FALSE]
    
  })
  

  # generate boxplot gbt to alcoholo (to bmi)
  # change to another plot oder add another plot to include bmi
  output$boxplot_gbt_alc <- renderPlot({
    m <- paste0('gbt', '~', 'alcohol')
    boxplot(as.formula(m),
            data = df,
            xlab = "Alcohol",
            ylab = "Liver values")
  })
  
  
  
  # generate graphic to show age to wbc
  # add color in graphic to show smoker
  output$ggplot_age_wbc <- renderPlot({
    df %>%
      ggplot(aes(x = age, y = wbc)) +
      geom_col() +
      theme_bw() +
      labs(x = "Age",
           y = "White blood cells")
  })
  
  # generate graphic to show age to hemoglobine
  # add color in graphic to show gender, smoker and maybe age classes(child-adult-old)
  output$ggplot_age_hemoglobine <- renderPlot({
    df %>%
      ggplot(aes(x = age, y = hemoglobine)) +
      geom_jitter() +
      theme_bw() +
      labs(x = "Age",
           y = "Hemoglobine")
  })
  
  # generate graphic to show age to rbc
  # add color in graphic to show gender, smoker and maybe age classes(child-adult-old)
  output$ggplot_age_rbc <- renderPlot({
    df %>%
      ggplot(aes(x = age, y = rbc)) +
      geom_smooth() +
      theme_bw() +
      labs(x = "Age",
           y = "Erythrocyten")
  })
  
}