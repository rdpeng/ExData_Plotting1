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
	EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
	
	png(filename="./plot1.png", width=480, height=480)
	hist(EPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
}



