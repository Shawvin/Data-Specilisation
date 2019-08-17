
library(shiny)

shinyServer(function(input, output) {
    output$Plot1 <- renderPlot({
        set.seed(2019-08-05)
        number_of_points<-input$num
        min_x<-input$sliderX[1]
        max_x<-input$sliderX[2]
        min_y<-input$sliderY[1]
        max_y<-input$sliderY[2]
        data_X<-runif(number_of_points,min_x,max_x)
        data_y<-runif(number_of_points,min_y,max_y)
        xlab<-ifelse(input$show_xlab,"X axis","")
        ylab<-ifelse(input$show_ylab,"Y axis","")
        main<-ifelse(input$show_title,"Title","")
        if(input$auto_adjust)
        plot(data_X,data_y,xlim=c(min_x,max_x),ylim=c(min_y,max_y),
             xlab=xlab,ylab=ylab,main=main)
        else
        plot(data_X,data_y,xlim=c(-100,100),ylim=c(-100,100),
             xlab=xlab,ylab=ylab,main=main)

    })
})
