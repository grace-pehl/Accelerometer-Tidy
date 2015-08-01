# Codebook for Samsung Accelerometer Data

Grace Pehl, PhD   7/22/15   Getting and Cleaning Data

## Project Description
Given a set of raw data from [this site] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), compile the text files into a single dataframe and output a tidy dataset ready for analysis.

## Study Design
The raw dataset was taken from *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*.

### Collection of the Raw Data

A complete description of the experimental design is available [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

30 volunteeres aged 19-48 performed 6 activities while wearing a Samsung Galaxy S II smartphone.  Linear acceleration and angular velocity were measured by the phone's embedded accelerometer and gyroscope.

### Notes on the Raw Data

Data was collected at a constant rate of 50 Hz along three axes (XYZ).  Data was subsequently filtered and separated as described for each variable.  All measurements were then normalized to zero with bounds -1, 1.  

##Creating the Tidy Datafile

###Guide to Create the Tidy Data File
1. Download the analysis script run_analysis.R from [GitHub] (https://github.com/grace-pehl/Accelerometer-Tidy/) into your working directory and run the script in R.
2. The script will check if the raw data zip file is present in the directory and download it if necessary.
3. If "/UCI HAR Dataset" is not present, the script will unzip the raw data file
4. The script will merge the training and test data with subject identifiers, activity labels, and measurement variable names.
5. The average of the mean and standard deviation for each measurement will be output for each activity and subject.
6. The output is written to "SamsungData_tidy.txt" using write.table with row.names = FALSE.

###Cleaning of the data
Each activity was perfomed by all subjects multiple times and accelerometer and gyroscope readings were collected.  The normalized mean and standard deviation were calculted for each variable and recorded for each observation.  These means and standard deviations are averaged by the cleaning script to create one pair of values for each measurement per activity and subject.

## Description of the Variables in SamsungData_tidy.txt
### General Description
Dataset is 180 rows by 68 columns with column headers - 219 kB

Rows record the observations for 6 activities performed by each of the 30 subjects.  Columns record Subject, Activity, and mean and standard deviation for 33 measurements.  All measurements were normalized.

From Anguita, et al:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc_XYZ and tGyro_XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#### Structure of Data
Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  68 variables:
 * Subject             : int  1 1 1 1 1 1 2 2 2 2 ...
 * Activity            : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 * tBodyAccMean_X      : num  0.222 0.261 0.279 0.277 0.289 ...
 * tBodyAccMean_Y      : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 * tBodyAccMean_Z      : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 * tBodyAccStdv_X      : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 * tBodyAccStdv_Y      : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 * tBodyAccStdv_Z      : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 * tGravityAccMean_X   : num  -0.249 0.832 0.943 0.935 0.932 ...
 * tGravityAccMean_Y   : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 * tGravityAccMean_Z   : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 * tGravityAccStdv_X   : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 * tGravityAccStdv_Y   : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 * tGravityAccStdv_Z   : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 * tBodyAccJerkMean_X  : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 * tBodyAccJerkMean_Y  : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 * tBodyAccJerkMean_Z  : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 * tBodyAccJerkStdv_X  : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 * tBodyAccJerkStdv_Y  : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 * tBodyAccJerkStdv_Z  : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 * tBodyGyroMean_X     : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 * tBodyGyroMean_Y     : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 * tBodyGyroMean_Z     : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 * tBodyGyroStdv_X     : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 * tBodyGyroStdv_Y     : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 * tBodyGyroStdv_Z     : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 * tBodyGyroJerkMean_X : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 * tBodyGyroJerkMean_Y : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 * tBodyGyroJerkMean_Z : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 * tBodyGyroJerkStdv_X : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 * tBodyGyroJerkStdv_Y : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 * tBodyGyroJerkStdv_Z : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 * tBodyAccMagMean     : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 * tBodyAccMagStdv     : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 * tGravityAccMagMean  : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 * tGravityAccMagStdv  : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 * tBodyAccJerkMagMean : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 * tBodyAccJerkMagStdv : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 * tBodyGyroMagMean    : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 * tBodyGyroMagStdv    : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 * tBodyGyroJerkMagMean: num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 * tBodyGyroJerkMagStdv: num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 * fBodyAccMean_X      : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 * fBodyAccMean_Y      : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 * fBodyAccMean_Z      : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 * fBodyAccStdv_X      : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 * fBodyAccStdv_Y      : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 * fBodyAccStdv_Z      : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 * fBodyAccJerkMean_X  : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 * fBodyAccJerkMean_Y  : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 * fBodyAccJerkMean_Z  : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 * fBodyAccJerkStdv_X  : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 * fBodyAccJerkStdv_Y  : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 * fBodyAccJerkStdv_Z  : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 * fBodyGyroMean_X     : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 * fBodyGyroMean_Y     : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 * fBodyGyroMean_Z     : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 * fBodyGyroStdv_X     : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 * fBodyGyroStdv_Y     : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 * fBodyGyroStdv_Z     : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 * fBodyAccMagMean     : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 * fBodyAccMagStdv     : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 * fBodyAccJerkMagMean : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 * fBodyAccJerkMagStdv : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 * fBodyGyroMagMean    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 * fBodyGyroMagStdv    : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 * fBodyGyroJerkMagMean: num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 * fBodyGyroJerkMagStdv: num  -0.933 -0.987 -0.995 -0.382 -0.392 ...

 #### Subject  
 Subjects were identified with a number from 1 to 30.  
 Min.   : 1.0  
 1st Qu.: 8.0  
 Median :15.5  
 Mean   :15.5  
 3rd Qu.:23.0  
 Max.   :30.0  
#### Activity 
Each subject engaged in each of the six activities while wearing the smartphone at their waist.  
 LAYING            :30  
 SITTING           :30  
 STANDING          :30  
 WALKING           :30  
 WALKING_DOWNSTAIRS:30  
 WALKING_UPSTAIRS  :30  
#### tBodyAccMean_X  
The average mean of the body component of the time domain acceleration signal in the X direction.   
 Min.   :0.2216  
 1st Qu.:0.2712  
 Median :0.2770  
 Mean   :0.2743  
 3rd Qu.:0.2800  
 Max.   :0.3015  
#### tBodyAccMean_Y     
The average mean of the body component of the time domain acceleration signal in the Y direction.   
 Min.   :-0.040514  
 1st Qu.:-0.020022  
 Median :-0.017262  
 Mean   :-0.017876  
 3rd Qu.:-0.014936  
 Max.   :-0.001308  
#### tBodyAccMean_Z    
The average mean of the body component of the time domain acceleration signal in the Z direction.   
 Min.   :-0.15251  
 1st Qu.:-0.11207  
 Median :-0.10819  
 Mean   :-0.10916  
 3rd Qu.:-0.10443  
 Max.   :-0.07538  
#### tBodyAccStdv_X   
The average standard deviation of the body component of the time domain acceleration signal in the X direction.   
 Min.   :-0.9961  
 1st Qu.:-0.9799  
 Median :-0.7526  
 Mean   :-0.5577  
 3rd Qu.:-0.1984  
 Max.   : 0.6269  
#### tBodyAccStdv_Y  
The average standard deviation of the body component of the time domain acceleration signal in the Y direction.   
 Min.   :-0.99024  
 1st Qu.:-0.94205  
 Median :-0.50897  
 Mean   :-0.46046  
 3rd Qu.:-0.03077  
 Max.   : 0.61694  
#### tBodyAccStdv_Z   
The average standard deviation of the body component of the time domain acceleration signal in the Z direction.   
 Min.   :-0.9877  
 1st Qu.:-0.9498  
 Median :-0.6518  
 Mean   :-0.5756  
 3rd Qu.:-0.2306  
 Max.   : 0.6090  
#### tGravityAccMean_X
The average mean of the gravity component of the time domain acceleration signal in the X direction.   
 Min.   :-0.6800  
 1st Qu.: 0.8376  
 Median : 0.9208  
 Mean   : 0.6975  
 3rd Qu.: 0.9425  
 Max.   : 0.9745  
#### tGravityAccMean_Y 
The average mean of the gravity component of the time domain acceleration signal in the Y direction.   
 Min.   :-0.47989  
 1st Qu.:-0.23319  
 Median :-0.12782  
 Mean   :-0.01621  
 3rd Qu.: 0.08773  
 Max.   : 0.95659  
#### tGravityAccMean_Z 
The average mean of the gravity component of the time domain acceleration signal in the Z direction.   
 Min.   :-0.49509  
 1st Qu.:-0.11726  
 Median : 0.02384  
 Mean   : 0.07413  
 3rd Qu.: 0.14946  
 Max.   : 0.95787  
#### tGravityAccStdv_X
The average standard deviation of the gravity component of the time domain acceleration signal in the X direction.   
 Min.   :-0.9968  
 1st Qu.:-0.9825  
 Median :-0.9695  
 Mean   :-0.9638  
 3rd Qu.:-0.9509  
 Max.   :-0.8296  
#### tGravityAccStdv_Y
The average standard deviation of the gravity component of the time domain acceleration signal in the Y direction.   
 Min.   :-0.9942  
 1st Qu.:-0.9711  
 Median :-0.9590  
 Mean   :-0.9524  
 3rd Qu.:-0.9370  
 Max.   :-0.6436  
#### tGravityAccStdv_Z
The average standard deviation of the gravity component of the time domain acceleration signal in the Z direction.   
 Min.   :-0.9910  
 1st Qu.:-0.9605  
 Median :-0.9450  
 Mean   :-0.9364  
 3rd Qu.:-0.9180  
 Max.   :-0.6102  
#### tBodyAccJerkMean_X
 Min.   :0.04269   
 1st Qu.:0.07396   
 Median :0.07640   
 Mean   :0.07947   
 3rd Qu.:0.08330   
 Max.   :0.13019   
#### tBodyAccJerkMean_Y  
 Min.   :-0.0386872  
 1st Qu.: 0.0004664  
 Median : 0.0094698  
 Mean   : 0.0075652  
 3rd Qu.: 0.0134008  
 Max.   : 0.0568186  
#### tBodyAccJerkMean_Z 
 Min.   :-0.067458  
 1st Qu.:-0.010601  
 Median :-0.003861  
 Mean   :-0.004953  
 3rd Qu.: 0.001958  
 Max.   : 0.038053  
#### tBodyAccJerkStdv_X
 Min.   :-0.9946   
 1st Qu.:-0.9832   
 Median :-0.8104   
 Mean   :-0.5949   
 3rd Qu.:-0.2233   
 Max.   : 0.5443   
#### tBodyAccJerkStdv_Y
 Min.   :-0.9895   
 1st Qu.:-0.9724   
 Median :-0.7756   
 Mean   :-0.5654   
 3rd Qu.:-0.1483   
 Max.   : 0.3553   
#### tBodyAccJerkStdv_Z
 Min.   :-0.99329  
 1st Qu.:-0.98266  
 Median :-0.88366  
 Mean   :-0.73596  
 3rd Qu.:-0.51212  
 Max.   : 0.03102  
#### tBodyGyroMean_X   
 Min.   :-0.20578  
 1st Qu.:-0.04712  
 Median :-0.02871  
 Mean   :-0.03244  
 3rd Qu.:-0.01676  
 Max.   : 0.19270  
#### tBodyGyroMean_Y   
 Min.   :-0.20421  
 1st Qu.:-0.08955  
 Median :-0.07318  
 Mean   :-0.07426  
 3rd Qu.:-0.06113  
 Max.   : 0.02747  
#### tBodyGyroMean_Z   
 Min.   :-0.07245  
 1st Qu.: 0.07475  
 Median : 0.08512  
 Mean   : 0.08744  
 3rd Qu.: 0.10177  
 Max.   : 0.17910  
#### tBodyGyroStdv_X  
 Min.   :-0.9943  
 1st Qu.:-0.9735  
 Median :-0.7890  
 Mean   :-0.6916  
 3rd Qu.:-0.4414  
 Max.   : 0.2677  
#### tBodyGyroStdv_Y  
 Min.   :-0.9942  
 1st Qu.:-0.9629  
 Median :-0.8017  
 Mean   :-0.6533  
 3rd Qu.:-0.4196  
 Max.   : 0.4765  
#### tBodyGyroStdv_Z  
 Min.   :-0.9855  
 1st Qu.:-0.9609  
 Median :-0.8010  
 Mean   :-0.6164  
 3rd Qu.:-0.3106  
 Max.   : 0.5649  
#### tBodyGyroJerkMean_X
 Min.   :-0.15721   
 1st Qu.:-0.10322   
 Median :-0.09868   
 Mean   :-0.09606   
 3rd Qu.:-0.09110   
 Max.   :-0.02209   
#### tBodyGyroJerkMean_Y
 Min.   :-0.07681   
 1st Qu.:-0.04552   
 Median :-0.04112   
 Mean   :-0.04269   
 3rd Qu.:-0.03842   
 Max.   :-0.01320   
#### tBodyGyroJerkMean_Z
 Min.   :-0.092500  
 1st Qu.:-0.061725  
 Median :-0.053430  
 Mean   :-0.054802  
 3rd Qu.:-0.048985  
 Max.   :-0.006941  
#### tBodyGyroJerkStdv_X
 Min.   :-0.9965    
 1st Qu.:-0.9800    
 Median :-0.8396    
 Mean   :-0.7036    
 3rd Qu.:-0.4629    
 Max.   : 0.1791    
#### tBodyGyroJerkStdv_Y
 Min.   :-0.9971    
 1st Qu.:-0.9832    
 Median :-0.8942    
 Mean   :-0.7636    
 3rd Qu.:-0.5861    
 Max.   : 0.2959    
#### tBodyGyroJerkStdv_Z
 Min.   :-0.9954    
 1st Qu.:-0.9848    
 Median :-0.8610    
 Mean   :-0.7096    
 3rd Qu.:-0.4741    
 Max.   : 0.1932    
#### tBodyAccMagMean  
 Min.   :-0.9865  
 1st Qu.:-0.9573  
 Median :-0.4829  
 Mean   :-0.4973  
 3rd Qu.:-0.0919  
 Max.   : 0.6446  
#### tBodyAccMagStdv  
 Min.   :-0.9865  
 1st Qu.:-0.9430  
 Median :-0.6074  
 Mean   :-0.5439  
 3rd Qu.:-0.2090  
 Max.   : 0.4284  
#### tGravityAccMagMean
 Min.   :-0.9865   
 1st Qu.:-0.9573   
 Median :-0.4829   
 Mean   :-0.4973   
 3rd Qu.:-0.0919   
 Max.   : 0.6446   
#### tGravityAccMagStdv
 Min.   :-0.9865   
 1st Qu.:-0.9430   
 Median :-0.6074   
 Mean   :-0.5439   
 3rd Qu.:-0.2090   
 Max.   : 0.4284   
#### tBodyAccJerkMagMean
 Min.   :-0.9928    
 1st Qu.:-0.9807    
 Median :-0.8168    
 Mean   :-0.6079    
 3rd Qu.:-0.2456    
 Max.   : 0.4345    
#### tBodyAccJerkMagStdv
 Min.   :-0.9946    
 1st Qu.:-0.9765    
 Median :-0.8014    
 Mean   :-0.5842    
 3rd Qu.:-0.2173    
 Max.   : 0.4506    
#### tBodyGyroMagMean 
 Min.   :-0.9807  
 1st Qu.:-0.9461  
 Median :-0.6551  
 Mean   :-0.5652  
 3rd Qu.:-0.2159  
 Max.   : 0.4180  
#### tBodyGyroMagStdv 
 Min.   :-0.9814  
 1st Qu.:-0.9476  
 Median :-0.7420  
 Mean   :-0.6304  
 3rd Qu.:-0.3602  
 Max.   : 0.3000  
#### tBodyGyroJerkMagMean
 Min.   :-0.99732    
 1st Qu.:-0.98515    
 Median :-0.86479    
 Mean   :-0.73637    
 3rd Qu.:-0.51186    
 Max.   : 0.08758    
#### tBodyGyroJerkMagStdv
 Min.   :-0.9977     
 1st Qu.:-0.9805     
 Median :-0.8809     
 Mean   :-0.7550     
 3rd Qu.:-0.5767     
 Max.   : 0.2502     
#### fBodyAccMean_X   
 Min.   :-0.9952  
 1st Qu.:-0.9787  
 Median :-0.7691  
 Mean   :-0.5758  
 3rd Qu.:-0.2174  
 Max.   : 0.5370  
#### fBodyAccMean_Y    
 Min.   :-0.98903  
 1st Qu.:-0.95361  
 Median :-0.59498  
 Mean   :-0.48873  
 3rd Qu.:-0.06341  
 Max.   : 0.52419  
#### fBodyAccMean_Z   
 Min.   :-0.9895  
 1st Qu.:-0.9619  
 Median :-0.7236  
 Mean   :-0.6297  
 3rd Qu.:-0.3183  
 Max.   : 0.2807  
#### fBodyAccStdv_X   
 Min.   :-0.9966  
 1st Qu.:-0.9820  
 Median :-0.7470  
 Mean   :-0.5522  
 3rd Qu.:-0.1966  
 Max.   : 0.6585  
#### fBodyAccStdv_Y    
 Min.   :-0.99068  
 1st Qu.:-0.94042  
 Median :-0.51338  
 Mean   :-0.48148  
 3rd Qu.:-0.07913  
 Max.   : 0.56019  
#### fBodyAccStdv_Z   
 Min.   :-0.9872  
 1st Qu.:-0.9459  
 Median :-0.6441  
 Mean   :-0.5824  
 3rd Qu.:-0.2655  
 Max.   : 0.6871  
#### fBodyAccJerkMean_X
 Min.   :-0.9946   
 1st Qu.:-0.9828   
 Median :-0.8126   
 Mean   :-0.6139   
 3rd Qu.:-0.2820   
 Max.   : 0.4743   
#### fBodyAccJerkMean_Y
 Min.   :-0.9894   
 1st Qu.:-0.9725   
 Median :-0.7817   
 Mean   :-0.5882   
 3rd Qu.:-0.1963   
 Max.   : 0.2767   
#### fBodyAccJerkMean_Z
 Min.   :-0.9920   
 1st Qu.:-0.9796   
 Median :-0.8707   
 Mean   :-0.7144   
 3rd Qu.:-0.4697   
 Max.   : 0.1578   
#### fBodyAccJerkStdv_X
 Min.   :-0.9951   
 1st Qu.:-0.9847   
 Median :-0.8254   
 Mean   :-0.6121   
 3rd Qu.:-0.2475   
 Max.   : 0.4768   
#### fBodyAccJerkStdv_Y
 Min.   :-0.9905   
 1st Qu.:-0.9737   
 Median :-0.7852   
 Mean   :-0.5707   
 3rd Qu.:-0.1685   
 Max.   : 0.3498   
#### fBodyAccJerkStdv_Z 
 Min.   :-0.993108  
 1st Qu.:-0.983747  
 Median :-0.895121  
 Mean   :-0.756489  
 3rd Qu.:-0.543787  
 Max.   :-0.006236  
#### fBodyGyroMean_X  
 Min.   :-0.9931  
 1st Qu.:-0.9697  
 Median :-0.7300  
 Mean   :-0.6367  
 3rd Qu.:-0.3387  
 Max.   : 0.4750  
#### fBodyGyroMean_Y  
 Min.   :-0.9940  
 1st Qu.:-0.9700  
 Median :-0.8141  
 Mean   :-0.6767  
 3rd Qu.:-0.4458  
 Max.   : 0.3288  
#### fBodyGyroMean_Z  
 Min.   :-0.9860  
 1st Qu.:-0.9624  
 Median :-0.7909  
 Mean   :-0.6044  
 3rd Qu.:-0.2635  
 Max.   : 0.4924  
#### fBodyGyroStdv_X  
 Min.   :-0.9947  
 1st Qu.:-0.9750  
 Median :-0.8086  
 Mean   :-0.7110  
 3rd Qu.:-0.4813  
 Max.   : 0.1966  
#### fBodyGyroStdv_Y  
 Min.   :-0.9944  
 1st Qu.:-0.9602  
 Median :-0.7964  
 Mean   :-0.6454  
 3rd Qu.:-0.4154  
 Max.   : 0.6462  
#### fBodyGyroStdv_Z  
 Min.   :-0.9867  
 1st Qu.:-0.9643  
 Median :-0.8224  
 Mean   :-0.6577  
 3rd Qu.:-0.3916  
 Max.   : 0.5225  
#### fBodyAccMagMean  
 Min.   :-0.9868  
 1st Qu.:-0.9560  
 Median :-0.6703  
 Mean   :-0.5365  
 3rd Qu.:-0.1622  
 Max.   : 0.5866  
#### fBodyAccMagStdv  
 Min.   :-0.9876  
 1st Qu.:-0.9452  
 Median :-0.6513  
 Mean   :-0.6210  
 3rd Qu.:-0.3654  
 Max.   : 0.1787  
#### fBodyAccJerkMagMean
 Min.   :-0.9940    
 1st Qu.:-0.9770    
 Median :-0.7940    
 Mean   :-0.5756    
 3rd Qu.:-0.1872    
 Max.   : 0.5384    
#### fBodyAccJerkMagStdv
 Min.   :-0.9944    
 1st Qu.:-0.9752    
 Median :-0.8126    
 Mean   :-0.5992    
 3rd Qu.:-0.2668    
 Max.   : 0.3163    
#### fBodyGyroMagMean 
 Min.   :-0.9865  
 1st Qu.:-0.9616  
 Median :-0.7657  
 Mean   :-0.6671  
 3rd Qu.:-0.4087  
 Max.   : 0.2040  
#### fBodyGyroMagStdv 
 Min.   :-0.9815  
 1st Qu.:-0.9488  
 Median :-0.7727  
 Mean   :-0.6723  
 3rd Qu.:-0.4277  
 Max.   : 0.2367  
#### fBodyGyroJerkMagMean
 Min.   :-0.9976     
 1st Qu.:-0.9813     
 Median :-0.8779     
 Mean   :-0.7564     
 3rd Qu.:-0.5831     
 Max.   : 0.1466     
#### fBodyGyroJerkMagStdv
 Min.   :-0.9976     
 1st Qu.:-0.9802     
 Median :-0.8941     
 Mean   :-0.7715     
 3rd Qu.:-0.6081     
 Max.   : 0.2878 
