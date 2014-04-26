#1. Merges the training and the test sets to create one data set.
mergeTrainTest <- function(trainDT, testDT){
    tmpTrain = read.table(trainDT)
    tmpTest = read.table(testDT)
    mergedDT = rbind(tmpTrain, tmpTest)
    return(mergedDT)
}

X_merged = mergeTrainTest("train/X_train.txt","test/X_test.txt")
subject_merged = mergeTrainTest("train/subject_train.txt","test/subject_test.txt")
y_merged = mergeTrainTest("train/y_train.txt","test/y_test.txt")

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
subset_meanAndStd <- function(inputDT){
    featureDT = read.table("features.txt")
    features2keep_indices = grep("mean\\(|std\\(", featureDT[, 2])
    features2keep_names = gsub("\\(|\\)", "", featureDT[features2keep_indices,2])
    resultDT = inputDT[,features2keep_indices]
    names(resultDT) = features2keep_names
    return(resultDT)
}

X_merged_meanAndStdSubset = subset_meanAndStd(X_merged)

#3. Uses descriptive activity names to name the activities in the data set
activitiesDT = read.table("activity_labels.txt")
y_merged[,1] = activitiesDT[y_merged[,1], 2]
names(y_merged) = "activity"

#4. Appropriately labels the data set with descriptive activity names.
names(subject_merged) = "subject"
cleanData_trainAndTestMerged = cbind(subject_merged, y_merged, X_merged_meanAndStdSubset)
write.table(cleanData_trainAndTestMerged, "cleanData_trainAndTestMerged.txt")

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
cleanData = data.table(cleanData_trainAndTestMerged)
tidyData = cleanData[,lapply(.SD,mean),by=list(subject, activity)]

write.table(tidyData, "tidyData_meanVar_bySubjectAndActivity.txt")
