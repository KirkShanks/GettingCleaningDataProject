
# Set the working directory
setwd("C:\\Users\\Kirk\\Documents\\Coursera\\Course 3 - Getting and Cleaning Data\\Project")


# Read in the data
subTest <- read.table("subject_test.txt")
subTrain <- read.table("subject_train.txt")
x_test <- read.table("X_test.txt")
x_train <- read.table("X_train.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

# Combine the data with the subject and y labels
test <- cbind(subTest, y_test, x_test)
train <- cbind(subTrain, y_train, x_train)

# Combine "test" and "train"
df <- rbind(test,train)

# Create the column names
colNames <- c("subject","activity", as.character(features$V2))

colnames(df) <- colNames

# Get the rows for the standard deviation and mean
stdmean <- sort(c(1,2, grep("-mean\\(\\)|-std\\(\\)", colNames)))

# Subset the data
df <- df[,stdmean]

# Add factor labels
df$activity <- factor(df$activity
        ,levels = c(1,2,3,4,5,6)
        ,labels = activity$V2)

# Create a tidy data set
TidyDataSet <- aggregate(df, by = list(df$subject,df$activity), FUN = mean)
colNames <- colnames(TidyDataSet[,c(-1,-2)])
TidyDataSet <- TidyDataSet[,c(-3,-4)]
colnames(TidyDataSet) <- colNames

# Write the tidy data set to a txt file
write.table(TidyDataSet,"TidyDataSet.txt", sep = "\t")
