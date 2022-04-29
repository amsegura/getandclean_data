## Getting and Cleaning Data Course Project

## Loading required libraries
library(dplyr)
library(tibble)

## Download database:
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./project_dataset.zip", method='curl')

## Variable names:
measures <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/features.txt'), header = FALSE)
measures_vec <- measures[['V2']]
columns <- c('Subject_ID', 'Activity_ID', measures_vec)

## Reading the txt files:

## Test Subjects ids
test_subject <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/test/subject_test.txt'), header = FALSE)
## Test Activity
test_y <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/test/y_test.txt'), header = FALSE)
## Test Measures
test_x <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/test/X_test.txt'), header = FALSE)
## Bind 3 datasets for test:
df_test <- as_tibble(bind_cols(test_subject, test_y, test_x))
## Re-naming the columns with descriptive variable names:
names(df_test) <- columns
## Adding a column for Test or train ID:
Data_type <- rep("Test", 2947)
df_test<- df_test %>% add_column(Data_type, .before = 'Subject_ID')

## Same steps for the Train dataset
train_subject <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/train/subject_train.txt'), header = FALSE)
train_y <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/train/y_train.txt'), header = FALSE)
train_x <- read.table(unz("project_dataset.zip", 'UCI HAR Dataset/train/X_train.txt'), header = FALSE)
df_train <- as_tibble(bind_cols(train_subject, train_y, train_x))
names(df_train) <- columns
Data_type <- rep("Train", 7352)
df_train <- df_train %>% add_column(Data_type, .before = 'Subject_ID')

## Combining both dataframes:
df_final <- bind_rows(df_test, df_train)

## Selecting mean and std columns:
df_final <- df_final %>% select(contains('type') | contains('ID') | contains('mean()')|contains('std()'))

## Renaming activities:
df_final <- df_final %>% mutate(Activity_ID = replace(Activity_ID, Activity_ID == 1, 'Walking')) %>%
        mutate(Activity_ID = replace(Activity_ID, Activity_ID == 2, 'Walking_upstairs')) %>%
        mutate(Activity_ID = replace(Activity_ID, Activity_ID == 3, 'Walking_downstairs')) %>%
        mutate(Activity_ID = replace(Activity_ID, Activity_ID == 4, 'Sitting')) %>%
        mutate(Activity_ID = replace(Activity_ID, Activity_ID == 5, 'Standing')) %>%
        mutate(Activity_ID = replace(Activity_ID, Activity_ID == 6, 'Laying')) 

## Creating a summary dataframe:
df_summarized <- df_act_rename %>% group_by(Data_type, Subject_ID, Activity_ID) %>% summarise_all(mean)

