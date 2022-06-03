# This is the Server side of our app about ALL

# Essentials
library(shiny)
library(dplyr)
library(ggplot2)

function(input, output){
  
  df <- read.csv("cancer_data.csv", header=TRUE)
  
  # generate the table output
  output$table <- renderTable(head(df))
  
  # generate the plot output
  output$plot_agesmo <- renderPlot({
    df %>%
      ggplot(aes(x = age, y = smoking))+
      geom_col() + 
      theme_bw() +
      labs(x = "Patients Age in Years",
           y = "Patients habit of Smoking") }) 
}