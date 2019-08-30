## The function takes two arguments:an outcome name (outcome) and the ranking of 
## a hospital (num), and returns a 2-column data frame with the name of the hospital
## in each state that has the ranking specified in num


rankall <- function(outcome,num="best"){
        data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
disease<-c("heart attack","heart failure","pneumonia")
  if (!outcome %in% disease)
    stop("invalid outcome")
  statenames<-levels(data$State)
  temp<-(data[c(2,7,11,17,23)])
  colnames(temp)<-c("hospital","State",disease)
  temp<-temp[!temp[,outcome]=="Not Available",]
  hospital<-NULL
  for (state in statenames){
    temp<-temp[state==data[,"State"],]
    temp[,outcome]<-as.numeric(temp[,outcome])
    o<-order(temp[,outcome],temp[,1])
    result<-temp[o,]
    n=nrow(result)
    if (num=="best")
      hospital<-c(hopsital,as.character(result[1,1]))
    else if (num=="worst")
      hospital<-c(hospital,as.character(result[n,1]))
    else if (num>n)
      hospital<-c(hospital,NA)
    else
      hospital<-c(hospital,as.charcter(result[num,1])
  }
  resultdata<-data.frame(row.names=statenames,hospital=hospital,state=statenames)
  resultdata
}