#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggplot2)
library(plotly)
library(dplyr)
library(gridExtra)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
 # output$result <- renderText({
  #  paste("You chose", input$XAxis)
 # })
  
  observeEvent(input$XAxis,{
    
    mpginshwy<-data.frame(mpg[,input$XAxis],mpg$hwy)
    
    colnames(mpginshwy) <- c("x", "y")
    
    mpginscty<-data.frame(mpg[,input$XAxis],mpg$cty)
    
    colnames(mpginscty) <- c("x", "y")
    
    
    plotinshwy<-plot_ly(mpginshwy, x=~x, y=~y, type="box")
    
    plotinshwy<-plotinshwy %>%  layout(title = "Mileage Per Gallons",
                                       xaxis = list(title = input$XAxis),
                                       yaxis = list(title = "Highway Mileage"))
    
    plotinscty<-plot_ly(mpginscty, x=~x, y=~y, type="box")
    plotinscty<-plotinscty %>%  layout(title = "Mileage Per Gallons",
                                       xaxis = list(title = input$XAxis),
                                       yaxis = list(title = "City Mileage"))
    
    
    output$mpgplot<-renderPlotly({
      
      subplot(plotinshwy,plotinscty,titleX = TRUE, titleY = TRUE)
      
      #plotinshwy
      #plotinscty
      
    })
  }
  )
  
})
