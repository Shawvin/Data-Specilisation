##This function will read the files in specified directory and 
##calculate the mean of pollutant

pollutantmean<-function(directory=specdata, pollutant, id=1:332){
    ##create the diretory and empty data.frame 
    dir<-paste(getwd(),directory,sep="/")
    data<-data.frame()
    for (i in id)
	      {
        file_id<-sprintf("%03d", i)
		    file_name<-paste(file_id,"csv",sep=".")
		    file_path<-paste(dir,file_name,sep="/")
		    temp_data<-read.csv(file_path)
		    data<-rbind(data,temp_data)}
	  if(pollutant=="sulfate")
	      {
	      temp<-data[!is.na(data[,2]),]
		    print(mean(temp[,2]))}
	  if(pollutant=="nitrate")
		    {
        temp<-data[!is.na(data[,3]),]
        print(mean(temp[,3]))}
        }

        
