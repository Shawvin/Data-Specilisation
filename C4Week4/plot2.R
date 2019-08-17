#read the data
data<-readRDS("summarySCC_PM25.rds")

#subset the data for the baltimore City
data<-subset(data,fips=="24510")

#split the data by year and sum the total emissions
q2plot<-with(data,tapply(Emissions,year,sum,na.rm=TRUE))
plot(names(q2plot),q2plot,pch=19,cex=2,col="red",xlab="Year",ylab="Total Emission")
lines(names(q2plot),q2plot)
title(main="PM2.5 Emission in Baltimore City")

#create image
dev.copy(png,"plot2.png")
dev.off()