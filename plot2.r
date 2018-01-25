if(!file.exists("./data")){dir.create("./data")}
EPCdatalocation <- "./data/household_power_consumption.txt"
if(!file.exists(EPCdatalocation)){
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
	
	png(filename="./plot2.png", width=480, height=480)
	plot(EPC$Days, EPC$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()
}



