
#created by Jeremy Chad Hess for Coursera Data Science Specialization Course 4, Project 1

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,colClasses=c("character", "character", rep("numeric",7)),sep=";",na="?")

HHP <- subset(data,Date == '2/2/2007' | Date == '1/2/2007')

rm(data)

library(datasets)

png("plot1.png", width=400, height=400)

hist(HHP$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()