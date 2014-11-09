#Set working directory to /Desktop/CoureraR (default setting)

#Load a subset of the dataset and specify variables, date and time format

data <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880, na.strings = "?", header=F, sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

#Open the png device

png(filename="Plot1.png", width=480, height=480)

#Create the histogram

hist(data$Global_active_power, col="#red", xlab="Global Active Power (kilowatts)",
main="Global Active Power")

#Sign out

dev.off()
