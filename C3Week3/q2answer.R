library(jpeg)
q2<-readJPEG("./C3Week3/q2.jpg",native=TRUE)
ans<-quantile(q2,probs=c(0.3,0.8)) 
print(ans)