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

# Plot 1: histogram
png("plot1.png", width = 480, height = 480)
hist(data_selection$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
