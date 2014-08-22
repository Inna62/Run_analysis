# Merging the test sets

## Read in the data
subjectTest<-read.table("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
yTest<-read.table("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
xTest <- scan("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt", what="", sep="\n")
## Separate elements by one or more whitepace
xxTest <- strsplit(xTest, "[[:space:]]+")
## Extract the first vector element and set it as the list element name
names(xxTest) <- sapply(xxTest, `[[`, 1)
## Remove the first vector element from each list element
xxTest <- lapply(xxTest, `[`, -1)
##convert class list to numeric
bar <- do.call(rbind, lapply(xxTest, as.numeric))
## Merging the test sets
Test<-cbind(subjectTest, yTest, bar)

## Merging the training sets
subjectTrain<-read.table("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
yTrain<-read.table("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
xTrain <- scan("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt", what="", sep="\n")
xxTrain <- strsplit(xTrain, "[[:space:]]+")
names(xxTrain) <- sapply(xxTrain, `[[`, 1)
xxTrain <- lapply(xxTrain, `[`, -1)
bar2 <- do.call(rbind, lapply(xxTrain, as.numeric))
Train<-cbind(subjectTrain, yTrain, bar2)
## Merges the training and the test sets to create one data set
DATA<-rbind(Test, Train)
## Shaping data set 

## Creating result set of tidy data
Result<-matrix(1:180, 30, 6)
row.names(Result)<-c(1:30)

for (g in 1:30) {
    DATA1<-data.frame()              
    DATA1<-DATA[which(DATA[,1]==g),]           ## subset subject
    for (i in 1:6) {
        DATA2<-data.frame() 
        DATA3<-data.frame()
        DATA2<-DATA1[which(DATA1[,2]==i),]     ## subset activity
        DATA3<-DATA2[,3:563]
        Result[g,i]<-mean(as.matrix(DATA3))    ## Create a tidy data set with the average of each variable for each activity and each subject 
    }
}
## read descriptive activity names
Label<-read.table("C:/Users/Inna/Desktop/Coursera/Getting&CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
## name the activities in the data set
colnames(Result)<-Label[,2]
Result
