# CodeBook for the get and clean data project

This CodeBook will help interpretate the different variables that appear in the
datasets generated with the script enclosed in this repo using as raw data the 
database "UCI HAR".

## Data sets structure
The data sets generated are composed of: 
- 3 initial columns that describe the type of data collected:
        1. "Data_type": Reflects if the data belongs to the "Test" or "Train"
        group.
        
        2. "Subject_ID": Identification of the subjects reflected by numbers.
        
        3. "Activity_ID": Activity fo which the parameters are collected. There
        are six possible activities, Walking, Walking_upstairs, Walking_downstairs, 
        Sitting, Standing and Laying.
        
- 66 columns corresponding to the parameters collected and the measurements performed
on those parameters.

        1. Parameters: The parameters/signals collected are the 3-axial raw signals (each
        parameter has a "X", "Y" and "Z" signal) from the accelerometer ("Acc") 
        and the gyroscope ("Gyro") of the smartphone. These are time domain signals 
        (the prefix "t" stands for time). The acceleration signal was separated 
        into "Body" and "Gravity" signals while there are only "Body" signals 
        for the gyroscope. Examples (the <measure> part is explained below): 
        "tBodyGyro-<measure>-X", "tGravityAcc-<measure>-Y"...
        
        The body linear acceleration and angular velocity were derived in time 
        to obtain Jerk signals (examples: "tBodyAccJerk-<measure>-X", 
        "tBodyGyroJerk-<measure>-Z). In addition, the magnitude of these 3-axial
        signals calculated using the Euclidean norm is presented (only one value
        in this case not "X", "Y" and "Z" signal): "tBodyAccMag", 
        "tGravityAccMag", "tBodyAccJerkMag", "tBodyGyroMag", "tBodyGyroJerkMag".
        
        Finally a Fast Fourier Transform (FFT) for some of these signals was 
        calculated, producing "fBodyAcc-XYZ", "fBodyAccJerk-XYZ", "fBodyGyro-XYZ", 
        "fBodyAccJerkMag", "fBodyGyroMag", "fBodyGyroJerkMag" (the 'f' indicates 
        frequency domain signals). 
        
        The final list of parameters collected (remember that each parameter has
        a "X", "Y" and "Z" signal except for the "Mag" parameters):
        
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
        
        2. Measurements: Different measurements were presented in the original
        database. However both the "final" and "summarized" dataset present only
        the average (as "mean()") and standard deviation (as "std()") for each 
        of the parameters. Examples: "tBodyAcc-mean()-Y", "tBodyAccJerk-std()-Z", 
        "fBodyBodyGyroMag-mean()", etc.

Raw data, including all the measurements for all the parameters and a .txt file 
naming all the individual variables can be found in the zip file in this repo.
        
        
        
        