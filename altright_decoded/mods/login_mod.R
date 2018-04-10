login_mod_UI <- function(id){
  ns <- NS(id)
  shiny.semantic::semanticPage(
    useSweetAlert(),
    div(class="ui five column grid", 
      div(class="column", ""),
      div(class="column", ""),
      div(class="column",
        br(),
        br(),
        br(),
        div(class="ui card", 
          id = "login_card",
          div(class="content",
              div(class="header",
                  "Welcome!"
              )
          ),
          div(class="content", 
              textInput(ns("user"), "Username"),
              passwordInput(ns("pw"), "Password"),
              br(),
              actionButton(ns("login"), "Log in")
              #selectInput('effect', NULL, choices = get_jqui_effects())
          )
        )
      ),
      div(class="column", ""),
      div(class="column", "")
    )
  )
}

# accounts <- data.frame(
#   user_name = c("syro", "favoo", "becci", "karsten", "rudi", "paraboost"), 
#   password = c("2018", "2018", "2018", "2018", "2018", "2018"),
#   stringsAsFactors = F
# )

login_mod <- function(input, output, session){

  status <- reactive({
    user <- isolate(input$user)
    pw <- isolate(input$pw)
    
    accounts <- gs_title("code_altright_accounts") %>%
      gs_read()
    
    status <- accounts %>%
      dplyr::filter(
        user_name %in% user & 
          password %in% pw
      )
    
    return(status)
  })
  
  if(nrow(status()) > 0){
    shinyjqui::jqui_hide("#login_card", effect = "drope") #input$effect
    sendSweetAlert(
      session = session,
      title = paste0("Welcome ", status()$user_name, "!"), 
      text = "Successful Login",
      type = "success"
    )
    #Sys.sleep(1)
    return(
      list(
        log = T, 
        user = status()$user_name, 
        dlink = status()$dlink
      )
    )
  } else {
    sendSweetAlert(
      session = session,
      title = "Login Error",
      text = "Please try again.",
      type = "error"
    )
    return(list(log = F, user = "", dlink = ""))
  }
}