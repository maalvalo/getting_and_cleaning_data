# Study Design

Two datasets are availabe, training and test, each in a directory of its own. In each directory, there are three relevant files

* X_&lt;dataset&gt;.txt
* y_&lt;dataset&gt;.txt
* subject_&lt;dataset&gt;.txt

where &lt;dataset&gt; is either training or test, and matches the name of the directory. We take advantage of this structure to read the two datasets in a loop.

In the main folder,

* "features.txt" provides descriptive names for the variables read in X_&lt;dataset&gt;.txt
* "activity_labels.txt" is a table that associates the numeric value (id) of each activity with its corresponding description.

The first is used to properly label the variables in the dataset, whereas the second serves to convert the *numerical* "activity" variable into a more descriptive *factor* variable.

The raw data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


# Code book

A list of the variables present in the dataset, along with their type is presented next

| Column number | Variable Name             | Type    | Description                                           |
| ------------- |:-------------------------:| -------:|:-----------------------------------------------------:|
|  1            | subject                   | numeric | the id of the subject performing the activity         |
|  2            | activity                  | factor  | the activity the subject is performing                |
|  3            | tBodyAcc-mean-X           | numeric | explained below                                       |
|  4            | tBodyAcc-mean-Y           | numeric | explained below                                       |
|  5            | tBodyAcc-mean-Z           | numeric | explained below                                       |
|  6            | tBodyAcc-std-X            | numeric | explained below                                       |
|  7            | tBodyAcc-std-Y            | numeric | explained below                                       |
|  8            | tBodyAcc-std-Z            | numeric | explained below                                       |
|  9            | tGravityAcc-mean-X        | numeric | explained below                                       |
|  10           | tGravityAcc-mean-Y        | numeric | explained below                                       |
|  11           | tGravityAcc-mean-Z        | numeric | explained below                                       |
|  12           | tGravityAcc-std-X         | numeric | explained below                                       |
|  13           | tGravityAcc-std-Y         | numeric | explained below                                       |
|  14           | tGravityAcc-std-Z         | numeric | explained below                                       |
|  15           | tBodyAccJerk-mean-X       | numeric | explained below                                       |
|  16           | tBodyAccJerk-mean-Y       | numeric | explained below                                       |
|  17           | tBodyAccJerk-mean-Z       | numeric | explained below                                       |
|  18           | tBodyAccJerk-std-X        | numeric | explained below                                       |
|  19           | tBodyAccJerk-std-Y        | numeric | explained below                                       |
|  20           | tBodyAccJerk-std-Z        | numeric | explained below                                       |
|  21           | tBodyGyro-mean-X          | numeric | explained below                                       |
|  22           | tBodyGyro-mean-Y          | numeric | explained below                                       |
|  23           | tBodyGyro-mean-Z          | numeric | explained below                                       |
|  24           | tBodyGyro-std-X           | numeric | explained below                                       |
|  25           | tBodyGyro-std-Y           | numeric | explained below                                       |
|  26           | tBodyGyro-std-Z           | numeric | explained below                                       |
|  27           | tBodyGyroJerk-mean-X      | numeric | explained below                                       |
|  28           | tBodyGyroJerk-mean-Y      | numeric | explained below                                       |
|  29           | tBodyGyroJerk-mean-Z      | numeric | explained below                                       |
|  30           | tBodyGyroJerk-std-X       | numeric | explained below                                       |
|  31           | tBodyGyroJerk-std-Y       | numeric | explained below                                       |
|  32           | tBodyGyroJerk-std-Z       | numeric | explained below                                       |
|  33           | tBodyAccMag-mean          | numeric | explained below                                       |
|  34           | tBodyAccMag-std           | numeric | explained below                                       |
|  35           | tGravityAccMag-mean       | numeric | explained below                                       |
|  36           | tGravityAccMag-std        | numeric | explained below                                       |
|  37           | tBodyAccJerkMag-mean      | numeric | explained below                                       |
|  38           | tBodyAccJerkMag-std       | numeric | explained below                                       |
|  39           | tBodyGyroMag-mean         | numeric | explained below                                       |
|  40           | tBodyGyroMag-std          | numeric | explained below                                       |
|  41           | tBodyGyroJerkMag-mean     | numeric | explained below                                       |
|  42           | tBodyGyroJerkMag-std      | numeric | explained below                                       |
|  43           | fBodyAcc-mean-X           | numeric | explained below                                       |
|  44           | fBodyAcc-mean-Y           | numeric | explained below                                       |
|  45           | fBodyAcc-mean-Z           | numeric | explained below                                       |
|  46           | fBodyAcc-std-X            | numeric | explained below                                       |
|  47           | fBodyAcc-std-Y            | numeric | explained below                                       |
|  48           | fBodyAcc-std-Z            | numeric | explained below                                       |
|  49           | fBodyAccJerk-mean-X       | numeric | explained below                                       |
|  50           | fBodyAccJerk-mean-Y       | numeric | explained below                                       |
|  51           | fBodyAccJerk-mean-Z       | numeric | explained below                                       |
|  52           | fBodyAccJerk-std-X        | numeric | explained below                                       |
|  53           | fBodyAccJerk-std-Y        | numeric | explained below                                       |
|  54           | fBodyAccJerk-std-Z        | numeric | explained below                                       |
|  55           | fBodyGyro-mean-X          | numeric | explained below                                       |
|  56           | fBodyGyro-mean-Y          | numeric | explained below                                       |
|  57           | fBodyGyro-mean-Z          | numeric | explained below                                       |
|  58           | fBodyGyro-std-X           | numeric | explained below                                       |
|  59           | fBodyGyro-std-Y           | numeric | explained below                                       |
|  60           | fBodyGyro-std-Z           | numeric | explained below                                       |
|  61           | fBodyAccMag-mean          | numeric | explained below                                       |
|  62           | fBodyAccMag-std           | numeric | explained below                                       |
|  63           | fBodyBodyAccJerkMag-mean  | numeric | explained below                                       |
|  64           | fBodyBodyAccJerkMag-std   | numeric | explained below                                       |
|  65           | fBodyBodyGyroMag-mean     | numeric | explained below                                       |
|  66           | fBodyBodyGyroMag-std      | numeric | explained below                                       |
|  67           | fBodyBodyGyroJerkMag-mean | numeric | explained below                                       |
|  68           | fBodyBodyGyroJerkMag-std  | numeric | explained below                                       |

An excerpt from the documentation included in the dataset provides a thorough description of the variables. It is reproduced here.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>tBodyAcc-XYZ

>tGravityAcc-XYZ

>tBodyAccJerk-XYZ

>tBodyGyro-XYZ

>tBodyGyroJerk-XYZ

>tBodyAccMag

>tGravityAccMag

>tBodyAccJerkMag

>tBodyGyroMag

>tBodyGyroJerkMag

>fBodyAcc-XYZ

>fBodyAccJerk-XYZ

>fBodyGyro-XYZ

>fBodyAccMag

>fBodyAccJerkMag

>fBodyGyroMag

>fBodyGyroJerkMag

>
>The set of variables that were estimated from these signals are: 
>
>mean(): Mean value

>std(): Standard deviation

>mad(): Median absolute deviation 

>max(): Largest value in array

>min(): Smallest value in array

>sma(): Signal magnitude area

>energy(): Energy measure. Sum of the squares divided by the number of values. 

>iqr(): Interquartile range 

>entropy(): Signal entropy

>arCoeff(): Autorregresion coefficients with Burg order equal to 4

>correlation(): correlation coefficient between two signals

>maxInds(): index of the frequency component with largest magnitude

>meanFreq(): Weighted average of the frequency components to obtain a mean frequency

>skewness(): skewness of the frequency domain signal 

>kurtosis(): kurtosis of the frequency domain signal 

>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

>angle(): Angle between to vectors.
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
>gravityMean

>tBodyAccMean

>tBodyAccJerkMean

>tBodyGyroMean

>tBodyGyroJerkMean