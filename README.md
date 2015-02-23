#Final Course Project for Getting and Cleaning Data

##About
This data set is a tidy version of the UCI Human Activity Recognition Using Smartphones data set. It summarizes the mean and standard deviation measurements from that data set, grouping them by subject and activity.

##File List

* README.md (this file!)
* CodeBook.pdf - Information about the columns
* run_analysis.R - The R script to clean the data
* columnselectors.txt - An accompanying text file that contains information for the R script about which columns to use and how to rename them.

##Instructions

1. Download the run_analysis.R file and the columnselectors.txt file and be sure they're in the same directory.
2. Place the "getdata-projectfiles-UCI HAR Dataset.zip" data file available here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in that same directory
3. Unzip the getdata zip file. It should create a directory called "UCI HAR Dataset"
4. Be sure you have the dplyr R package installed
4. Source the run_analysis.R file. When it is finished, you should have a tidy data frame called finalData that contains mean values for means and standard deviations for each test subject for each activity.

##Acknowledgements

The data in this set is derived from the UCI Human Activity Recognition Using Smartphones data set which appears in the following paper:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

See their website for additional information about the methods used in the study: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones