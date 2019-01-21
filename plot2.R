#Get full data set
datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(datapower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
datapower$Date <- as.Date(datapower$Date, format="%d/%m/%Y")

#subset power data
powersubset <- subset(datapower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Removed datapower full data 
rm(datapower)

powersubset$Date <- as.Date(powersubset$Date, format="%d/%m/%Y")
powersubset$Time <- strptime(powersubset$Time, format="%H:%M:%S")
powersubset[1:1440,"Time"] <- format(powersubset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powersubset[1441:2880,"Time"] <- format(powersubset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot 2
plot(powersubset$Time,as.numeric(as.character(powersubset$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")

#save to png format
dev.copy(png,'plot2.png', height = 480, width = 480)
dev.off()
