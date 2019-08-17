suppressMessages(library(UsingR))
suppressMessages(library(ggplot2))
data(father.son)
fs<-father.son
x<-(fs$fheight-mean(fs$fheight))/sd(fs$fheight)
y<-(fs$sheight-mean(fs$sheight))/sd(fs$sheight)

rho<-cor(x,y)

g<-ggplot(data.frame(x=x,y=y),aes(x,y))
g<-g+geom_point(color="black",size=6,alpha=0.2)
g<-g+geom_point(color="salmon",size=4,alpha=0.2)
g<-g+xlim(-4,4)+ylim(-4,4)
g<-g+geom_abline(intercept=0,slope=1)
g<-g+geom_vline(xintercept = 0)
g<-g+geom_hline(yintercept = 0)
g<-g+geom_abline(intercept=0,slope=rho,size=2)
g<-g+geom_abline(intercept=0,slope=1/rho,size=2)
g
