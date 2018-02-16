### 
# pacman::p_load(shiny,
# shiny.semantic,
# shinyjqui,
# dplyr,
# shinythemes,
# shinyjs,
# shinyWidgets,
# googlesheets,
# highcharter,
# formattable,
# DT)
library(shiny)
library(shiny.semantic)
library(shinyjqui)
library(dplyr)
library(shinythemes)
library(shinyjs)
library(shinyWidgets)
library(googlesheets)
library(highcharter)
library(formattable)
library(DT)
library(stringr)

#source("mods/helper.R")
source("mods/login_mod.R")
source("mods/leaderboard_mod.R")
source("mods/label_altright_mod.R")

ui <- shinyUI(
  fluidPage(
    uiOutput("main")
  )
)

ui_content <- function(){
  navbarPage(
    title = span(
      icon("flag", "fa-1x"), 
      "Decoding the Alt-Right"
    ), 
    windowTitle = "Decoding the Alt-Right", 
    theme = shinythemes::shinytheme("yeti"), # sandstone, united, paper, flatly, cosmo
    tabPanel(
      "Start", 
      tags$iframe(src = 'startingpage.html', # put testdoc.html to /www
                  width = '100%', height = '800px', 
                  frameborder = 0, scrolling = 'auto')      
    ),
    tabPanel(
      "Coding Guidlines",
      tags$iframe(src = 'docs2.html', # put testdoc.html to /www
                  width = '100%', height = '800px', 
                  frameborder = 0, scrolling = 'auto')
    ),
    tabPanel(
      span(icon("sliders"), "Task"),
      label_altright_UI("task")
    ),
    tabPanel(
      span(icon("trophy"), "Leaderboard"), 
      leaderboard_UI("winner")
    )
    #shinythemes::themeSelector()
  )
}


server <- function(input, output, session) {
  
  ### login part 
  client <- reactiveValues(data = list(log = F, user = "", dlink = ""))
  
  # login module
  observeEvent(input$`pre-login`, {
    client$data <- callModule(login_mod, id = "pre")
  }) 
  
  # output log in tab database
  output$log <- renderPrint({
    client$data
  })
  
  ### sentiment labeling
  observeEvent(client$data$log, {
    
    with_label_id <- gs_title("altright_data_final")
    with_label_dat <- gs_read(with_label_id)
    
    if(client$data$log){
      callModule(
        label_altright,
        id = "task",
        data = with_label_dat,
        gs_title = client$data$dlink,
        user = client$data$user
      )
    }
    
  })
  
  ### leader board
  observe({
    callModule(
      leaderboard,
      id = "winner"
    )
  })
  
  # observeEvent(input$refresh, {
  #   client$data$log <- F
  #   js$refresh()
  # })
  
  ### UI output handler
  output$main <- renderUI({
    if(client$data$log) {
      ui_content()
    } else {
      login_mod_UI("pre")
    }
  })
}

shinyApp(ui, server)