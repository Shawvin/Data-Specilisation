library(shiny)

shinyUI(fluidPage(
    titlePanel("Infarct size"),

    sidebarLayout(
        sidebarPanel(
            checkboxInput("AT","show/hide AAR/TA",value=TRUE),
            checkboxInput("IA","show/hide IA/AAR",value=TRUE),
            checkboxInput("IT","show/hide IA/TA",value=TRUE),
            submitButton("Submit")
        ),

        mainPanel(
            h4("Please select the points:"),
            plotOutput("plot1",brush=brushOpts(id="brush1")),
            tableOutput("table1"),
            plotOutput("plot2")
    )
)
))
