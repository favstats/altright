### helper functions
#jscode <- "shinyjs.closeWindow = function() { window.close(); }"
#jsResetCode <- "shinyjs.reset = function() {history.go(0)}" 

navbarPageWithInputs <- function(..., inputs) {
  navbar <- navbarPage(...)
  form <- tags$form(class = "navbar-form", style= "height: 25px; float:right;", inputs)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], form)
  navbar
}

logout_button <- function() {
  tagList(
    #extendShinyjs(text = jscode, functions = c("closeWindow")),
    # div(style="display: inline-block;vertical-align:top;",
    #   shinyWidgets::dropdown(
    #     shinyWidgets::pickerInput( #textInput("search", NULL, placeholder = "Search"),
    #       inputId = "slot",
    #       label = h4("Data Slots"),
    #       choices = 1:5,
    #       multiple = F,
    #       selected = 1,
    #       choicesOpt = list(
    #         content = sprintf(
    #           "<span class='label label-%s'>%s</span>",
    #           c("info", "success", "danger", "primary", "warning"),
    #           1:5
    #         )
    #       )
    #       #inline = T,
    #       #width = "30%"
    #     ),
    #     #shiny::numericInput("slot", "slot", min = 1, max = 5, value = 1),
    #     #shiny::numericInput(inputId = "slot", "Data Slot", min = 1, max = 10, value = 1),
    #     actionButton("override", "Save"),
    #     right = T, 
    #     style = "minimal",
    #     icon = icon("hdd-o"),
    #     tooltip = T,
    #     status = "success",
    #     #width = "30%",
    #     options = list(`dropdownAlignRight` = TRUE),
    #     animate = animateOptions(
    #       enter = animations$sliding_entrances$slideInDown,
    #       exit = animations$sliding_exits$slideOutRight,
    #       duration = .5
    #     )
    #   )
    # ),
    div(style="display: inline-block;vertical-align:top;", 
        shinyWidgets::actionBttn(
          "logout", label = NULL, 
          icon = icon("sign-out"), 
          style = "minimal", 
          color = "warning"
        )
    )
    # div(style="display: inline-block;vertical-align:top;", 
    #     shinyWidgets::actionBttn(
    #       "close", label = NULL, 
    #       icon = icon("power-off"), 
    #       style = "minimal", 
    #       color = "danger"
    #     )
    # )
  )
}

# 
# shiny_input_user <- function(id, class="ui fluid left icon input"){
#   div(class = class, 
#       tags$input(
#         placeholder = "username", 
#         type = "text", 
#         id = id
#       ), 
#       uiicon("user")
#   )
# }
# 
# shiny_input_pw <- function(id, class="ui fluid left icon input"){
#   div(class = class, 
#       tags$input(
#         placeholder = "password", 
#         type = "text", 
#         id = id
#       ), 
#       uiicon("lock")
#   )
# }
# 


