#Reading Data placed in current working directory
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings = "?")
#Subsetting data to fetch records of specified date
subSetData <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
#Converting character to date format
subSetData$Date <- as.Date(subSetData$Date,format = "%d/%m/%Y")
#Conacatinating date and time then converting string to DateTime format 
datetime<-strptime(paste(subSetData$Date, subSetData$Time, sep=" "),format = "%Y-%m-%d %H:%M:%S")

##############Plot 1###############
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
