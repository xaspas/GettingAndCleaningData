---
title: "Getting and Cleaning Data Course Project CodeBook"
author: "Xavier Aspas"
date: "07/02/2021"
output: html_document
---

## Description

This CodeBook is intended to offer a description of the contents in tidyData.csv file create with the script run_analysis.R as a part of the final Assigment of the Getting and Cleaning Data Course.

The Data set contain the following variables 

[1] "SubjectId": Subject identifier range 1 to 30                                   
[2] "Activity": Activity factor values (1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING)

From here all variables are, as requested the Mean of values for all groups of SubjectId and Activity.


[3] "MeanOf-TimeBodyAcceleration-mean-X"                        
[4] "MeanOf-TimeBodyAcceleration-mean-Y"                        
[5] "MeanOf-TimeBodyAcceleration-mean-Z"                        
[6] "MeanOf-TimeBodyAcceleration-std-X"                         
[7] "MeanOf-TimeBodyAcceleration-std-Y"                         
[8] "MeanOf-TimeBodyAcceleration-std-Z"                         
[9] "MeanOf-TimeGravityAcceleration-mean-X"                     
[10] "MeanOf-TimeGravityAcceleration-mean-Y"                     
[11] "MeanOf-TimeGravityAcceleration-mean-Z"                     
[12] "MeanOf-TimeGravityAcceleration-std-X"                      
[13] "MeanOf-TimeGravityAcceleration-std-Y"                      
[14] "MeanOf-TimeGravityAcceleration-std-Z"                      
[15] "MeanOf-TimeBodyAccelerationJerk-mean-X"                    
[16] "MeanOf-TimeBodyAccelerationJerk-mean-Y"                    
[17] "MeanOf-TimeBodyAccelerationJerk-mean-Z"                    
[18] "MeanOf-TimeBodyAccelerationJerk-std-X"                     
[19] "MeanOf-TimeBodyAccelerationJerk-std-Y"                     
[20] "MeanOf-TimeBodyAccelerationJerk-std-Z"                     
[21] "MeanOf-TimeBodyGyroscope-mean-X"                           
[22] "MeanOf-TimeBodyGyroscope-mean-Y"                           
[23] "MeanOf-TimeBodyGyroscope-mean-Z"                           
[24] "MeanOf-TimeBodyGyroscope-std-X"                            
[25] "MeanOf-TimeBodyGyroscope-std-Y"                            
[26] "MeanOf-TimeBodyGyroscope-std-Z"                            
[27] "MeanOf-TimeBodyGyroscopeJerk-mean-X"                       
[28] "MeanOf-TimeBodyGyroscopeJerk-mean-Y"                       
[29] "MeanOf-TimeBodyGyroscopeJerk-mean-Z"                       
[30] "MeanOf-TimeBodyGyroscopeJerk-std-X"                        
[31] "MeanOf-TimeBodyGyroscopeJerk-std-Y"                        
[32] "MeanOf-TimeBodyGyroscopeJerk-std-Z"                        
[33] "MeanOf-TimeBodyAccelerationMagnitude-mean"                 
[34] "MeanOf-TimeBodyAccelerationMagnitude-std"                  
[35] "MeanOf-TimeGravityAccelerationMagnitude-mean"              
[36] "MeanOf-TimeGravityAccelerationMagnitude-std"               
[37] "MeanOf-TimeBodyAccelerationJerkMagnitude-mean"             
[38] "MeanOf-TimeBodyAccelerationJerkMagnitude-std"              
[39] "MeanOf-TimeBodyGyroscopeMagnitude-mean"                    
[40] "MeanOf-TimeBodyGyroscopeMagnitude-std"                     
[41] "MeanOf-TimeBodyGyroscopeJerkMagnitude-mean"                
[42] "MeanOf-TimeBodyGyroscopeJerkMagnitude-std"                 
[43] "MeanOf-FrequencyBodyAcceleration-mean-X"                   
[44] "MeanOf-FrequencyBodyAcceleration-mean-Y"                   
[45] "MeanOf-FrequencyBodyAcceleration-mean-Z"                   
[46] "MeanOf-FrequencyBodyAcceleration-std-X"                    
[47] "MeanOf-FrequencyBodyAcceleration-std-Y"                    
[48] "MeanOf-FrequencyBodyAcceleration-std-Z"                    
[49] "MeanOf-FrequencyBodyAcceleration-meanFreq-X"               
[50] "MeanOf-FrequencyBodyAcceleration-meanFreq-Y"               
[51] "MeanOf-FrequencyBodyAcceleration-meanFreq-Z"               
[52] "MeanOf-FrequencyBodyAccelerationJerk-mean-X"               
[53] "MeanOf-FrequencyBodyAccelerationJerk-mean-Y"               
[54] "MeanOf-FrequencyBodyAccelerationJerk-mean-Z"               
[55] "MeanOf-FrequencyBodyAccelerationJerk-std-X"                
[56] "MeanOf-FrequencyBodyAccelerationJerk-std-Y"                
[57] "MeanOf-FrequencyBodyAccelerationJerk-std-Z"                
[58] "MeanOf-FrequencyBodyAccelerationJerk-meanFreq-X"           
[59] "MeanOf-FrequencyBodyAccelerationJerk-meanFreq-Y"           
[60] "MeanOf-FrequencyBodyAccelerationJerk-meanFreq-Z"           
[61] "MeanOf-FrequencyBodyGyroscope-mean-X"                      
[62] "MeanOf-FrequencyBodyGyroscope-mean-Y"                      
[63] "MeanOf-FrequencyBodyGyroscope-mean-Z"                      
[64] "MeanOf-FrequencyBodyGyroscope-std-X"                       
[65] "MeanOf-FrequencyBodyGyroscope-std-Y"                       
[66] "MeanOf-FrequencyBodyGyroscope-std-Z"                       
[67] "MeanOf-FrequencyBodyGyroscope-meanFreq-X"                  
[68] "MeanOf-FrequencyBodyGyroscope-meanFreq-Y"                  
[69] "MeanOf-FrequencyBodyGyroscope-meanFreq-Z"                  
[70] "MeanOf-FrequencyBodyAccelerationMagnitude-mean"            
[71] "MeanOf-FrequencyBodyAccelerationMagnitude-std"             
[72] "MeanOf-FrequencyBodyAccelerationMagnitude-meanFreq"        
[73] "MeanOf-FrequencyBodyBodyAccelerationJerkMagnitude-mean"    
[74] "MeanOf-FrequencyBodyBodyAccelerationJerkMagnitude-std"     
[75] "MeanOf-FrequencyBodyBodyAccelerationJerkMagnitude-meanFreq"  
[76] "MeanOf-FrequencyBodyBodyGyroscopeMagnitude-mean"           
[77] "MeanOf-FrequencyBodyBodyGyroscopeMagnitude-std"            
[78] "MeanOf-FrequencyBodyBodyGyroscopeMagnitude-meanFreq"       
[79] "MeanOf-FrequencyBodyBodyGyroscopeJerkMagnitude-mean"       
[80] "MeanOf-FrequencyBodyBodyGyroscopeJerkMagnitude-std"        
[81] "MeanOf-FrequencyBodyBodyGyroscopeJerkMagnitude-meanFreq"   
[82] "MeanOf-angle(tBodyAccelerationMean,gravity)"               
[83] "MeanOf-angle(tBodyAccelerationJerkMean),gravityMean)"      
[84] "MeanOf-angle(tBodyGyroscopeMean,gravityMean)"              
[85] "MeanOf-angle(tBodyGyroscopeJerkMean,gravityMean)"          
[86] "MeanOf-angle(X,gravityMean)"                               
[87] "MeanOf-angle(Y,gravityMean)"                               
[88] "MeanOf-angle(Z,gravityMean)"  


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables that were selected from these signals are: 
mean(): Mean value
std(): Standard deviation

All features were normalized and bounded within [-1,1].
