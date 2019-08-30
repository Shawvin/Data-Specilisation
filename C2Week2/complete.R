## a function that reads a directory full of files and reports the number of completely observed cases 
##in each data file. 


complete<-function(directory=specdata,id=1:332)
      {
      dir<-paste(getwd(),directory,sep="/")
      nobs<-c()
      for (i in id)
          {
          file_id<-sprintf("%03d", i)
          file_name<-paste(file_id,"csv",sep=".")
          file_path<-paste(dir,file_name,sep="/")
          
          temp_data<-read.csv(file_path)
          number=sum(complete.cases(temp_data))
          nobs<-c(nobs,number)}
          data.frame(id=id, nobs=nobs)
      }