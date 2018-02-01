label_altright_UI <- function(id){
  ns <- NS(id)
  shiny.semantic::semanticPage(
    column(width = 3,
      br(),
      span(
        strong("Type of Language", style = "font-size: 15px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "Here we want to measure the OVERALL negativity/ positivity of a tweet. This is not entity/bitcoin specific but wholistic.",
          `data-variation` = "wide",
          `data-position` = "top right",
          uiicon("help")
        )
      ),
      radioGroupButtons(
        inputId = ns("type"), 
        label = NULL, 
        #choiceValues = 1:5, 
        selected = "99",
        #choiceNames = paste0(1:5),
        choices = c(`Vulgar Language` = "1",
                    `Hostile Language` = "2", 
                    `Call for Violence` = "3",
                    `99` = "99"),
        justified = T, 
        direction = "vertical", 
        checkIcon = list(yes = icon("check"))
      ),
      ### colors
      tags$script("$(\"input:radio[name='task-type'][value='3']\").parent().css('background-color', '#e63900');"),
      tags$script("$(\"input:radio[name='task-type'][value='2']\").parent().css('background-color', '#ff8533');"),
      tags$script("$(\"input:radio[name='task-type'][value='1']\").parent().css('background-color', '#ffd11a');"),
      tags$script("$(\"input:radio[name='task-type'][value='99']\").parent().css('display', 'none');"),
      br(),
      br(),
      span(
        strong("Irony", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "If this tweet is advertisment or does promote any products its SPAM. Otherwise HAM.",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help") 
        )
      ),
      switchInput(
        inputId = ns("irony"), 
        value = F, label = "Irony?",
        offStatus = "warning", 
        onStatus = "success", 
        offLabel = "No",
        onLabel = "Yes"
      ),
      br(),
      div(style="display: inline-block;vertical-align:top; width: 150px;",
          numericInput(ns("select"), label = NULL, value = 1, min = 1) # starts at 0 due to observe event | bug
      ),
      div(style="display: inline-block;vertical-align:top; width: 150px;",
          actionButton(ns("submit"), label = "submit", icon = icon("cloud"))
      )
    ),
    column(width = 5,
      br(),
      br(), 
      shiny::tags$blockquote(
        "Warmly little before cousin sussex entire men set. Blessing it ladyship on sensible judgment settling outweigh. Worse linen an of civil jokes leave offer. Parties all clothes removal cheered calling prudent her. And residence for met the estimable disposing. Mean if he they been no hold mr. Is at much do made took held help. Latter person am secure of estate genius at." #uiOutput(ns("tweet"))
      )
    ),
    column(width = 4,
      span(
        strong("Sexism", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "...",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help")
        )
      ),
      div(class = "ui two column grid",
          div(class = "column", 
            awesomeCheckboxGroup(
              inputId = ns("sexism"), 
              label = NULL,
              choices = c("Anti-Feminism" = 1, "Traditional gender roles" = 2, 
                          "Male domination" = 3), 
              selected = 1
            )
          ), 
          div(class = "column",
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Women are untrustworthy" = 4, "other" = 5), 
                selected = 1
              )
          )
      ),
      span(
        strong("Sexism", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "...",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help")
        )
      ),
      div(class = "ui two column grid",
          div(class = "column", 
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Anti-Feminism" = 1, "Traditional gender roles" = 2, 
                            "Male domination" = 3), 
                selected = 1
              )
          ), 
          div(class = "column",
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Women are untrustworthy" = 4, "other" = 5), 
                selected = 1
              )
          )
      ),
      span(
        strong("Sexism", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "...",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help")
        )
      ),
      div(class = "ui two column grid",
          div(class = "column", 
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Anti-Feminism" = 1, "Traditional gender roles" = 2, 
                            "Male domination" = 3), 
                selected = 1
              )
          ), 
          div(class = "column",
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Women are untrustworthy" = 4, "other" = 5), 
                selected = 1
              )
          )
      ),
      span(
        strong("Sexism", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "...",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help")
        )
      ),
      div(class = "ui two column grid",
          div(class = "column", 
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Anti-Feminism" = 1, "Traditional gender roles" = 2, 
                            "Male domination" = 3), 
                selected = 1
              )
          ), 
          div(class = "column",
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Women are untrustworthy" = 4, "other" = 5), 
                selected = 1
              )
          )
      ),
      span(
        strong("Sexism", style = "font-size: 20px;"), 
        div(
          class = "small circular ui icon button", 
          `data-inverted` = "",
          `data-tooltip` = "...",
          `data-variation` = "wide",
          `data-position` = "top left",
          uiicon("help")
        )
      ),
      div(class = "ui two column grid",
          div(class = "column", 
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Anti-Feminism" = 1, "Traditional gender roles" = 2, 
                            "Male domination" = 3), 
                selected = 1
              )
          ), 
          div(class = "column",
              awesomeCheckboxGroup(
                inputId = ns("sexism"), 
                label = NULL,
                choices = c("Women are untrustworthy" = 4, "other" = 5), 
                selected = 1
              )
          )
      )
    )
  )
}

### authentification
# googlesheets::gs_auth(token = "shiny_app_token.rds")
# sheet_key <- "16kjt23nknV3ljsORwNon4n1I_BnI9BbilvoRj34ueV8"
# with_label <- googlesheets::gs_key(sheet_key)
# 
# with_label_id <- gs_title("bitcoin_with_label")
# with_label_dat <- gs_read(with_label_id)
# 
# if_na <- function(x) ifelse(is.null(x), NA, x)


label_altright <- function(input, output, session, user){
  
  output$user <- renderText({
    user()
  })
  # 
  # twitter <- reactive({
  #   input$refresh
  #   
  #   no_label_id <- gs_title("bitcoin_no_label")
  #   no_label <- gs_read(no_label_id)
  #   
  #   label_task <- no_label %>%
  #     filter(!(screen_name %in% with_label_dat$screen_name & text %in% with_label_dat$text))
  #   
  #   label_task_init <- data.frame(
  #     label_task, 
  #     sent = NA, 
  #     spam = NA, 
  #     inter = NA, 
  #     category = NA,
  #     star = NA,
  #     coder = NA,
  #     timestamp = NA
  #   )
  #   
  #   return(list(no_label = label_task_init, 
  #               with_label = with_label_dat))
  # })
  # 
  # ### need for reactive context
  # raw <- reactiveValues()
  # 
  # observe({
  #   raw$dat <-  twitter()$no_label
  # })
  # 
  # output$tweet <- renderUI({
  #   tags$blockquote(raw$dat$text[input$select],  style = "font-size: 30px;")
  # })
  # 
  # # next button + summit + automatically go back to category 0
  # observeEvent({input$nxt | input$submit}, { # {|} works perfectly fine!
  #   
  #   # update id number and starring
  #   x <- input$select + 1
  #   updateNumericInput(session, "select", value = x)
  #   updateRadioGroupButtons(session, "sent", selected = "")
  #   updateAwesomeRadio(session, "inter", selected = "1")
  #   updateAwesomeRadio(session, "spam", selected = "1")
  #   updateAwesomeRadio(session, "research", selected = "-1")
  #   updatePickerInput(session, "category", selected = "")
  # })
  # 
  # # previous button
  # observeEvent(input$pre, {
  #   x <- input$select - 1
  #   updateNumericInput(session, "select", value = x)
  # })
  # 
  # # starring button
  # observeEvent(input$star, {
  #   # extract index
  #   isolate({
  #     sel <- input$select
  #   })
  #   
  #   # (un-) starring
  #   if(raw$dat$star[sel] %in% "1"){
  #     raw$dat$star[sel] <- NA
  #   } else {
  #     raw$dat$star[sel] <- 1
  #   }
  # })
  # 
  # # write into data frame
  # observeEvent(input$submit, {  #observe
  #   # isolates the reactive values without reactive dependecy.
  #   isolate({
  #     index <- input$select
  #     sent <- input$sent
  #     spam <- input$spam
  #     inter <- input$inter
  #     category <- input$category
  #     coder <- user()
  #   })
  #   
  #   raw$dat$sent[index] <- if_na(sent)
  #   raw$dat$spam[index] <- if_na(spam)
  #   raw$dat$inter[index] <- if_na(inter)
  #   raw$dat$category[index] <- if_na(category)
  #   raw$dat$coder[index] <- if_na(coder)
  #   raw$dat$timestamp[index] <- Sys.time() %>% as.character()
  #     
  #   with_label <- with_label %>% 
  #     googlesheets::gs_add_row(input = raw$dat[index, ])
  # })
  # 
  # output$tab <- DT::renderDataTable({
  #   raw$dat
  # })
}