pollutantmean<-function(directory, pollutant, id=1:332)
	{dir<-paste(getwd(),directory,sep="/")
	setwd("C:/Users/Wang Xiaoyuan/Desktop/coursera/specdata")
      data<-data.frame()
	for (i in id)
		{file_id<-sprintf("%03d", i)
		file<-paste(file_id,"csv",sep=".")
		temp_data<-read.csv(file)
		data<-rbind(data,temp_data)}
	if(pollutant=="sulfate")
		{temp<-data[!is.na(data[,2]),]
		print(mean(temp[,2]))}
	if(pollutant=="nitrate")
		{temp<-data[!is.na(data[,3]),]
		print(mean(temp[,3]))}
       }

        
