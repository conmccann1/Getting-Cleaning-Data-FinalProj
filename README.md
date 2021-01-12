==================================================================
Getting and Cleaning Data Final Project
Version 1.0
==================================================================
This analysis uses datasets which can be found in './UCI HAR Dataset/'. Please see associated README.txt in that folder 
to find out more.

The steps of this analysis, found in 'run_analysis.R', are as follows:
1) Load in required files from ./UCI HAR Dataset/ using read.table(). Files are described in CODEBOOK below.
2) Combine the test and training datasets and the activity labels and subject labels using rbind(). 
3) rename the columns of the complete dataset using features.txt so that they are more usefully labelled.
4) use grep() to subset the columns of the complete dataset so all that reamains are the mean and standard deviation 
   variable for each variable
5) Add two columns to the complete dataset: Subject and Activity
6) create a new dataset called 'averages' which includes the average of each variable for each activity and each subject
   from complete, using the dplyr package
7) return this new tidy dataset

==================================================================
CODEBOOK
==================================================================
Here are descriptions of every variable found in run_analysis.R:
	- 'test': a dataframe created from the test dataset found in './UCI HAR Dataset/test/X_test.txt'
	- 'testLabels': dataframe describing the activity performed (1-6) in each row of 'test'. Found in './UCI HAR Dataset/test/y_test.txt'
	- 'testSub': dataframe describing the subject for each row of 'test'. Found in './UCI HAR Dataset/test/subject_test.txt'.
	- 'train': a dataframe created from the train dataset found in './UCI HAR Dataset/train/X_train.txt'
	- 'trainLabels': dataframe describing the activity performed (1-6) in each row of 'train'. Found in './UCI HAR Dataset/train/y_train.txt'
	- 'trainSub': dataframe describing the subject for each row of 'train'. Found in './UCI HAR Dataset/train/subject_train.txt'.
	- 'feats': descriptive names for the variables found in 'test' and 'train'. './UCI HAR Dataset/features.txt'
	- 'actDesc': dataframe linking test/trainLabels codes to actual activity. './UCI HAR Dataset/activity_labels.txt'
	- 'complete': dataframe of merged 'test' and 'train'
	- 'activityLabels': combined 'testLabels' and 'trainLabels', later renamed using 'actDesc' and added to 'complete'
	- 'averages': dataframe with the average of each variable in complete for each activity and each subject.





