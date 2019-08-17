#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Demo slider"),

    sidebarLayout(
        sidebarPanel(
            h1("Move the Slider"),
            sliderInput("slider2",
                        "slide me!",
                        min = 0,
                        max = 100,
                        value = 0)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("slider value:"),
            textOutput("text1")
        )
    )
))
