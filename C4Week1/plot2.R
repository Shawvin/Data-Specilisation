#assign the filepath
path<-"./C4Week1/household_power_consumption.txt"

#read the data as dataframe,and dataype of each column as character vector
data<-read.csv2(path,colClasses="character")

#subset the data for plotting
plotdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert the selected column to numeric vector
plotdata[,3:9]<-sapply(plotdata[3:9],as.numeric)

#convert the time to Posixit format
plotdata[,2]<-paste(plotdata[,1],plotdata[,2])
time<-strptime(plotdata[,2],"%d/%m/%Y %H:%M:%S")

#plot with lines
plot(time,plotdata[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")

#print the plot to png file
dev.copy(png,file="./C4Week1/plot2.png")
dev.off()

