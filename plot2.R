## read in data
data<- read.csv("C:/Users/lauren/Desktop/data Science/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

## subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP<- as.numeric(subSetData$Global_active_power)

## create graph
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")


#save graph
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()