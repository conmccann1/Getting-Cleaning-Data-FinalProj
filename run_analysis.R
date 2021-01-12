# load libraries
library(dplyr)


# First we load all the data files we need
# TEST DATA, ACTIVITY LABELS AND SUBJECT LABELS
test = read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)
testLabels = read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE) 
testSub = read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)

# TRAINING DATA, ACTIVITY LABELS AND SUBJECT LABELS
train = read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
trainLabels = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE) 
trainSub = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)

# FEATURE DATA and ACTIVITY DESCRIPTION DATA
feats = read.table('./UCI HAR Dataset/features.txt',header=FALSE)
actDesc = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)

# Combine the TEST and TRAINING data, as well as the ACTIVITY and SUBJECT label data. 
complete = rbind(test,train)
activityLabels = rbind(testLabels,trainLabels)
subjectLabels = rbind(testSub,trainSub)
names(complete) = feats$V2 # Rename complete columns using feats

# Extract only mean and standard deviation variable for each variable using regex
complete = complete[,grep('mean\\(\\)|std\\(\\)',names(complete))]

# Rename activityLabels using ACTIVITY DESCRIPTION DATA 
activityLabels = sapply(activityLabels,function(x){actDesc[x,2]})

# Add columns for activity and subject
complete = cbind(activityLabels,complete) # add activity column
names(complete)[1] = 'activity' # Name column appropriately
complete = cbind(subjectLabels,complete) # add subject column
names(complete)[1] = 'subject' # Name column appropriately
complete = arrange(complete,subject,activity) # order rows based on subject then activity

# Create new tidy data frame with the average of each variable for each activity and each subject.
averages = as.data.frame(complete %>% group_by(subject) %>% group_by(activity,.add = TRUE) %>% summarise_all(mean))
return(averages)



