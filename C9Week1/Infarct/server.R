library(shiny)
library(tidyr)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
    infarct<-read.table("infarct.csv",sep="\t",header=TRUE)
    infarct1<-gather(infarct,"Indicator","Value",-c(Animal.ID,treatment))
    infarct1$Animal.ID<-factor(infarct1$Animal.ID)
    infarct2<-reactive({
        index<-rep(c(input$AT,input$IA,input$IT),each=nrow(infarct1)/3)
        infarct1[index,]})
    output$plot1 <- renderPlot({
            g<-ggplot(infarct2(),aes(x=Indicator,y=Value,col=Animal.ID,group=treatment,cex=1.5))
            g+geom_jitter(aes(pch=treatment),position=position_dodge(0.5))+theme_bw()
        })
    infarct3<-reactive({
    brushedPoints(infarct2(),input$brush1,xvar="Indicator",yvar="Value")
    })
    
    output$table1<-renderTable({
        infarct3()
    })
    
    output$plot2<-renderPlot({
        infarct4<-infarct3()%>% group_by(treatment,Indicator) %>% summarise(mean=mean(Value),se=sd(Value)/sqrt(length(Value)))
        g<-ggplot(infarct4,aes(x=Indicator,y=mean,col=treatment,group=treatment))
        g+geom_point(position=position_dodge(0.5),cex=3)+geom_errorbar(aes(ymin=mean-se,ymax=mean+se),width=0.1,position=position_dodge(0.5))
    })
   
})
