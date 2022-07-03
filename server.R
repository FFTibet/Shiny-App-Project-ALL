source("global_source.R")

server <- function(input, output) {
  unlist_as_char <- function(x, df) {
    result <- as.character(unlist(df[colnames(df) == x]))
    return(result)
  }
  
  # initialize given cancer data via newdata.csv
  df <- read.csv("cancer_data.csv", header = TRUE)
  
  # Output DataTable
  output$table <- renderDataTable(df)
  
  
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
  
  # reactive Dataset
  dataset <- reactive({
    select(df, c(input$check_choices_input))
  })
  
  # reactive scatterplot
  scatter <- reactive(if (input$scat_var_group == "None") {
    df %>%
      ggplot(aes(
        x = get(input$scat_var_x) ,
        y = get(input$scat_var_y)
      )) +
      geom_jitter(aes()) +
      theme_bw() +
      
      labs(
        title = paste0(names(label_options[which(label_options == input$scat_var_x)]),
                       " and ",
                       names(label_options[which(label_options == input$scat_var_y)])),
        x = names(label_options[which(label_options == input$scat_var_x)]),
        y = names(label_options[which(label_options == input$scat_var_y)])
      ) +
      theme_minimal(base_size = 16) +
      scale_size(guide="none")
  } else {
    df %>%
      ggplot(aes(
        x = get(input$scat_var_x),
        y = get(input$scat_var_y),
        colour = get(input$scat_var_group),
        size = 14
      ))  +
      theme_bw() +
      scale_colour_continuous(name = names(label_options[which(label_options == input$scat_var_group)]),
                              guide = guide_legend(reverse = TRUE)) +
      geom_jitter(aes()) +
      labs(
        title = paste0(names(label_options[which(label_options == input$scat_var_x)]),
                       " and ",
                       names(label_options[which(label_options == input$scat_var_y)])),
        x = names(label_options[which(label_options == input$scat_var_x)]),
        y = names(label_options[which(label_options == input$scat_var_y)])
      ) +
      theme_minimal(base_size = 16)+
      scale_size(guide="none")
  })
  
  # reactive boxplot
  # 
  box <- reactive(if (input$box_var_group == "None") {
    ggplot(data = df) +
      geom_boxplot(mapping = aes(x = get(input$box_var_x)), fill = "steelblue") +
      labs(title = paste0("Boxplot for variable ", names(label_options[which(label_options == input$box_var_x)])),
           x = names(label_options[which(label_options == input$box_var_x)])) +
      theme_minimal(base_size = 16)
  } else {
    ggplot(data = df) +
      geom_boxplot(mapping = aes(
        x = get(input$box_var_x),
        y = unlist_as_char(input$box_var_group, df),
        fill = unlist_as_char(input$box_var_group, df)
      )) +
      scale_fill_discrete(name = names(label_options[which(label_options == input$box_var_group)]),
                          guide = guide_legend(reverse = TRUE)) +
      labs(
        title = paste0("Boxplot for variable ", names(label_options[which(label_options == input$box_var_x)])),
        x = names(label_options[which(label_options == input$box_var_x)]),
        y = names(label_options[which(label_options == input$box_var_group)])
      ) +
      theme_minimal(base_size = 16)
  })
  
  # reactive histogram
  histo <- reactive(
    ggplot(data = df) +
      geom_histogram(
        mapping = aes(x = get(input$histo_var_x)),
        colour = "black",
        fill = "steelblue"
      ) +
      labs(
        title = paste0("Histogram of variable ", names(label_options[which(label_options == input$histo_var_x)])),
        x = names(label_options[which(label_options == input$histo_var_x)]),
        y = "Frequency"
      ) +
      theme_minimal(base_size = 16)
  )
  
  # reactive smooth line chart
  sline <- reactive(
    df %>%
      ggplot(aes(
        x = get(input$sline_var_x) ,
        y = get(input$sline_var_y)
      )) +
      geom_smooth(aes()) +
      theme_bw() +
      
      labs(
        title = paste0(names(label_options[which(label_options == input$sline_var_x)]),
                       " and ",
                       names(label_options[which(label_options == input$sline_var_y)])),
        x = names(label_options[which(label_options == input$sline_var_x)]),
        y = names(label_options[which(label_options == input$sline_var_y)])
      ) +
      theme_minimal(base_size = 16)
  )
  
  # output DataTable
  output$table <- renderDataTable(dataset())
  
  # output Summary
  output$summary <- renderPrint({
    summary(df[, input$column])
  })
  
  # output scatterplot
  output$scatterplotss <- renderPlot({
    scatter()
  })
  
  # output boxplot
  output$box <- renderPlot({
    box()
  })
  
  # output histogram
  output$histo <- renderPlot({
    histo()
  })
  
  # output smooth line chart
  output$sline <- renderPlot({
    sline()
  })
}
# source hide size in legend/guide https://stackoverflow.com/questions/4207518/how-can-i-hide-the-part-of-the-legend-using-ggplot2
# source how to set labels https://community.rstudio.com/t/reactive-axis-labels-in-shiny-with-ggplot-display-user-selected-label-not-variable-name/17560/2
# source ggplots https://moodle-thu.de/pluginfile.php/116008/mod_resource/content/1/ggplot2-cheatsheet.pdf
# source ggplots https://r-graph-gallery.com/ggplot2-package.html
# source ggplots scale_fill_discrete https://stackoverflow.com/questions/25176399/scale-fill-discrete-and-scale-fill-manual-legend-options-confusion