## Data Load
setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/exdata-data-household_power_consumption/ExData_Plotting1/")
filename <- "household_power_consumption.txt"
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
dim(data) #get Data Dim
attach(data)
## we will get 2 days
subDataset <- Date == "1/2/2007" | Date == "2/2/2007"
plotData <- data[subDataset, ]
attach(plotData)
x <- paste(Date, Time)
plotData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(plotData) <- 1:nrow(plotData)
dim(plotData) 
attach(plotData)
