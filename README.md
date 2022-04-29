# Get and clean data project

In this repo you can find the script to generate a final and a tidy version of 
the database "UCI HAR" as well as a zip file containing the original raw data of
the database. This database presents data collected from the Samsung Galaxy S 
smartphone's accelerometer and gyroscope from 30 volunteers while performing 6 
different activities (Walking, Walking_upstairs, Walking_downstairs, Sitting, 
Standing, Laying). 

The original database separated the volunteers into 2 groups with data reported
independently: 

- Test group (30% of the volunteers)

- Training group (70%)

The script provided merges both groups into one data set alone (called "df_final"), 
identifying the different subjects under "Data_type" variable as "Test" or "Train".

In addition, the original data provided 561 different measurements from different 
parameters obtained with the smartphone. Here the amount of measurements is 
reduced to the mean and standard deviation ("std"") of each parameter (66 
measurements in total). For further details into the parameters interpretation 
read the CodeBook.md file.

Finally, the script also generates a summary data set (called "df_summarized"). 
In this data set each measurement is presented as an average value for each of 
the subjects in each of the activities.