set.seed(1234)

x<-rnorm(12,rep(1:3,each=4),sd=0.2)
y<-rnorm(12,rep(c(1,2,1),each=4),sd=0.2)

par(mar=c(0,0,0,0))
plot(x,y,pch=19,col="blue",cex=2)
text(x+0.05,y+0.05,labels=1:12)

data<-data.frame(x=x,y=y)
distxy<-dist(data)
print(distxy)
hclustering<-hclust(distxy)
par(mar=c(4,4,4,2))
plot(hclustering)