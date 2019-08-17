set.seed(12345)

par(mar=rep(0.2,4))
data<-matrix(rnorm(400),nrow=40)

set.seed(678910)
for (i in 1:40){
	coinflip<-rbinom(1,size=1,prob=0.5)
	if(coinflip){
	data[i,]<-data[i,]+rep(c(0,3),each=5)
	}
}