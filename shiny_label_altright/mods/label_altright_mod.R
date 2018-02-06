label_altright_UI <- function(id){
  ns <- NS(id)
  shiny.semantic::semanticPage(
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
            `data-tooltip` = "Identifiying 'the Left/Liberals' as the main problem",
            `data-variation` = "wide",
            `data-position` = "top right",
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
      br(),
      div(class = "ui three column grid", 
        div(class="column",
          span(
            strong("1. Type of Language", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Here we want to measure the OVERALL negativity/ positivity of a tweet. This is not entity/bitcoin specific but wholistic.",
              `data-variation` = "wide",
              `data-position` = "top right",
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
          span(
            strong("2. Anti-Immigration", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Here we want to measure the OVERALL negativity/ positivity of a tweet. This is not entity/bitcoin specific but wholistic.",
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
          span(
            strong("3. Victimization", style = "font-size: 15px;"), 
            div(
              class = "small circular ui icon button", 
              `data-inverted` = "",
              `data-tooltip` = "Here we want to measure the OVERALL negativity/ positivity of a tweet. This is not entity/bitcoin specific but wholistic.",
              `data-variation` = "wide",
              `data-position` = "top right",
              uiicon("help")
            )
          ),
          awesomeCheckboxGroup(
            inputId = ns("vict"), 
            label = "", 
            selected = "99",
            choices = c(`in General` = "1",
                        `being White` = "2", 
                        `being Male` = "3",
                        `None of the Above` = "99")
          )
        )
      ),
      div(class = "ui two column grid",
        div(class = "column",
          span(
            strong("4. Irony or Sarcasm", style = "font-size: 15px;"), 
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
            value = F, 
            label = "Irony?",
            offStatus = "warning", 
            onStatus = "success", 
            offLabel = "No",
            onLabel = "Yes"
          )
        ),
        div(class = "column", 
            br(),
            div(style="display: inline-block;vertical-align:top; width: 150px;",
                numericInput(ns("select"), label = NULL, value = 1, min = 1) # starts at 0 due to observe event | bug
            ),
            div(style="display: inline-block;vertical-align:top; width: 150px;",
                actionButton(ns("submit"), label = "Submit Coding", icon = icon("cloud"))
            )
        )
      )
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
            `data-tooltip` = "Expressing anti-women sentiments, endorsing male dominance.",
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
            `data-tooltip` = "Expressing grievances over the Elite/Establishment/Mainstream Media/Culture",
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
      )
    )
  )
}

### authentification
googlesheets::gs_auth(token = "shiny_app_token.rds")
# sheet_key <- "16kjt23nknV3ljsORwNon4n1I_BnI9BbilvoRj34ueV8"
#with_label <- googlesheets::gs_key(sheet_key)

with_label_id <- gs_title("altright_final")
with_label_dat <- gs_read(with_label_id)
# 
# if_na <- function(x) ifelse(is.null(x), NA, x)


label_altright <- function(input, output, session, user){
  
  social_data <- reactive({
    input$refresh

    no_label_id <- gs_title("dataset1")
    no_label <- gs_read(no_label_id)

    label_task <- no_label %>%
      filter(!(id_label %in% with_label_dat$id_label))

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

    return(list(no_label = label_task_init,
                with_label = with_label_dat))
  })

  ### need for reactive context
  raw <- reactiveValues()

  observe({
    raw$dat <-  social_data()$no_label
  })

  output$tweet <- renderText({
    raw$dat$text[input$select]
  })

  # next button + summit + automatically go back to category 0
  observeEvent(input$submit, { # {|} works perfectly fine!

    shinyjs::disable("submit")
    # update id number and starring
    x <- input$select + 1
    updateNumericInput(session, "select", value = x)

    updateSliderTextInput(session, "identity", selected = "Not Present")
    updateSliderTextInput(session, "moral", selected = "Not Present")
    updateSliderTextInput(session, "elite", selected = "Not Present")
    updateSliderTextInput(session, "left", selected = "Not Present")

    updateAwesomeRadio(session, "lang", selected = "99")
    updateCheckboxGroupInput(session, "imm", selected = "99")
    updateCheckboxGroupInput(session, "vict", selected = "99")
    updateSwitchInput(session, "irony", value = F)

    updateSliderTextInput(session, "anti_fem", selected  = "Not Present")
    updateSliderTextInput(session, "race", selected = "Not Present")
    updateSliderTextInput(session, "anti_sem", selected = "Not Present")
    updateSliderTextInput(session, "anti_mus", selected = "Not Present")

    shinyjs::enable("start")
  })

  # previous button
  observeEvent(input$pre, {
    x <- input$select - 1
    updateNumericInput(session, "select", value = x)
  })

  # starring button
  observeEvent(input$star, {
    # extract index
    isolate({
      sel <- input$select
    })

    # (un-) starring
    if(raw$dat$star[sel] %in% "1"){
      raw$dat$star[sel] <- NA
    } else {
      raw$dat$star[sel] <- 1
    }
  })

  # write into data frame
  observeEvent(input$submit, {  #observe
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
      coder <- user()
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

    with_label_id <- with_label_id %>%
      googlesheets::gs_add_row(input = raw$dat[index, ])
  })

  output$tab <- DT::renderDataTable({
    raw$dat
  })
}