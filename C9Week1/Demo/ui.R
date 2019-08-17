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
    titlePanel("Data Science FTW"),

    sidebarLayout(
        sidebarPanel(
        h1("H1 Content"),
        h2("H2 Content"),
        h3("H3 Content")
        ),

        # Show a plot of the generated distribution
        mainPanel(
        h3("Main Panel text"),
        code("Some code")
        )
    )
))
