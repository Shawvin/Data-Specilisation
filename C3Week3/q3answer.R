library(dplyr)
q31=read.csv("./C3Week3/q31.csv",skip=3,stringsAsFactors=FALSE)
q31<-select(q31,names(q31)[c(1:2,4:5)])[(2:191),]
q31<-rename(q31,Code=X)
q32<-read.csv("./C3Week3/q32.csv")
n<- sum(q31$Code %in% q32[,1])
print(n)

country<-arrange(q31,desc(as.numeric(Ranking)))[13,3]
print(country)