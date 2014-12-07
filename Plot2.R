#Set working directory to /Desktop/CoureraR (default setting)

#Load a subset of the dataset and specify variables and date, time format

data <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880, na.strings = "?", header=F, sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Open the png device

png(filename="Plot2.png", width=480, height=480)

#Create the plot

> plot(data$DateTime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)", main="")

#Sign out

dev.off()