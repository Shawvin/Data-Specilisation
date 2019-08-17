library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)

adData<-data.frame(diagnosis,predictors)
inTrain<-createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training<-adData[ inTrain,]
testing<-adData[-inTrain,]

dim(training)
selected<-grep("^IL",names(training),value=TRUE)

par(mfrow=c(1,2))
smallTrain<-training[,selected]
prComp1<-prcomp(smallTrain)
summary(prComp1)
plot(prComp1$x[,1],prComp1$x[,2])
#prComp1$rotation

preObj<-preProcess(smallTrain,method="pca",thresh = 0.8)
preObj2<-preProcess(smallTrain,method="pca",thresh = 0.9)
prComp2<-predict(preObj,smallTrain)
summary(preObj)
preObj$rotation
preObj
preObj2
summary(prComp2)
plot(prComp2[,1],prComp2[,2])