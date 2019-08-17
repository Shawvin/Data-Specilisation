url="https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv"

download.file(url,"gaData.csv")

library(lubridate) # For year() function below
library(forecast)

dat = read.csv("gaData.csv")

training = dat[year(dat$date) < 2012,]

testing = dat[(year(dat$date)) > 2011,]

tstrain = ts(training$visitsTumblr)
tstest = ts(testing$visitsTumblr,start=366)
modFit<-bats(tstrain)

pred<-forecast(modFit,h=nrow(testing),level=95)
t<-table(tstest<pred$upper&tstest>pred$lower)
prop.table(t)


