#The function takes two arguments:an outcome name
#(outcome) and the ranking of a hospital (num), and 
#returns a 2-column data frame with the name of the
#hospital in each state that has the ranking specified
#in num

rankall <- function(outcome,num="best")
    {data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
    disease<-c("heart attack","heart failure","pneumonia")
    if (!outcome %in% disease)
        stop("invalid outcome")
    data<-data[order(data[,"State"]),]
    statenames<-unique(data$State)
    temp<-(data[c(2,7,11,17,23)])
    colnames(temp)<-c("hospital","State",disease)
    temp<-temp[!temp[,outcome]=="Not Available",]
    hospital<-NULL
    for (state in statenames)
        {state_temp<-temp[state==temp[,"State"],]
        state_temp[,outcome]<-as.numeric(state_temp[,outcome])
        o<-order(state_temp[,outcome],state_temp[,1])
        result<-state_temp[o,]
        n=nrow(result)
        if (num=="best")
            hospital<-c(hopsital,as.character(result[1,1]))
        else if (num=="worst")
            hospital<-c(hospital,as.character(result[n,1]))
        else if (num>n)
          hospital<-c(hospital,NA)
        
        else
            hospital<-c(hospital,as.character(result[num,1]))     
        }
    resultdata<-data.frame(row.names=statenames,hospital=hospital,state=statenames)
    resultdata
  }    