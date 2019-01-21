#Get full data set
datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(datapower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
datapower$Date <- as.Date(datapower$Date, format="%d/%m/%Y")

#subset power data
powersubset <- subset(datapower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Removed datapower full data 
rm(datapower)

#Plot 1
hist(as.numeric(as.character(powersubset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#save to png format
dev.copy(png,'plot1.png', height = 480, width = 480)
dev.off()