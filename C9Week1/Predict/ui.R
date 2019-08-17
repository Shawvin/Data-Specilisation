library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Horsepower from MPG"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderMPG","What's the MPG for the car?",10,35,value=20),
            checkboxInput("showModel1","Show/Hide Model1",value=TRUE),
            checkboxInput("showModel2","Show/Hide Model2",value=TRUE)
        ),

        mainPanel(
            plotOutput("plot1"),
            h3("Predicted HorsePower from Model1:"),
            textOutput("predict1"),
            h3("Predicted HorsePower from Model2:"),
            textOutput("predict2")
        )
    )
))
