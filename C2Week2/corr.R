##This function takes a directory of data files and a threshold for complete cases and 
##calculates the correlation between sulfate and nitrate for monitor locations where
##the number of completely observed cases (on all variables) is greater than the threshold. 

corr<-function(directory, threshold=0)
        {
        dir<-paste(getwd(),directory,sep="/")
        cr<-c()
        for (i in 1:332)
            {
            file_id<-sprintf("%03d", i)
            file_name<-paste(file_id,"csv",sep=".")
            file_path<-paste(dir,file_name,sep="/")
            
            temp_data<-read.csv(file_path)
            final_data<-temp_data[complete.cases(temp_data),]
            if (nrow(final_data)>threshold)
                cr<-c(cr,cor(final_data[,2],final_data[,3]))
            
        }
        cr
}
    