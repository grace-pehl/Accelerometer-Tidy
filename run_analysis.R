library(dplyr)
############## 0. GET THE DATAFILE ############
sourceURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourcefile = "getdata-projectfiles-UCI HAR Dataset.zip"
datadirectory = "UCI HAR Dataset"

### check if data directory already exists
if (suppressWarnings(dir.create(datadirectory)) == TRUE){
    ### download the file, if necessary
    if (!file.exists(sourcefile)){
        download.file(sourceURL, sourcefile, mode="wb")
    }
    ### unzip the file into local directory
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
step1_dataset <- rbind(training_set, testing_set)

################# 2. EXTRACT MEAN AND STDV FOR EACH MEASUREMENT #########
# exclude meanFreq(uency) of fourier transformed measurements
step2_dataset <- select(step1_dataset, Subject, Activity,
                            grep("mean|std", names(step1_dataset)), 
                            -grep("meanFreq", names(step1_dataset)))

################# 3. USE DESCRIPTIVE ACTIVITY NAMES #########
# read in activities
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# convert integers in dataset into activities
step3_dataset <- mutate(step2_dataset, Activity = activity_labels[Activity, 2])

################# 4. LABEL WITH DESCRIPTIVE VARIABLE NAMES ####
## NOTE: Descriptive variable names were applied when the data was read in,
##       using the col.names option in read.table.
##       However, some of the variable names have a typo

# assign values from old variable names
step4_dataset <- step3_dataset
# remove duplicate "Body" from some variable names
names(step4_dataset) <- gsub("BodyBody", "Body", names(step3_dataset))
# simplify variable names (problematic characters were converted to . when used as col.names)
names(step4_dataset) <- gsub("\\.mean\\.\\.", "Mean", names(step4_dataset))
names(step4_dataset) <- gsub("\\.std\\.\\.", "Stdv", names(step4_dataset))
# replace last problematic character before axis 
names(step4_dataset) <- gsub("\\.", "_", names(step4_dataset))

############ 5. AVERAGE EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT #####
step5_dataset <- step4_dataset %>% 
    group_by(Subject, Activity) %>% 
    summarise_each(funs(mean))

########## 6. CREATE OUTPUT FILE FOR SUBMISSION ########
write.table(step5_dataset, file = "SamsungData_tidy.txt", row.names = FALSE)

