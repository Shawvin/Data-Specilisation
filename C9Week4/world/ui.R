#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# The app will show user the dynamic world map according to the features
# chosen by user


library(shiny)
library(shinythemes)

shinyUI(fluidPage(
    theme=shinytheme("cerulean"),
    
    titlePanel("Feature Design"),

    sidebarLayout(
        sidebarPanel(
            radioButtons("var1","ColorPalette",
                         list("PinkYellowGreen"="PiYG",
                              "PurpleOrange"="PuOr",
                              "RedBlue"="RdBu",
                              "RedYellowBlue"="RdYlBu",
                              "RedYellowGreen"="RdYlGn"),
                         ),
            br(),
            sliderInput("var2","Longitude",min=-180,max=180,value=0,step=10),
            sliderInput("var3","Latitude",min=-90,max=90,value=0,step=10),
            sliderInput("var4","Angle",min=-180,max=180,value=0,step=10)
        ),

       
        mainPanel(
            h2('World Map'),
            plotOutput("distPlot")
        )
    )
))
