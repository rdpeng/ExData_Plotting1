#Browse to the working directory
setwd("D:/oNLINE cOURSE")
power<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Obtain the data related to two days(Feb 1 & Feb2):
data<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# Changing the class of Date from character to Date:
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Generating Plot2:
png("plot2.png", width=480, height= 480)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
