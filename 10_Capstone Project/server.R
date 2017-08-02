library(shiny)

#load("ngram_small.RData")
#load("profanity.RData")

#source("prediction.R")

shinyServer(function(input, output) {
  
  output$predicted.word <- renderUI({
    predictions <- predict(input$sentence) # predict next words
    
    best <- predictions[1]
    rest <- predictions[2:length(predictions)]
    
    best <- paste0("<p><b>Best guess:</b> ", best, "</p>")
    li <- paste(paste0("<li>", rest, "</li>"), collapse ="" )
    li <- paste("<p>Other guesses:<ul>",li,"</ul></p>",sep = "")
    HTML(paste0(best,li))
  })
  
  output$input <- renderText({
    input$sentence
  })
  
})