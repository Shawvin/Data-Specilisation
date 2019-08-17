#read the data
data<-readRDS("summarySCC_PM25.rds")
code<-readRDS("Source_Classification_Code.rds")

#select the SCC which represent motor vehicle
Vehicle<-grep("[Vv]ehicle",code[,3])
selectedSCC<-as.character(code[Vehicle,][,1])

#subset the data for motor vehicle and baltimore city and Los Angeles
data<-subset(data,fips=="24510"|fips=="06037" & SCC %in% selectedSCC)

#split the data by fips,year and sum the total emissions
q6plot<-with(data,tapply(Emissions,list(fips,year),sum,na.rm=TRUE))

#convert the matrix to dataframe
q6plot<-data.frame(q6plot)
q6plot<-mutate(q6plot,city=c("Los Angeles","Baltimore City"),diff=X1999-X2008)
boxplot(q6plot$diff~q6plot$city)
title(main="Changes in PM2.5 Emission")

#create image
dev.copy(png,"plot6.png")
dev.off()

