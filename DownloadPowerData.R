## Coursera.org
## Exploratory Data Analysis - Johns Hopkins University - Data Science Specialization
##

## This script downloads the data for Project 1

## set the working directory
setwd("~/Documents/workspace/datasciencecoursera/ExploratoryDataAnalysis/Project1/ExData_Plotting1")

## check if the data directory exists and create it if it does not exist
if (!file.exists("data")) {
  dir.create("data")
}

## set fileUrl to hold the value of the URL and file to download
## 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/power.zip", method = "curl")
unzip("./data/power.zip", exdir = "./data")