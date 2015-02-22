Cleaning data from "Human Activity Recognition Using Smartphones Data Set"

The project comprises the following files

* CodeBook.md, briefly explaining how the data was obtained and processed
* run_analysis.R, an R script that obtains a tidy dataset from the raw data. The script assumes there is a directory named "UCI HAR Dataset" containing the raw dataset.
* tidy_data.txt, the ultimate result stemming from "run_analysis.R": a tidy dataset summarizing the raw data

The script "run_analysis.R" produces the final tidy dataset "tidy_data.txt". It accesses the directories "UCI HAR Dataset/train" and "UCI HAR Dataset/test" in a loop reading the files "X_&lt;dataset&gt;.txt", "y_&lt;dataset&gt;.txt" and "subject_&lt;dataset&gt;.txt", where &lt;dataset&gt; is either "train" or "test" depending on the directory. For each variable, "X", "y" and "subject", the data from the two different datasets are stacked "vertically" to obtain three different *joint* variables. These three variables are then used to build a single *data.frame* with all the data.

The names of the columns of the above *data.frame* are extracted from "features.txt", and the **numeric** variable "y" is turned into a **factor** variable using the table in "activity_labels.txt".

A new *data.frame* is built extracting the columns whose names contain "mean" or "std", and this new *data.frame* is further processed by averaging all the variables grouped by "subject" and "activity" to obtain the *tidy" data set.