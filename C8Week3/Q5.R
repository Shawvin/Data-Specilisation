library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
library(caret)
library(randomForest)

modFit1<-train(y~.,data=vowel.train,method="rf")
modFit2<-randomForest(y~.,data=vowel.train)
importance(modFit2)
