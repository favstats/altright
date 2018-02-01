instructions_UI <- function(id){
  ns <- NS(id)
  tagList(
    semanticPage(
      div(class="ui very padded piled segment",
        div(class="ui left floated inverted circular segment",
          h2(class="ui inverted header",
            "Hi."
          )
        ),
        br(),
        p("Welcome to this new crowd sourcing platform. The goal is to annotate/label social media posts according to different concepts. The main interest is the sentiment of a given text passage.", 
          "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases. In the following we provide sample cases and core explainations of what we want to explicitly measure."),
        br()
      ),
      br(),
      div(class="ui three column grid",
        div(class="column",
          div(class="ui padded raised segment",
            div(class="ui red ribbon label", "Overview"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases.",
            br(),
            div(class="ui blue ribbon label", "Community"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases."
          )
        ),
        div(class="column",
          div(class="ui padded raised segment",
            div(class="ui red ribbon label", "Overview"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases.",
            br(),
            div(class="ui blue ribbon label", "Community"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases."
          )
        ),
        div(class="column",
          div(class="ui padded raised segment",
            div(class="ui red ribbon label", "Overview"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases.",
            br(),
            div(class="ui blue ribbon label", "Community"),
            "By doing so we produce trainig data to which language models (LSTM and word2vec) are fitted in order to predict *future* cases."
          )
        )
      )
    )
  )
}

instructions <- function(input, output, session){
  
}



