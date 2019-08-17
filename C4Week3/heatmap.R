set.seed(1234)

x<-rnorm(12,rep(1:3,each=4),sd=0.2)
y<-rnorm(12,rep(c(1,2,1),each=4),sd=0.2)

par(mar=c(0,0,0,0))
plot(x,y,pch=19,col="blue",cex=2)
text(x+0.05,y+0.05,labels=1:12)

data<-data.frame(x=x,y=y)
kmeansObj<-kmeans(data,centers=3)

set.seed(1234)
data<-as.matrix(data)[sample(1:12),]
kmeansObj2<-kmeans(data,centers=3)

par(mfrow=c(1,3),mar=c(2,4,0.1,0.1))
image(t(data)[,nrow(data):1],yaxt="n")
image(t(data)[,order(kmeansObj$cluster)],yaxt="n")
image(t(data)[,order(kmeansObj2$cluster)],yaxt="n")