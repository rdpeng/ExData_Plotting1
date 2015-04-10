## Load pqckages
library(dplyr)
library(ggplot2)
## set working direcotry
setwd("C:/coursera/Data_Science/exploratory_data_analysis/project1/")
## read raw data
prjdata <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the data for date range
graphdata<-subset(prjdata,as.Date(Date,"%d/%m/%Y") >= as.Date('01/02/2007',"%d/%m/%Y") & as.Date(Date,"%d/%m/%Y" ) <= as.Date('02/02/2007',"%d/%m/%Y"))
## convert Global_active_power to numeric
globalActivePower <- as.numeric(graphdata$Global_active_power)
## set the output device
png("plot1.png", width=480, height=480)
## plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## device off
dev.off()

