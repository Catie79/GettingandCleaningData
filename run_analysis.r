
#Read in files for train data

X_train <- read.table("train/X_train.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")

#Add activity and subject columns to the train data

train_acivities <- y_train$V1
train_subjects <- subject_train$V1
X_train$Subjects <- train_subjects
X_train$Activities <- train_acivities

#Read in files for test data

X_test <- read.table("test/X_test.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

#Add activity and subject columns to the test data

test_acivities <- y_test$V1
test_subjects <- subject_test$V1
X_test$Subjects <- test_subjects
X_test$Activities <- test_acivities

#Combine the train and test data

total <- rbind(X_train, X_test)

#Read in variable labels 

features <- read.table("features.txt", quote="\"")

#Add descriptive variable labels

feature_label <- features$V2
colnames(total) <- feature_label
colnames(total)[562] <- "Subject"
colnames(total)[563] <- "Activity"

#Identify variables to keep (mean and standard deviation)

keepers <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543,555,556,557,558,559,560,561,562,563)

#Subset data to keep just the variables desired

results <- total[,keepers]

#Relabel activities with descriptive names

temp <- results$Activity
i <- 1
stuff <- 0
while (i<10300){
  if (temp[i] == 1) {stuff[i]<- "Walking"}
  if (temp[i]== 2) {stuff[i] <- "Walking_Upstairs"}
  if (temp[i] == 3) {stuff[i] <- "Walking_Downstairs"}
  if (temp[i] == 4) {stuff[i]<- "Sitting"}
  if (temp[i] == 5) {stuff[i] <- "Standing"}
  if (temp[i] == 6) {stuff[i] <- "Laying"}
  i <- i+1
}
results$Activity <- stuff

##Aggregate by average into a tidy data set with observations for each subject and activity


tidy <- aggregate(results[,1] ~ Subject+Activity,results,mean)
names <- c("Subject", "Activity", insanity[1])
colnames(tidy) <- names
i <- 2
t <- 4
while (i<74) {
  temp <- aggregate(results[,i] ~ Subject+Activity,results,mean)
  tidy[,t] <- temp[,3]
  i <- i+1
  t <- t+1
}

#Update column names

insanity <- colnames(results)
billybob <- colnames(tidy)

billybob[1] <- "Subject"
billybob[2] <- "Activity"
i <- 3
t <- 1
while (i<76) {
billybob[i] <- insanity[t]
i <- i+1
t <- t+1
}

colnames(tidy) <- billybob

#Export to csv

write.table(tidy, file = "CourseProject.txt",row.names=FALSE)
