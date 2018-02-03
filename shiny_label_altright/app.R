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

source("mods/helper.R")
source("mods/instructions_mod.R")
source("mods/label_altright_mod.R")
source("mods/leaderboard_mod.R")
# source("mods/login_mod.R")

ui <- function(){
  navbarPageWithInputs(
    #shinyjs::useShinyjs(),
    title = span(icon("flag", "fa-1x"), "Coding Alt-Right"), 
    windowTitle = "App Name",
    theme = shinythemes::shinytheme("united"), # sandstone, united, paper, flatly, cosmo
    inputs = logout_button(),
    tabPanel("Instructions", 
             instructions_UI("first")
    ),
    tabPanel(span(icon("sliders"), "Task"),
             label_altright_UI("task")
    ),
    tabPanel(span(icon("trophy"), "Leaderboard"), 
             leaderboard_UI("winner")
    ),
    tabPanel(span(icon("database"), "Corpus"), 
             ""
    )
    #shinythemes::themeSelector()
  )
}

server <- function(input, output, session) {
  
  callModule(instructions, "first")
  observe({
    callModule(
      label_altright,
      id = "task",
      user = reactive({ "client$data$user" })
    )
  })
}

shinyApp(ui, server)