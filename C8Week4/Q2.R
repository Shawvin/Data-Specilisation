library(caret)
library(gbm)

set.seed(3433)
library(AppliedPredictiveModeling)

data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

modFit1<-train(diagnosis~.,data=training,method="rf")
modFit2<-train(diagnosis~.,data=training,method="gbm")
modFit3<-train(diagnosis~.,data=training,method="lda")

pred1<-predict(modFit1,testing)
pred2<-predict(modFit2,testing)
pred3<-predict(modFit3,testing)

df<-data.frame(pred1,pred2,pred3,diagnosis=testing$diagnosis)

modFit<-train(diagnosis~.,data=df,method="rf")
pred<-predict(modFit,df)
confusionMatrix(pred1,testing$diagnosis)$overall[1]
confusionMatrix(pred2,testing$diagnosis)$overall[1]
confusionMatrix(pred3,testing$diagnosis)$overall[1]
confusionMatrix(pred,testing$diagnosis)$overall[1]

