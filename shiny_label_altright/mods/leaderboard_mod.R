leaderboard_UI <- function(id){
  ns <- NS(id)
  tagList(
    div(class="ui two column grid", 
      div(class="column", 
        actionButton(ns("refresh"), icon = icon("refresh"), label = "Reload Stats"),
        DT::dataTableOutput(ns("top"))
      ),
      div(class="column", 
        highcharter::highchartOutput(ns("high"))
      )
    )
    #progressBar(id = ns("total_progress"), value = 0, total = 2000, status = "info", display_pct = TRUE, striped = TRUE, title = "First goal: ")
  )
}

leaderboard <- function(input, output, session){
  
  dat <- shiny::reactive({
    input$refresh
    with_label_id <- gs_title("bitcoin_with_label")
    with_label_dat <- gs_read(with_label_id)
    
    with_label_dat %>% 
      filter(!is.na(coder)) %>%
      group_by(coder) %>% 
      summarise(n = n()) %>%
      ungroup()
  })
  
  output$high <- renderHighchart({
    hchart(dat(), "treemap", hcaes(x = coder, value = n, color = n))
  })
  
  output$top <- DT::renderDataTable({
    
    dat() %>%
      select(coder, n) %>%
      arrange(desc(n)) %>%
      formattable(., 
        list(n = color_tile("white", "blue"))
      ) %>% 
      as.datatable()
  })
  
  
  # observe({
  #   temp <- sum(dat()$n, na.rm = T)
  #   
  #   if (temp < 600) {
  #     status <- "danger"
  #   } else if (temp >= 600 & temp < 1300) {
  #     status <- "warning"
  #   } else {
  #     status <- "success"
  #   }
  #   
  #   updateProgressBar(
  #     session = session, 
  #     id = "pre-total_progress", 
  #     value = temp, 
  #     total = 2000, 
  #     status = status
  #   )
  # })
}