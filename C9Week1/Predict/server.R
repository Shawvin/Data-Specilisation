library(shiny)

shinyServer(function(input, output) {
    mtcars$mpgsp<-ifelse(mtcars$mpg>20,mtcars$mpg-20,0)
    model1<-lm(hp~mpg,data=mtcars)
    model2<-lm(hp~mpg+mpgsp,data=mtcars)
    
    model1pred<-reactive({
        mpgInput<-input$sliderMPG
        predict(model1,data.frame(mpg=mpgInput))
    })
    
    model2pred<-reactive({
        mpgInput<-input$sliderMPG
        predict(model2,data.frame(mpg=mpgInput,
                                mpgsp=ifelse(mpgInput>20,mpgInput-20,0
                                             )))
    })
    
    output$plot1 <- renderPlot({
        mpgInput<-input$sliderMPG
        
        plot(mtcars$mpg,mtcars$hp,xlab="Mile Per Gallon",ylab="Horsepower",
             bty="n",pch=16,xlim=c(10,35),ylim=c(50,350))
        if(input$showModel1)
            abline(model1,col="red",lwd=2)
        if(input$showModel2){
            model2lines<-predict(model2,newdata=data.frame(
                mpg=10:35,mpgsp=ifelse(10:35>20,10:35-20,0)
            ))
            lines(10:35,model2lines,col="blue",lwd=2)
        }
        
        points(mpgInput,model1pred(),col="red",pch=16,cex=2)
        points(mpgInput,model2pred(),col="blue",pch=16,cex=2)

    })
    
    output$predict1<-renderText({
        model1pred()
    })
    output$predict2<-renderText({
        model2pred()
    })

})
