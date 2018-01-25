if(!file.exists("./data")){dir.create("./data")}
EPCdatalocation <- "./data/household_power_consumption.txt"
if(!file.exists(EPCdatalocation)) {
	if(!file.exists(".data/Dataset.zip")){
		UrlData <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file(UrlData,destfile="./data/Dataset.zip")}
	unzip(zipfile="./data/Dataset.zip",exdir="./data")
} else {
	print ("Data file found")}

if(!file.exists(EPCdatalocation)) {
	print("Could not retrieve the data. Please try manually to  place household_power_consumption.txt in ./data folder and run the script again")
} else {
	EPCdata <- read.table(EPCdatalocation,,sep = ";", header = TRUE, stringsAsFactors
= FALSE, dec = ".")
	EPC <- EPCdata[EPCdata$Date %in% c("1/2/2007","2/2/2007") ,]
	EPC$Days <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
	EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
	EPC$Global_reactive_power <- as.numeric(EPC$Global_reactive_power)
	EPC$Voltage <- as.numeric(EPC$Voltage)
	EPC$Global_intensity <- as.numeric(EPC$Global_intensity)
	EPC$Sub_metering_1 <- as.numeric(EPC$Sub_metering_1)
	EPC$Sub_metering_2 <- as.numeric(EPC$Sub_metering_2)
	EPC$Sub_metering_3 <- as.numeric(EPC$Sub_metering_3)

	
	png(filename="./plot4.png", width=480, height=480)
	par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
	with(EPC, plot(Days, Global_active_power, type="l", ylab="Global Active Power", xlab = ""))
	with(EPC, plot(Days, Voltage , type="l", xlab="datetime", ylab="Voltage"))
	with(EPC, 
		{plot(Days, Sub_metering_1 , type="l", xlab="", ylab="Energy Submetering")
		lines(Days, Sub_metering_2, type="l", col = "red")
		lines(Days, Sub_metering_3, type="l", col = "blue")
		legend("topright",  bty="n", lty = 1,  col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
	})	
	with(EPC, plot(Days, Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power"))
	dev.off()
}


