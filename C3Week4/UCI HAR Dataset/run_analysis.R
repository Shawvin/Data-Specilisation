library(dplyr)
library(tidyr)

#working directory will be set as "UCI HAR Dataset" folder
#feature file have the names for 561 vectors
features<-read.table("./features.txt",stringsAsFactors=FALSE)

#activity_label have the code for 6 activities
activity_labels<-read.table("./activity_labels.txt",stringsAsFactors=FALSE)

#determine the discriptive activity name
AL<-c("walking","walkingUp","walkingDown","sitting","standing","laying")

#in the "train" subfolder,subject_train file provide the id for subject in train groups
#x_train file provides the measurement for each subject and each activity
#y_train file provides the activity performed by each subject
subject_train<-read.table("./train/subject_train.txt")
measurement_train<-read.table("./train/x_train.txt")
activity_train<-read.table("./train/y_train.txt")

#we read the same info from "test" subfolder as "train" subfolder
subject_test<-read.table("./test/subject_test.txt")
measurement_test<-read.table("./test/x_test.txt")
activity_test<-read.table("./test/y_test.txt")

#combine train and test dataset
subject<-rbind(subject_train,subject_test)
measurement<-rbind(measurement_train,measurement_test)
activity<-rbind(activity_train,activity_test)

#assign discriptive variable name
names(subject)<-"subjectID"
names(measurement)<-features[,2]
names(activity)<-"activity"

#extracts only the measurements on the mean and 
#standard deviation for each measurement.
vector_mean<-grep("mean",names(measurement),value=TRUE)
vector_std<-grep("std",names(measurement),value=TRUE)

selected_column<-c(vector_mean,vector_std)
selected_measurement<-measurement[c(vector_mean,vector_std)]

data<-cbind(subject,activity,selected_measurement)

#create second tidy dataset with the average of each variable 
#for each activity and each subject.
tidydata<-data %>% split(list(data$subjectID,data$activity)) %>% sapply(function(x) colMeans(x[,selected_column])) %>% t %>% data.frame

id.activity<-rownames(tidydata)
tidydata<-cbind(id.activity,tidydata)
rownames(tidydata)<-NULL

#set the first two column as subject and activity
tidydata<-separate(tidydata,id.activity,c("ID","activity"),sep="\\.")

#assign the activity name
tidydata<-transform(tidydata,activity=AL[as.numeric(activity)])

write.table(tidydata,file="tidydata.txt",row.name=FALSE)





