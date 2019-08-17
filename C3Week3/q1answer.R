q1<-read.csv("./C3Week3/q1.csv")
agricultureLogical<-(q1$ACR==3&q1$AGS==6)
print(which(agricultureLogical)[1:3])