library(dplyr)

# the path to the file containing the names of the features
filePath <- file.path('UCI HAR Dataset','features.txt')

# the names of the features are read as matrix
features.names <- as.matrix(read.table(filePath))

# the path to the file containing the names of the activities
filePath <- file.path('UCI HAR Dataset','activity_labels.txt')

# the names of the activities read as factors
activities.names <- read.table(filePath)
# activities.names <- read.table(filePath,colClasses=c('numeric','factor'))

# lists that will contain, respectively, the subject, X and y files for the two datasets
subject <- vector('list',length=2)
X <- vector('list',length=2)
y <- vector('list',length=2)

# the datasets we need to process
datasets <- c('train','test')

# for every dataset we need to process...
for (iDataSet in seq_along(datasets)) {

	# the path to the "subject_*.txt" file in the corresponding dataset directory
	filePath <- file.path('UCI HAR Dataset',datasets[iDataSet],paste('subject_',datasets[iDataSet],'.txt',sep=''))
	
	subject[[iDataSet]] <- as.matrix(read.table(filePath))
	
	# the path to the "X_*.txt" file in the corresponding dataset directory
	filePath <- file.path('UCI HAR Dataset',datasets[iDataSet],paste('X_',datasets[iDataSet],'.txt',sep=''))
	
	X[[iDataSet]] <- as.matrix(read.table(filePath))
	
	# the path to the "Y_*.txt" file in the corresponding dataset directory
	filePath <- file.path('UCI HAR Dataset',datasets[iDataSet],paste('y_',datasets[iDataSet],'.txt',sep=''))
	
	y[[iDataSet]] <- as.matrix(read.table(filePath,colClasses='factor'))

} # for (iDataSet in seq_along(datasets)) {

# the subject information from the two datasets is merged...
joint.subject <- rbind(subject[[1]],subject[[2]])

# ...and the same for X...
joint.X <- rbind(X[[1]],X[[2]])

# ...and y
joint.y <- rbind(y[[1]],y[[2]])

# a data frame containing all the data [subject,feature1,feature2,....,feature561,activity]
activityData <- data.frame(joint.subject,joint.X,joint.y)

# the names of the variables are added to the data frame
names(activityData) <- c('subject',features.names[,2],'activity')

# the activity column is turned into a factor variable describing the activity
levels(activityData$activity) <- activities.names[,2]

# index of the columns related to the mean or standard deviation
iMeanOrStd <- grep('(:?mean\\(\\)|std\\(\\))',names(activityData))

# the first column (subject), those related to mean or std, and the last column (activity) are kept
iKeptVariables <- c(1,iMeanOrStd,dim(activityData)[2])

# only the above columns are relevant
filteredData <- activityData[,iKeptVariables]

# the data is grouped by subject and activity, and the mean of each variable computed for those groups
tidyData <- filteredData %>% group_by(subject,activity) %>% summarise_each(funs(mean),-subject,-activity)

# parenthesis are removed from the columns' names
names(tidyData) <- gsub('\\(\\)','',names(tidyData))

# the tidy dataset is saved to disk
write.table(tidyData,'tidy_data.txt',row.name=FALSE)