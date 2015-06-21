# GettingandCleaningData
Course Project for Getting and Cleaning Data class

#Original Dataset description
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Final Dataset Description

This dataset was modified to aggregate the results by subject and activity by mean.  The dataset was also shortened to only include observations that were a mean or standard deviation.  Variable descriptions are available in the codebook.  All feature names from the original dataset were preserved.  The observations were not modified outside of being aggregated by mean.

#Running the analysis

Please place the UCI HAR Dataset in the working director, leaving the folder structure unchanged.

The script will: 
  - append the subject and activity information on the the train and test data sets
  - combine the train and test data sets
  - add descriptive names for the features as provided by the original data
  - add descriptive names for the activities
  - create a tidy data set with the average of the mean and standard deviation observations for each subject and activity
  
The script will produce a csv called CourseProject.csv containing the final tidy data set and will save it in the working directory.
