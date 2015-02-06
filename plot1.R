setwd("C:/Users/Ben/R/Exploratory_Data_Analysis/Project1/ExData_Plotting1")
# Require Sources for function
source("readFunction.R")
# Read Data
D<-readFunction()
# convert data into numeric values
D$Global_active_power<-with(D,as.numeric(as.character(Global_active_power)))
# Creating a png formatted file
png(filename = "plot1.png",width = 480, height = 480, units = "px")
# plot histogram of Global_active_power
with(D,hist(Global_active_power,col="red",xlab="Global active power"))
# close graphic device
dev.off()