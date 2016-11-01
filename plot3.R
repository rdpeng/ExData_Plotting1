# COURSERA: Exploratory data analysis: Project 1
#------------------------------------------------

#### set the working directory
setwd("~/Dropbox/After_PhD 1.42.04 PM/Coursera/Coursera_Exploratory_analysis")

#### Read in the data and select the needed data
data <- read.table("household_power_consumption.txt", header=T, sep=";", dec=".", stringsAsFactors = F)
data_selection <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
head(data_selection)

#### Convert Date and Time 
data_selection$Time <- strptime(paste(data_selection$Date, data_selection$Time, sep=" "), format ="%d/%m/%Y %H:%M:%S")
data_selection$Date <- as.Date(data_selection$Date, format ="%d/%m/%Y")

#### Convert characters to numeric class
data_selection$Global_active_power<-as.numeric(data_selection$Global_active_power)
data_selection$Sub_metering_1 <-as.numeric(data_selection$Sub_metering_1)
data_selection$Sub_metering_2 <-as.numeric(data_selection$Sub_metering_2)
data_selection$Sub_metering_3 <-as.numeric(data_selection$Sub_metering_3)
data_selection$Voltage <-as.numeric(data_selection$Voltage)
data_selection$Global_reactive_power <-as.numeric(data_selection$Global_reactive_power)

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(data_selection$Time, data_selection$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data_selection$Time, data_selection$Sub_metering_1)
lines(data_selection$Time, data_selection$Sub_metering_2, col="red")
lines(data_selection$Time, data_selection$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
