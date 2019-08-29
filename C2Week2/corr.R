corr<-function(directory, threshold=0)
    {setwd("C:/Users/Wang Xiaoyuan/Desktop/Coursera/specdata")
    cr<-c()
    for (i in 1:332)
        {file_id<-sprintf("%03d", i)
        file<-paste(file_id,"csv",sep=".")
        temp_data<-read.csv(file)
        final_data<-temp_data[complete.cases(temp_data),]
        if (nrow(final_data)>threshold)
            {cr<-c(cr,cor(final_data[,2],final_data[,3]))
            }
        }
    cr
}
    