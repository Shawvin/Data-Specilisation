complete<-function(directory,id=1:332)
      {dir<-paste(getwd(),directory,sep="/")
      setwd("C:/Users/Wang Xiaoyuan/Desktop/coursera/specdata")
      nobs<-c()
      for (i in id)
        {file_id<-sprintf("%03d", i)
        file<-paste(file_id,"csv",sep=".")
        temp_data<-read.csv(file)
        final_data<-temp_data[complete.cases(temp_data),]
        number=nrow(final_data)
        nobs<-c(nobs,number)}
      data.frame(id=id, nobs=nobs)
}