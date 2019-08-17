#this program allow user to decide the numbers of random numbers to be generated
#and plot them

library(shiny)

shinyUI(fluidPage(
    titlePanel("Plot Random Points"),

    sidebarLayout(
        sidebarPanel(
            numericInput("num","How many random numbers should be plotted?",
                         1,1000,step=1,value=1000),
            sliderInput("sliderX","Pick the minimum and maximum X values",
                        -100,100,value=c(-50,50)),
            sliderInput("sliderY","Pick the minimum and maximum Y values",
                        -100,100,value=c(-50,50)),
            checkboxInput("show_xlab","Show/Hide X Axis Label",value=TRUE),
            checkboxInput("show_ylab","Show/Hide Y Axis Label",value=TRUE),
            checkboxInput("show_title","Show/Hide Title"),
            checkboxInput("auto_adjust","Automtically adjust Axis",value=TRUE)
        ),    
        mainPanel(
            h1("Graph Of Random Points:"),
            plotOutput("Plot1")
        )
    )
))
