#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles Per Gallon Data."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("XAxis", "Choose Variable:",
                  c("Number of Cylinders" = "cyl",
                    "Type of Transmission" = "trans",
                    "Engine's Displacement in Liters" = "displ",
                    "Class ( Type) of car"="class")
      )
    #  textOutput("result")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotlyOutput("mpgplot"))
                  ,
                  tabPanel("Usage Guide", includeCSS("Mileage.html"))
      )
    )
  )
))
