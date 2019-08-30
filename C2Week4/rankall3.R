## The function takes two arguments:an outcome name (outcome) and the ranking of 
## a hospital (num), and returns a 2-column data frame with the name of the hospital
## in each state that has the ranking specified in num

rankall <- function(outcome,num="best"){
    data<-read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE)
    disease<-c("heart attack","heart failure","pneumonia")
    if (!outcome %in% disease)
        stop("invalid outcome")
  
    data<-data[order(data$State),]
    statenames<-unique(data$State)
    temp<-(data[c(2,7,11,17,23)])
    colnames(temp)<-c("hospital","State",disease)
  
    temp<-temp[!temp[,outcome]=="Not Available",]
}