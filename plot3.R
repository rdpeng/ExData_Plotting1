#Objective: Read data from Create Plot for UC Irvine Machine Learning Repository,  “Individual household electric power consumption Data Set”. And create Daily plot for Global Active Power.

#Download the file and put the file in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")

#Unzip the file
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Select only 2-day period in February, 2007
small_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Format variable datetime or numeric for plotting
datetime <- strptime(paste(small_data$Date, small_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(small_data$Global_active_power)
subMetering1 <- as.numeric(small_data$Sub_metering_1)
subMetering2 <- as.numeric(small_data$Sub_metering_2)
subMetering3 <- as.numeric(small_data$Sub_metering_3)

#Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()
