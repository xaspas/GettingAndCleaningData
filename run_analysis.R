library(dplyr)

runAnalysis <- function(){
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
  
  
  ####### Assignment Step 1 #######
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
  
  ####### Assignment Step 2  #######
  #Subsetting to row identifiers and mean and std variables as
  subset_data <- merged_data[,grep(pattern="SubjectId|Activity|mean|std",names(merged_data), ignore.case = TRUE )]
  rm(merged_data) #HouseKeeping

  
  ####### Assignment Step 3 ####### 
  #Reading activity labels
  activity_labels <- read.csv("./activity_labels.txt",sep=" ", header=FALSE)[,2]
  #Converting activity column into factor with activity_labels
  subset_data$Activity <- factor(subset_data$Activity,labels = activity_labels)
  rm(activity_labels) #HouseKeeping
  
  
  
  ####### Assignment Step 4 ####### 
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
  
  
  #Assignment Step 5
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
  
}


