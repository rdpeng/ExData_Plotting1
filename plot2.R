#Create a vector with the variable names.
#Then read the lines of the file that correspond to the dates that we want and use the vector to name the columns.
variables <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("./household_power_consumption.txt", sep=";", col.names=variables, nrows=2880, skip=66637)

#Combine the date and time of the data using paste() and change the class using strptime()
datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#We combine the new datetime info with the data
newdata <- cbind(data,datetime)

#We generate the plot in a PNG file
png(file = "plot2.png")
with(newdata,plot(datetime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
dev.off()