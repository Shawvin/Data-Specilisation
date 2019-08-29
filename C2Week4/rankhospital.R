#The function takes three arguments: the 2-character
#abbreviated name of a state and an outcome name
#and the ranking of a hospital (num),return a 
#character vector with the name of the hospital

rankhospital <- function(state,outcome,num){
    data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
    if (!state %in% data[,"State"])
        stop("invalid state")
    disease<-c("heart attack","heart failure","pneumonia")
    if (!outcome %in% disease)
        stop("invalid outcome")
    temp<-data[state==data[,"State"],]
    temp<-(temp[c(2,11,17,23)])
    names(temp)<-c("name",disease)
    temp<-temp[!temp[,outcome]=="Not Available",]
    temp[,outcome]<-as.numeric(temp[,outcome])
    o<-order(temp[,outcome],temp[,1])
    result<-temp[o,]
    n=nrow(result)
    if (num=="best")
        as.character(result[1,1])
    else if (num=="worst")
        as.character(result[n,1])
    else if (num>n)
        NA
    else
        as.character(result[num,1])
}  