setwd <- "C:/Users/minhduc/Downloads/Documents/coursera_EDA"
#READING IN DATA
names <- read.table("household_power_consumption.txt", nrows = 1, header = F, sep = ";", stringsAsFactors = F)
mydata <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 69516-66637+1, sep = ";", 
                     dec = ".", stringsAsFactors = F, na.strings = "?")
colnames(mydata) <- names

mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S")#change class from String to Date

png("plot3.png", width = 480, height = 480, units = "px")#open png device
with(mydata, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))#plotting
lines(mydata$DateTime, mydata$Sub_metering_2, col = "red")#adding 1st line
lines(mydata$DateTime, mydata$Sub_metering_3, col = "blue")#adding 2nd line
legend("topright", col = c("black", "red", "blue"), lty = rep(1,3), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))#adding legend
dev.off()#close the device