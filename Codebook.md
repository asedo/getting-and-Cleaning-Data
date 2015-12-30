## Cookbook

Course Project CodeBook 
Getting and Cleaning Data 
==============================================================


There original data comes from the Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

This dataset takes accelerometer and gyroscope 3-axial raw signals, 
which have been processed using various signal processing techniques to measurement vector consisting
of 561 features. For a more detailed description, please see the readme.txt file that comes with the data. 

The data can be downloaded at: 

 (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)



## Conventions followed
I tried to follow the tidy data set convention in Hadley Wickham's paper. 
Can be found here. 

(https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)

## Data sets

### Raw data set 
As described in the date set's Readme file...

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The training and test subsets of the original dataset were combined to produce final raw dataset.

### Tidy data set

Tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. 
Original variable names were modified in the follonwing way:

1. Parantheses were removed from names
2. The f was changed to frequency, and the t was changed to time
3. The Acc was changed to Acceleration 
4. Mag in label was updated to  Magnitude
5. BodyBody in label, seemed to be inconsistent with other formatting so I changed it to  Body
6. Changed Freq in label to Frequency
 

