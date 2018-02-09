label_altright_UI <- function(id){
  ns <- NS(id)
  shiny.semantic::semanticPage(
    useShinyjs(),
    #shinythemes::themeSelector(),
    column(width = 3,
      div(class="ui blue segment",
        div(class="ui huge blue top attached label", "1A. Rating"),
        br(),
        br(),
        span(
          strong("Focus on White Identity", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Text focuses on a collective white identity/race.",
            `data-variation` = "wide",
            `data-position` = "top left",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("identity"), 
          label = NULL, 
          grid = T, 
          force_edges = T,
          choices = c("Not Present",
                      "2", "3", 
                      "4", "Strongly Present")
        ),
        span(
          strong("Lamenting about Moral Decline", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = 'Expressing a sentiment that morality is in decline (f.e. "degeneracy").',
            `data-variation` = "wide",
            `data-position` = "top left",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("moral"),
          label = NULL,
          grid = T,
          force_edges = T,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        ),
        span(
          strong("Anti-Elite and Conspiracies", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Expressing grievances over the Elite/Establishment/Mainstream Media/Culture",
            `data-variation` = "wide",
            `data-position` = "top left",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("elite"),
          label = "",
          grid = T,
          force_edges = T,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        ),
        span(
          strong("Anti-Left/Liberal Sentiment", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Negative sentiment towards liberals or 'the Left' as a whole",
            `data-variation` = "wide",
            `data-position` = "top left",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("left"),
          label = "",
          grid = T,
          force_edges = T,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        )
      )
    ),
    column(width = 6,
      div(class="ui segment",
        div(class="ui huge orange top attached label", "Please rate this Comment:"),
        #div(class="content", "Text:"
        #   div(class="ui right aligned header", 
        #     uiicon("twitter")
        #   ),
        #   h4(class="header",
        #     "Mr X"
        #   )
        # ),
        br(),
        br(),
        br(),
        strong(#class="massive meta", 
          textOutput(ns("tweet")), style = "font-size: 20px; color: black;"
          #"Im sorry to say.. This is going to sound extremely racist, but without all the white influence in this world back then, if there were never white people, this whole world would suck and be uncivilized.", style = "font-size: 20px; color: black;" #uiOutput(ns("tw
        )
        # div(class="description", 
        #  "Text ......."
        # )
        # div(class="extra content",
        #   div(class="ui two buttons", 
        #     div(class="ui basic green button", "Approve"),
        #     div(class="ui basic red button", "Decline")
        #   )
        # )
      ),
      div(class = "ui three column grid", 
        div(class="column",
          br(),
          span(
            strong("1. Type of Language", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Please select only one. The priority goes Vulgar < Hostile < Call for Violence.",
              `data-variation` = "wide",
              `data-position` = "top left",
              uiicon("help")
            )
          ),
          awesomeRadio(
            inputId = ns("lang"), 
            label = NULL, 
            selected = "99",
            choices = c(`Vulgar` = "1",
                        `Hostile` = "2", 
                        `Call for Violence` = "3",
                        `None of the Above` = "99")
          )
        ),
        div(class="column",
          br(),
          span(
            strong("2. Anti-Immigration", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Please select one or more items.",
              `data-variation` = "wide",
              `data-position` = "top right",
              uiicon("help")
            )
          ),
          awesomeCheckboxGroup(
            inputId = ns("imm"), 
            label = NULL, 
            selected = "99",
            choices = c(`Illegal` = "1",
                        `Non-Western (Culture)` = "2", 
                        `Non-White (Race)` = "3",
                        `None of the Above` = "99")
          )
        ),
        div(class="column",
          br(),
          span(
            strong("3. Victimization", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Please select one or more items.",
              `data-variation` = "wide",
              `data-position` = "top right",
              uiicon("help")
            )
          ),
          awesomeCheckboxGroup(
            inputId = ns("vict"), 
            label = "", 
            selected = "99",
            choices = c(`In General` = "1",
                        `For being White` = "2", 
                        `For being Male` = "3",
                        `None of the Above` = "99")
          )
        )
      ),
      br(),
      div(class = "ui two column grid",
        div(class = "column",
          br(),
          span(
            strong("4. Irony or Trolling", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Please Select",
              `data-variation` = "wide",
              `data-position` = "top right",
              uiicon("help") 
            )
          ),
          switchInput(
            inputId = ns("irony"), 
            value = F, 
            label = "",
            offStatus = "warning", 
            onStatus = "success", 
            offLabel = "No",
            onLabel = "Yes"
          )
        ),
        div(class = "right aligned column", 
            br(),
            br(),
            div(style="float: right;width: 150px;",
                actionButton(ns("submit"), label = "Submit", icon = icon("check"), style="color: #fff; background-color: green; border-color: #2e6da4")
            ),
            br(),
            div(style="float: right;",
              strong(textOutput(ns("counter")))
            )
        )
      )
      #progressBar(id = ns("pb"), value = 1, status = "success")
    ),
    # bhvhv
    column(width = 3,
      div(class="ui blue segment",
        div(class="ui huge blue top attached label", "1B. Rating"),
        br(),
        br(),
        span(
          strong("Misogyny and Anti-Feminism", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Expressing anti-women or anti-Feminist sentiments.",
            `data-variation` = "wide",
            `data-position` = "top right",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("anti_fem"), 
          label = NULL, 
          grid = T, 
          force_edges = T,
          choices = c("Not Present",
                      "2", "3", 
                      "4", "Strongly Present")
        ),
        span(
          strong("Racism", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Expressing a bias/hatred against people of a certain race.",
            `data-variation` = "wide",
            `data-position` = "top right",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("race"),
          label = "",
          grid = TRUE,
          force_edges = TRUE,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        ),
        span(
          strong("Anti-Semitism", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Expressing a bias/hatred against Jewish people.",
            `data-variation` = "wide",
            `data-position` = "top right",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("anti_sem"),
          label = "",
          grid = T,
          force_edges = T,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        ),
        span(
          strong("Anti-Muslim Sentiment", style = "font-size: 15px;"),
          div(
            class = "small circular ui icon button",
            `data-inverted` = "",
            `data-tooltip` = "Expressing a bias/hatred against Muslims.",
            `data-variation` = "wide",
            `data-position` = "top right",
            uiicon("help")
          )
        ),
        sliderTextInput(
          inputId = ns("anti_mus"),
          label = NULL,
          grid = T,
          force_edges = T,
          choices = c("Not Present",
                      "2", "3",
                      "4", "Strongly Present")
        )
      ),
      div(style="display: inline-block;vertical-align:top; width: 50px;",
          numericInput(ns("select"), label = NULL, value = 1, min = 1) # starts at 0 due to observe event | bug
      )
    )
  )
}

### authentification
googlesheets::gs_auth(token = "shiny_app_token.rds")
sheet_key <- "1qgJnrIkTDS539p5EbPtIF6cnptg2_-2G0Knavzxw3bw"
with_label <- googlesheets::gs_key(sheet_key)

with_label_id <- gs_title("altright_data_final")
with_label_dat <- gs_read(with_label_id)
# if_na <- function(x) ifelse(is.null(x), NA, x)

label_altright <- function(input, output, session, gs_title, user){
  
  social_data <- reactive({
    input$refresh
    #if(gs_title == "") { return(NULL) }
    
    no_label_id <- gs_title(gs_title)
    no_label <- gs_read(no_label_id)
    
    user_label <- with_label_dat %>%
      filter(coder == user)
    
    label_task <- no_label %>%
      filter(
        !(id %in% user_label$id), 
        !(text %in% user_label$text)
      )
    
    label_task_init <- data.frame(
      label_task,
      identity = NA,
      moral = NA,
      elite = NA,
      left = NA,
      lang = NA,
      imm = NA,
      vict = NA,
      irony = NA,
      anti_fem = NA,
      race = NA,
      anti_sem = NA,
      anti_mus = NA,
      coder = NA,
      timestamp = NA
    )
    
    num_finish <- nrow(user_label)
    
    return(list(no_label = label_task_init,
                with_label = user_label, 
                num_finish = num_finish))
  })
  
  ### need for reactive context
  raw <- reactiveValues()
  
  observe({
    raw$dat <-  social_data()$no_label
  })
  
  
  output$counter <- renderText({
    paste0("You coded ", (social_data()$num_finish + as.numeric(input$select) - 1))
  })
  
  output$tweet <- renderText({
    raw$dat$text[input$select]
  })
  
  # next button + summit + automatically go back to category 0
  observeEvent(input$submit, { # {|} works perfectly fine!
    
    # update id number and starring
    x <- as.numeric(input$select) + 1
    updateNumericInput(session, "select", value = x)
    
    updateSliderTextInput(session, "identity", selected = "1")
    updateSliderTextInput(session, "moral", selected = "1")
    updateSliderTextInput(session, "elite", selected = "1")
    updateSliderTextInput(session, "left", selected = "1")
    
    updateAwesomeRadio(session, "lang", selected = "99")
    updateCheckboxGroupInput(session, "imm", selected = "99")
    updateCheckboxGroupInput(session, "vict", selected = "99")
    updateSwitchInput(session, "irony", value = F)
    
    updateSliderTextInput(session, "anti_fem", selected  = "1")
    updateSliderTextInput(session, "race", selected = "1")
    updateSliderTextInput(session, "anti_sem", selected = "1")
    updateSliderTextInput(session, "anti_mus", selected = "1")
    
  })
  
  # write into data frame
  observeEvent(input$submit, {  #observe
    
    shinyjs::disable("submit")
    
    # isolates the reactive values without reactive dependecy.
    isolate({
      index <- input$select
      identity <- input$identity
      moral <- input$moral
      elite <- input$elite
      left <- input$left
      lang <- input$lang
      imm <- input$imm
      vict <- input$vict
      irony <- input$irony
      anti_fem <- input$anti_fem
      race <- input$race
      anti_sem <- input$anti_sem
      elite <- input$elite
      anti_mus <- input$anti_mus
      coder <- user
    })
    
    raw$dat$identity[index] <- identity
    raw$dat$moral[index] <- moral
    raw$dat$elite[index] <- elite
    raw$dat$left[index] <- left
    raw$dat$lang[index] <- lang
    raw$dat$imm[index] <- imm
    raw$dat$vict[index] <- vict
    raw$dat$irony[index] <- irony
    raw$dat$anti_fem[index] <- anti_fem
    raw$dat$race[index] <- race
    raw$dat$anti_sem[index] <- anti_sem
    raw$dat$anti_mus[index] <- anti_mus
    
    raw$dat$coder[index] <- coder
    raw$dat$timestamp[index] <- Sys.time() %>% as.character()
    
    with_label_id <- with_label %>%
      googlesheets::gs_add_row(input = raw$dat[index, ])
    
    shinyjs::enable("submit")
  })
  
  output$tab <- DT::renderDataTable({
    raw$dat
  })
}