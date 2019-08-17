library(shiny)

shinyServer(function(input, output) {
    model1 <- reactive({
        brushed_data<-brushedPoints(trees,input$brush1,
                                    xvar="Girth",yvar="Volume")
        if(nrow(brushed_data)<2){
            return(NULL)
        }
        lm(Volume~Girth,data=brushed_data)
    })
    output$slopeOut<-renderText({
        if(is.null(model1())){
            "No Model Found"
        } else{
            model1()[[1]][2]
        }
            
    })
    output$intOut<-renderText({
        if(is.null(model1())){
            "No Model Found"
        } else {
            model1()[[1]][1]
        } 
    })
    output$plot1<-renderPlot({
        plot(trees$Girth,trees$Volume,xlab="Girth",
             ylab="Volume",main="Tree Measurements",
             cex=1.5,pch=16,bty="n")
        if(!is.null(model1())){
            abline(model1(),col="blue",lwd=2)
        }
    })
    output$table1<-renderTable({
        brushedPoints(trees,input$brush1,
                      xvar="Girth",yvar="Volume")
    })
    
})
