setwd("C:/Users/lauren/Desktop/data Science/ExData_Plotting1")

## read in data
data<- read.csv("C:/Users/lauren/Desktop/data Science/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

## subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format data
GAP<- as.numeric(subSetData$Global_active_power)

## create graph
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()