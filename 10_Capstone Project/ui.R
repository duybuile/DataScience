
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data Science Capstone - Next word predictor"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("sentence",
                "Input the sentence:",
                "Welcom you to New"),
      submitButton("Predict")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Predictions", 
                 p("Here is a list of 4 predicted next words for your sentence: "),
                 htmlOutput('predicted.word')), 
        tabPanel("About", 
                 p("Author: Duy Bui <duybuile@gmail.com>"),
                 p("Data Science Specialisation - Capstone project"),
                 p("Algorithm: Stupid Backoff"),
                 br(),
                 p("Description:"),
                 p("- Users type  an input sentence into the box and press *Predict*"),
                 p("- The most predictable word will appear, along with 4 other prediction results"),
                 
                 br(),
                 p("Note: Profanity will be removed. The rest of the sentence without profanity will be used for prediction")
        
        )
      )
    )
  )
))