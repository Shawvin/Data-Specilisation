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
smallTrain<-training[,c(selected,"diagnosis")]
smallTest<-testing[,c(selected,"diagnosis")]


modelFit1<-train(diagnosis~.,data=smallTrain,method="glm")
#modelFit2<-train(diagnosis~.,data=smallTrain,method="glm",preProcess="pca")
modelFit2<-train(diagnosis~.,data=smallTrain,method="glm",preProcess="pca",trControl=trainControl(preProcOptions = list(thresh = 0.8)))

confusionMatrix(smallTest$diagnosis,predict(modelFit1,smallTest))
confusionMatrix(smallTest$diagnosis,predict(modelFit2,smallTest))
