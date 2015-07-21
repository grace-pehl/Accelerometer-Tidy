library(dplyr)
############## 0. GET THE DATAFILE ############
sourceURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourcefile = "getdata-projectfiles-UCI HAR Dataset.zip"
datadirectory = "UCI HAR Dataset"

### download the file, if necessary
if (!file.exists(sourcefile)){
    download.file(sourceURL, sourcefile, mode="wb")
}
### unzip the file into local directory
if (suppressWarnings(dir.create(datadirectory)) == TRUE){
    unzip(sourcefile)
}      

############## 1. MERGE TRAINING AND TEST SETS #######
### features.txt: List of all features
features <- read.table("./UCI HAR Dataset/features.txt")
### read in data sets using features as column labels
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                      col.names = features[,2])
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                     col.names = features[,2])
### add column to each dataset to identify the experimental subject
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = "Subject")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names = "Subject")
xsub_train <- cbind(subject_train, x_train)
xsub_test <- cbind(subject_test, x_test)
### add column to identify activity being performed by the experimental subject
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names = "Activity")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names = "Activity")
training_set <- cbind(y_train, xsub_train)
testing_set <- cbind(y_test, xsub_test)
### merge training and testing datasets
complete_dataset <- rbind(training_set, testing_set)

################# 2. EXTRACT MEAN AND STDV FOR EACH MEASUREMENT #########
extracted_dataset <- select(complete_dataset, Subject, Activity,
                            grep("mean|std", names(complete_dataset)), 
                            -grep("meanFreq", names(complete_dataset)))

################# 3. APPLY DESCRIPTIVE ACTIVITY NAMES #########
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_dataset <- mutate(extracted_dataset, Activity = activity_labels[Activity, 2])
