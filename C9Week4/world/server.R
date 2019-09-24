#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.


library(shiny)
library(ggplot2)
library(maps)  
library(RColorBrewer)
library(grid)
library(mapproj)

shinyServer(function(input, output) {
    world_map<-map_data("world")
    world_map$region<-factor(world_map$region)
    
    output$distPlot <- renderPlot({
      g<- ggplot(data=world_map) + geom_polygon(aes(x=long,y=lat,group=group,fill=as.numeric(region)),
                             colour="grey",size=.25)
      g<- g + coord_map("ortho",orientation=c(input$var3,input$var2,input$var4))
      g<- g + scale_y_continuous(breaks=(-6:6)*15) 
      g<- g + scale_x_continuous(breaks=(-12:12)*15)
      g<- g + scale_fill_distiller(name="Region ID",palette=input$var1)
      g<- g + theme(
          panel.background=element_rect(fill="white",colour=NA),
          panel.grid.major = element_line(colour = "grey60",size=.25),
          panel.grid.minor = element_line(colour = "grey60",size=.25),
          axis.text=element_blank(),
          axis.title=element_blank(),
          axis.ticks=element_blank())
      g
    })

})
