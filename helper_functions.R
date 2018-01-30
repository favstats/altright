get_replies <- function(html) {
  
  html_list <- html %>%
    ### debug
    #remDr$getPageSource()[[1]] %>% read_html() %>%
    #html_nodes("#stream-items-id") %>%
    html_nodes(".permalink-descendant-tweet, .js-initial-focus") 
  
  reply_list <- list()
  
  for(jj in seq_along(html_list)){
    
    names <- html_list[jj] %>%
      html_nodes(".js-nav .u-textTruncate b") %>%
      html_text()
    if(is.null(names)) names <- NA
    
    text <- html_list[jj] %>%
      html_nodes(".tweet-text") %>%
      html_text()
    if(is.null(text)) text <- NA
    
    dates <- html_list[jj] %>%
      html_nodes(".js-short-timestamp") %>%
      html_text() 
    if(is.null(dates)) dates <- NA
    
    favorites <- html_list[jj] %>%
      html_nodes(".js-actionFavorite .ProfileTweet-actionCountForPresentation") %>%
      html_text() %>%
      as.numeric() 
    if(is.null(favorites)) favorites <- NA
    
    retweets <- html_list[jj] %>%
      html_nodes(".js-actionRetweet .ProfileTweet-actionCountForPresentation") %>%
      html_text() %>%
      as.numeric() 
    if(is.null(retweets)) retweets <- NA
    
    comments <-  html_list[jj] %>%
      html_nodes(".js-actionReply .ProfileTweet-actionCountForPresentation") %>%
      html_text() %>%
      as.numeric() 
    if(is.null(comments)) comments <- NA
    
    # reply_list[[jj]] <- data.frame(
    #   names = names[1],
    #   dates = dates[1],
    #   text = text[1],
    #   favorites = favorites[1],
    #   retweets = retweets[1],
    #   comments = comments[1],
    #   stringsAsFactors = F
    # )
    reply_list[[jj]] <- data.frame(
      names, dates, text,
      favorites, retweets, comments,
      stringsAsFactors = F
    )
  }
  
  replies <- reply_list %>%
    bind_rows() # do.call("rbind", reply)
  
  return(replies)
}

get_replies_scroll <- function(handle, ids) {
  
  ### scroller script
  css_element <- "#permalink-overlay-dialog > div.PermalinkOverlay-content > div > div > div.permalink-footer" # target element
  script <- "arguments[0].scrollIntoView(true);" # scroller function
  
  ntweets <- function(){
    ntweets <- remDr$getPageSource()[[1]] %>% 
      read_html() %>%
      html_nodes(".js-nav .u-textTruncate b") %>%
      html_text() %>% 
      length()
  }

  ### prep
  u <- paste0("https://twitter.com/", handle, "/status/", ids, "?lang=en")
  #u <- "https://twitter.com/ArktosMedia/status/821845084962516992" # produces error
  #u <- "https://twitter.com/LevineJonathan/status/957265312646352897"
  #u <- "https://twitter.com/ArktosMedia/status/920564862874472448"
  
  replies_page_list <- list()
  
  for(jj in seq_along(u)) {
  
    
    #does tweet exist
    test <- tryCatch({
      xml2::read_html(u[jj]) %>% 
        html_text() %>% 
        str_detect("This account has been suspended.")
    }, 
    error = function(e){
      e
    }, finally = function(){
      closeAllConnections()
    }) 
    
    if (any(names(test) == "message")) {
      if (stringr::str_detect(stringr::str_to_lower(test$message), "error")) {
        cat(red("WARNING:") %+% white(" Tweet not found... moving on\n")) 
        return(NA)
      }
    }
    else if (test) {
      cat(red("WARNING:") %+% white(" Account Suspended\n")) 
        return(NA)
      }
    
    
    # call twitter url
    remDr$navigate(u[jj])

    ### scroller
    k <- 50
    ntw_before <- ntweets()
    
    while(k > 0){
      tryCatch({
        # scroll
        webElem <- remDr$findElement("css", css_element)
        remDr$executeScript(script, args = list(webElem))
        Sys.sleep(1)
        
        ntw_after <- ntweets()
        
        if(ntw_before == ntw_after) {
          k <- 0
          cat(green("Done scrolling! Next tweet: \n"))
        } else {
          k <- k - 1
          ntw_before <- ntw_after
          cat(green(k) %+% blue(" scrolls remain ...\n"))
        }
        
      }, error = function(e){
        k <- 0
      })
    }
    
    tryCatch({
      remDr$getPageSource()[[1]] %>% 
        xml2::read_html() %>%
        get_replies() -> replies_page_list[[jj]] 
    }, error = function(e){
      replies_page_list[[jj]] <- NULL
      cat("sorry not found.")
    })
  }
  
  replies_all <- replies_page_list %>% 
    bind_rows() %>%
    filter(!duplicated(text)) %>%
    filter(!is.na(text))
  if(is.data.frame(replies_all)) replies_all$handle <- handle
  
  return(replies_all)
}


get_tweet_replies <- function(dat, start, end){
  
  sqp <- start:end
  final_list <- list()
  
  for(jj in seq_along(sqp)) {
    paste0("\n +++ Tweet #: ", sqp[jj], " by: ", dat$handler[sqp[jj]], " +++ \n") %>%
      bgRed$bold() %>%
      cat()
    beepr::beep(1)
    rd <- get_replies_scroll(
      handle = dat$handler[sqp[jj]], 
      ids = dat$tweet_id[sqp[jj]]
    ) 
    
    file_exists <- file.exists(
      paste0("data/final_list", "_", start, "_", sqp[jj] - 1, ".Rdata"))
    is_available <- (is.data.frame(rd) & !is.null(rd))
    
    final_list[[jj]] <- rd
    
    if(is_available) {
      if(file_exists){
        file.remove(paste0("data/final_list", "_", start, "_", sqp[jj] - 1, ".Rdata"))
      } 
      
      save(final_list, file = paste0("data/final_list", "_", start, "_", sqp[jj], ".Rdata"))
      
    }
  }
  return(final_list)
}