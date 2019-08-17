#read the data
data<-readRDS("summarySCC_PM25.rds")
code<-readRDS("Source_Classification_Code.rds")

#select the SCC which represent coal combustion
Comb<-grep("[Cc]omb",code[,3],value=TRUE)
CoalComb<-grep("[Cc]oal",Comb)
selectedSCC<-as.character(code[CoalComb,][,1])

#subset the data for coal combustion
data<-subset(data,SCC %in% selectedSCC)

#split the data by year and sum the total emissions
q4plot<-with(data,tapply(Emissions,year,sum,na.rm=TRUE))
plot(names(q4plot),q4plot,pch=19,cex=2,col="red",xlab="Year",ylab="PM2.5 Emission")
lines(names(q4plot),q4plot)
title(main="PM2.5 Emission from Coal Combustion")

#create image
dev.copy(png,"plot4.png")
dev.off()