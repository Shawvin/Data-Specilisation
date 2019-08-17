#read the data
data<-readRDS("summarySCC_PM25.rds")

#split the data by year and sum the total emissions
q1plot<-with(data,tapply(Emissions,year,sum,na.rm=TRUE))

plot(names(q1plot),q1plot,pch=19,cex=2,col="red",xlab="Year",ylab="Total Emission")
lines(names(q1plot),q1plot)
title(main="PM2.5 Emission in US")

#create image
dev.copy(png,"plot1.png")
dev.off()