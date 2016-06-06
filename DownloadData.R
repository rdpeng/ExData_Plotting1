## Loading relevant library for restructuring and aggregating the data
## No advanced library required
## defining the file name

filename <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

## Downloading and unzipping the dataset from  UC Irvine Machine Learning Repository:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("Household_power_consumption")) { 
  unzip(filename) 
}

