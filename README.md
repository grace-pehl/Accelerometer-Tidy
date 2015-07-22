# Data Wrangling and Cleaning Exercise
# Grace Pehl, PhD.

*Data taken from Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*

Script run_analysis.R will download the zipped datafile, unzip it into the local directory unless the .zip file and UCI HAR Dataset directory are already present in the working directory. The script will read and merge the data and labeling files into a single dataframe.  The script will select the mean and standard deviation for each variable measured by Anguita, et al.  The averages of each variable for each subject and measured activity will be output as a text file "SamsungData_tidy.txt" 