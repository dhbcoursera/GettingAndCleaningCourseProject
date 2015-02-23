#Note, this script requires dplyr. Install using install.packages(dplyr)
suppressMessages(library(dplyr)) 


# Function to load in either the test or training data
# folder should either be "test" or "train"

get.data <- function(folder) {
    
    #Construct the path name for the files
    path <- paste("UCI HAR Dataset",folder,"",sep="/")
    
    #Construct the final file names    
    subjectfile <- paste(path,"subject_",folder,".txt",sep="")
    xfile <- paste(path,"X_",folder,".txt",sep="")
    yfile <- paste(path,"y_",folder,".txt",sep="")
    
    #Read in the labels
    tnames <- read.table('UCI HAR Dataset/features.txt')
    tnames <- as.vector(tnames$V2)
    
    #Read in files
    subject <- read.table(subjectfile, col.names=c('subject'))#, colClasses=c("factor"))
    xtest <- read.table(xfile, col.names=tnames)
    ytest <- read.table(yfile)
    
    #Create a factor vector of the activities
    activity <- factor(ytest[,],c("1","2","3","4","5","6"),c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITITNG","STANDING","LAYING"))
    
    #Bind subject and activity
    xtest <- cbind(subject,activity,xtest) 
    
    #Read in list of columns to keep
    columns <- read.table('columnselectors.txt',header=T)
    
    #Remove unwanted columns from xtest
    xtest <- select(xtest,columns$index)
    
    #Rename columns in xtest based on the new name list in columnsselectors.txt
    colnames(xtest) <- as.vector(columns$new.name)
    
    xtest
    
}
    
print("Reading test set")
testSet <- get.data("test")

print("Reading training set")
trainSet <- get.data("train")

print("Merging")
allData <- rbind(testSet,trainSet)

#Group on subject and activity and summarize with mean
finalData <- group_by(alldata,subject,activity) %>% summarise_each(funs(mean))

#Set the subject factor in the proper order
finalData$subject <- factor(finalData$subject,levels = sapply(1:30,toString))

#Sort
finalData <- arrange(finalData,subject,activity)

#Convert to data frame
finalData <- as.data.frame(finalData)
