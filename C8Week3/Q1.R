library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

inTrain<-segmentationOriginal$Case=="Train"
training<-segmentationOriginal[inTrain,]
testing<-segmentationOriginal[!inTrain,]

set.seed(125)
modFit<-train(Class~.,data=training,method="rpart")

dataA<-data.frame(TotalIntench2 = 23,000, FiberWidthCh1 = 10, PerimStatusCh1=2)
dataB<-data.frame(TotalIntench2 = 50,000, FiberWidthCh1 = 10,VarIntenCh4 = 100)
dataC<-data.frame(TotalIntench2 = 57,000, FiberWidthCh1 = 8,VarIntenCh4 = 100 )
dataD<-data.frame(FiberWidthCh1 = 8,VarIntenCh4 = 100, PerimStatusCh1=2)

#predict(modFit$finalModel,dataA)
#predict(modFit,dataB)
#predict(modFit,dataC)
#predict(modFit,dataD)
