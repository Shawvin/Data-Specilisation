#read the data
data<-readRDS("summarySCC_PM25.rds")
code<-readRDS("Source_Classification_Code.rds")

#select the SCC which represent motor vehicle
Vehicle<-grep("[Vv]ehicle",code[,3])
selectedSCC<-as.character(code[Vehicle,][,1])

#subset the data for motor vehicle and baltimore city
data<-subset(data,fips=="24510" & SCC %in% selectedSCC)

#split the data by year and sum the total emissions
q5plot<-with(data,tapply(Emissions,year,sum,na.rm=TRUE))
plot(names(q5plot),q5plot,pch=19,cex=2,col="red",xlab="Year",ylab="PM2.5 Emission")
lines(names(q5plot),q5plot)
title(main="PM2.5 Emission from Motor Vehicle")

#create image
dev.copy(png,"plot5.png")
dev.off()