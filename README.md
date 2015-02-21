Cleaning data from "Human Activity Recognition Using Smartphones Data Set"

The project comprises the following files

* CodeBook.md, briefly explaining how the data was obtained and processed
* run_analysis.R, an R script that obtains a tidy dataset from the raw data. The script assumes there is a directory named "UCI HAR Dataset" containing the raw dataset.
* tidy_data.txt, the ultimate result stemming from "run_analysis.R": a tidy dataset summarizing the raw data

The script "run_analysis.R" produces the final tidy dataset, "tidy_data.txt". It accesses the directories "UCI HAR Dataset/train" and "UCI HAR Dataset/test" in a loop reading the files "X_<dataset>.txt", "y_<dataset>.txt" and "subject_<dataset>.txt", where dataset is either "train" or "test" depending on the directory.