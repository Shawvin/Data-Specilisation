set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
library(elasticnet)

data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
modFit<-train(CompressiveStrength~.,data=training,method="lasso")
plot.enet(modFit$finalModel,xvar="penalty",use.color=TRUE)
