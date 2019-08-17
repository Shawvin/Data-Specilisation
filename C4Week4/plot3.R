library(dplyr)
library(tidyr)
#read the data
data<-readRDS("summarySCC_PM25.rds")

#subset the data for the baltimore City
data<-subset(data,fips=="24510")

#split the data by year, type and sum the total emissions
q3plot<-with(data,tapply(Emissions,list(year,type),sum,na.rm=TRUE))
#convert the matrix to dataframe
q3plot <- data.frame(q3plot) %>% mutate(year=rownames(q3plot)) %>% gather(type,Emissions,-year)

plot3<-ggplot(q3plot,aes(year,Emissions,group=type))+geom_line(aes(col=type))+geom_point()
print(plot3)

#create image
dev.copy(png,"plot3.png")
dev.off()