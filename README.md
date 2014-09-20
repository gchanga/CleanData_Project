CleanData_Project
=================

## Introduction
This repository is for the purpose of storing the project files for 
John Hopkins's Getting and Cleaning Data course on Coursera. The 
scripts included in these repository assumes that the files have
been downloaded and unzipped in the same directory. 

## Dataset and Files
The original data files can be downloaded <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a>.
This repository contains the following files:

<ul>
<li><b>README.md</b>: Current file with introduction and background </li>
<li><b>run_analysis.R</b>: R script used to generate Data_Output.txt </li>
<li><b>CodeBook.md</b>: R script in .md format</li>
<li><b>Data_Output.txt</b>: Dataset output from run_analysis.R script </li>
</ul>

## Script <b>run_analysis.R
The script performs the following:

<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.  </li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names. </li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. </li>
</ol>
