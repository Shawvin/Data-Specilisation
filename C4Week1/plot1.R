#assign the filepath
path<-"./C4Week1/household_power_consumption.txt"

#read the data as dataframe,and dataype of each column as character vector
data<-read.csv2(path,colClasses="character")

#subset the data for plotting
plotdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert the selected column to numeric vector
plotdata[,3:9]<-sapply(plotdata[3:9],as.numeric)

#plot with histogram
hist(plotdata[,3],col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#print the plot to png file
dev.copy(png,file="./C4Week1/plot1.png")
dev.off()
