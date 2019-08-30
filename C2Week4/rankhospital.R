## The function takes three arguments: the 2-character abbreviated name of a state 
## and an outcome name and the ranking of a hospital (num),return a #character vector 
## with the name of the hospital


## The function reads theoutcome-of-care-measures.csvfile and returns a character 
## vector with the name of the hospital that has the ranking specified by the
## num argument.

rankhospital <- function(state,outcome,num){
        data<-read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE)
        if (!state %in% data[,"State"])
            stop("invalid state")
        disease<-c("heart attack","heart failure","pneumonia")
        if (!outcome %in% disease)
            stop("invalid outcome")
            
        temp<-data[data$State==state,]
        temp<-(temp[c(2,11,17,23)])
        names(temp)<-c("name",disease)
        
        temp<-temp[!temp[,outcome]=="Not Available",]
        temp[,outcome]<-as.numeric(temp[,outcome])
        o<-order(temp[,outcome],temp$name)
        result<-temp[o,]
        n=nrow(result)
        if (num=="best")
            result[1,1]
        else if (num=="worst")
            result[n,1]
        else if (num>n)
            NA
        else
            result[num,1]
}  