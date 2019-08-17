library(ElemStatLearn)
library(caret)

data(vowel.train)

data(vowel.test)

set.seed(33833)

vowel.train$y<-factor(vowel.train$y)
vowel.test$y<-factor(vowel.test$y)

modFit1<-train(y~.,data=vowel.train,method="rf")
modFit2<-train(y~.,data=vowel.train,method="gbm")

pred1<-predict(modFit1,vowel.test)
pred2<-predict(modFit2,vowel.test)

confusionMatrix(pred1,vowel.test$y)$overall[1]
confusionMatrix(pred2,vowel.test$y)$overall[1]

confusionMatrix(pred1,pred2)$overall[1]




