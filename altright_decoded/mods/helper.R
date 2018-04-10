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

jscode <- "shinyjs.refresh = function() { history.go(0); }"

logout_button <- function() {
  tagList(
    useShinyjs(),
    extendShinyjs(text = jscode),
    div(style="display: inline-block;vertical-align:top;", 
        shinyWidgets::actionBttn(
          "refresh", label = NULL, 
          icon = icon("sign-out"), 
          style = "minimal", 
          color = "warning"
        )
    )
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


