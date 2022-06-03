# packages 
library(shiny)
library(tidyverse)


fluidPage(
  titlePanel("ALL-Akute Lymphatische Leukämie"),
      mainPanel(
      tabsetPanel(
        tabPanel("Data Table", tableOutput("table")), 
        tabPanel("Plot", plotOutput("plot_agesmo")), 
        tabPanel("About Leukämie", br(),
                 p(tags$a(href="https://flexikon.doccheck.com/de/Leukämie", "doccheck")),
                 h3('About this R Shiny App'),br(),
                 p('Shiny Visualization. R Shiny App for ALL dataset'),br(), 
                 p('Wahlfach R und Shiny Apps, Sommersemester 2022'),br(), 
                 p('Version 1.0'),br(),
                 p('Last update: 23-MAY-2022'),br(),
                 p('Used packages: tidyverse (1.3.0), shiny (1.6.0)'),br(), 
                 p('Author: Moritz Stengel')
                )
              ) 
           )
        )