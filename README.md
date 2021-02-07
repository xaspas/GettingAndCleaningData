---
title: "Getting and Cleaning Data Course Project"
author: "Xavier Aspas"
date: "07/02/2021"
output: html_document
---

## Presentation
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I will be graded by our peers on a series of yes/no questions related to the project. I will be required to submit:

1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

I should also include a README.md (this file) in the repo with my scripts. This repo explains how all of the scripts work and how they are connected.

I should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Original Data
**Human Activity Recognition Using Smartphones Dataset (Version 1.0)**  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
  
**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**The dataset includes the following files:** 

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.  

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.  
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.  
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

**License:**  
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



## The script (run_analysis.R)

The script requires dplyr library. The full script is in a function called run_analysis that creates the file: tidyData.csv and returns a data.frame with the data requested in step 5. Learn more in the structure of tidyData.csv in the attached CodeBook.

### 0. Downloading Data from URL into tempfile, unzip it and make sure data has been correctly recoverd

Before staring I have added a Step 0 to download data from the internet and load it into R.

```{r}
  #Downloading Data
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  tf <- tempfile(tmpdir = getwd(), fileext = ".zip")
  download.file(url,tf,mode="wb", quiet=TRUE)
  unzip(tf,exdir = getwd(), overwrite = TRUE)
  file.remove(tf)
  rm(tf) #HouseKeeping
  rm(url) #HouseKeeping
  
  if (file.exists("./UCI HAR Dataset")) {
    setwd("./UCI HAR Dataset") #Moving to data folder
  } else {
    stop("Error downloading or unzipping files")
  }
```
Loading and binding *subjects*, *activities* and *features* from files for Train and Test sets into train and set data.frame(s).
```{r}
  #Load Test data
  subjects <- read.table("test/subject_test.txt")
  activities <- read.table("test/y_test.txt")
  features <- read.table("test/x_test.txt")
  test <- cbind(subjects,activities,features)
  
  #Load Train data
  subjects <- read.table("train/subject_train.txt")
  activities <- read.table("train/y_train.txt")
  features <- read.table("train/x_train.txt")
  train <- cbind(subjects,activities,features)
  
  #HouseKeeping
  rm(subjects)
  rm(activities)
  rm(features)
```

### Step 1. Merge the training and the test sets to create one data set.
```{r}
  #Merge test & train datasets
  merged_data <- rbind(test,train)
  #Read features names
  featureNames <- read.table("features.txt")
  #Setting proper column names from features.txt file
  names(merged_data) <- c("SubjectId","Activity",featureNames$V2) 
  #HouseKeeping
  rm(featureNames)
  rm(test)
  rm(train)
```

### Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
```{r}
  #Subsetting to row identifiers and mean and std variables as
  subset_data <- merged_data[,grep(pattern="SubjectId|Activity|mean|std",names(merged_data), ignore.case = TRUE )]
  rm(merged_data) #HouseKeeping
```

### Step 3. Use descriptive activity names to name the activities in the data set
```{r}
  #Reading activity labels
  activity_labels <- read.csv("./activity_labels.txt",sep=" ", header=FALSE)[,2]
  #Converting activity column into factor with activity_labels
  subset_data$Activity <- factor(subset_data$Activity,labels = activity_labels)
  rm(activity_labels) #HouseKeeping
```

### Step 4. Appropriately label the data set with descriptive variable names
```{r}
  #Tidying up column names
  #Replace Acc with Acceleration
  names(subset_data) <- gsub("Acc", "Acceleration", names(subset_data))
  #Replace Mag with Magnitude
  names(subset_data) <- gsub("Mag", "Magnitude", names(subset_data))
  #Replace leading t with Time
  names(subset_data) <- gsub("^t", "Time", names(subset_data))
  #Replace leading f with Frequency
  names(subset_data) <- gsub("^f", "Frequency", names(subset_data))
  #Replace Gyro with Gyroscope
  names(subset_data) <- gsub("Gyro", "Gyroscope", names(subset_data))
  #Replace mean() with Mean
  names(subset_data) <- gsub("mean[(][)]", "Mean", names(subset_data))
  #Replace std() with Std
  names(subset_data) <- gsub("std[(][)]", "Std", names(subset_data))
```

### Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
```{r}
  #Extracting all variables with mean and std in their names
  selected_features <- names(subset_data)[grep(pattern="(?i)mean|std",names(subset_data))]
  #Piping with dplyr to group and summarize previous variables, finally adding a prefix to include the grouping operation made on the variable
  tidy_data <- subset_data %>% 
                group_by(SubjectId,Activity) %>% 
                summarise(across(all_of(selected_features), mean), .groups = 'drop') %>% 
                rename_at(vars(-SubjectId,-Activity),function(x) paste0("MeanOf-",x))
                
  rm(selected_features) #HouseKeeping
  
  #Writing Tidy Data to CSV file
  write.table(tidy_data,file="tidyData.csv",sep=",",row.names = FALSE,fileEncoding = "UTF-8")
  
  tidy_data
```


*Create with*
R version 4.0.3 (2020-10-10)
RStudio Version 1.3.1093
Windows 10 Professional