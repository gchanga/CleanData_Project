#Bind train and test dataset
data <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
features <- read.table("UCI HAR Dataset/features.txt")
names(data) <- features$V2
data <- cbind(data, rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt")))
names(data)[names(data) == 'V1'] <- "activity"
data <- cbind(data, rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt")))
names(data)[names(data) == 'V1'] <- "subject"

#Extract value on the mean and standard deviation and the variables: activity & subject
newdata <- data[,grep("mean\\(\\)|std|activity|subject",names(data))]
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
newdata <- merge(newdata, activity, by.x="activity", by.y="V1")
newdata$activity <- newdata$V2
newdata$V2 <- NULL

#Adding period between words/abbr for easier reading
names(newdata) <- gsub("mean"," mean",names(newdata))
names(newdata) <- gsub("std"," standard deviation",names(newdata))
names(newdata) <- gsub("Acc"," acceleration",names(newdata))
names(newdata) <- gsub("Gyro"," gyroscope",names(newdata))
names(newdata) <- gsub("Jerk"," jerk",names(newdata))
names(newdata) <- gsub("Mag"," magnitude",names(newdata))
names(newdata) <- gsub("Gravity"," gravity",names(newdata))
names(newdata) <- gsub("X"," xaxis",names(newdata))
names(newdata) <- gsub("Y"," yaxis",names(newdata))
names(newdata) <- gsub("Z"," zaxis",names(newdata))

#Replacing the t and f with time and freq, respectively 
names(newdata) <- gsub("^f","frequency ",names(newdata))
names(newdata) <- gsub("^t","time ",names(newdata))

#Removing the () and - symbols and duplicate words
names(newdata) <- gsub( "\\(|\\)|\\-" , "" , names(newdata) )
names(newdata) <- tolower(names(newdata))
names(newdata) <- gsub("bodybody", " body",names(newdata))

#Create a second data set with mean of each var for each activity and each subject
merged <- newdata[0,]
for (i in 1:30) {
  temp <- melt(newdata[newdata$subject==i,], id=c("activity"),measure.vars=names(newdata[,2:67]))
  temp <- dcast(temp, activity ~ variable, mean)
  temp$subject <- i
  merged <- rbind(merged,temp)
}
merged <- merged[,c(68,1:67)]

#Save output data to txt file
write.table(merged, file="Data_Output.txt", row.name=FALSE)
