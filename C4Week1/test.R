path<-"./C4Week1/household_power_consumption.txt"
data<-read.csv2(path,colClasses="character")
plotdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
plotdata[,3:9]<-sapply(plotdata[3:9],as.numeric)
plotdata[,2]<-paste(plotdata[,1],plotdata[,2])
time<-strptime(plotdata[,2],"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
