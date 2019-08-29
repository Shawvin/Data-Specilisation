#The function takes two arguments: the 2-character
#abbreviated name of a state and an outcome name

best <- function(state,outcome){
    data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
    if (!state %in% data[,"State"])
        stop("invalid state")
    disease<-c("heart attack","heart failure","pneumonia")
    if (!outcome %in% disease)
        stop("invalid outcome")
    temp<-data[state==data[,"State"],]
    temp<-temp[c(2,11,17,23)]
    names(temp)<-c("name",disease)
    temp<-temp[!temp[,outcome]=="Not Available",]
    result<-temp[order(as.numeric(temp[,outcome]),temp[,1]),]
    as.character(result[1,1])
    }