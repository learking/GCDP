#Getting and Cleaning Data Project
1. Download [(click this link)](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the file (you will get a folder named "UCI HAR Dataset")
2. Put "UCI HAR Dataset" to your desired working directory
3. Move [run_analysis.R](https://github.com/learking/GCDP/blob/master/run_analysis.R) into "UCI HAR Dataset"
4. Fire up RStudio (or R)
5. Make sure "data.table" library has been installed (try command `library(data.table)`). If it has not been installed, please install it by using command `install.packages("data.table")`
6. Use `source("run_analysis.R")` to get merged dataset and tidy dataset required by this project. Two files, `cleanData_trainAndTestMerged.txt` and `tidyData_meanVar_bySubjectAndActivity.txt`, will be generated. `cleanData_trainAndTestMerged.txt`(**68 columns, 10299 rows**) stores the entire merged data, while `tidyData_meanVar_bySubjectAndActivity.txt` (**68 columns, 180 rows**) contains the tidy dataset required to upload.
7. To read the tidy data, use command `read.table("tidyData_meanVar_bySubjectAndActivity.txt")`
