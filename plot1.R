library(readr)


powerdata <- read_delim("J:/SmartData/SMART Data Science/Working Folders/Liz - Working Folder/household_power_consumption.zip",";", 
           escape_double = FALSE, trim_ws = TRUE)

## change column classes so they are correct

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

## extract subset of data from  2007-02-01 and 2007-02-02

subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram of global active power for 1st and 2nd Feb 2007

pdf(file = "plot1.pdf")
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

##now close the chart device with devoff
dev.off()