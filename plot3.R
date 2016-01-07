# Downloads the data set files
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")

# Extracts the dataset files
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Creates a path variable for the unzipped folder
dataPath <- file.path("./data")

#Read file to table
householdpower  <- read.table(file.path(dataPath, "household_power_consumption.txt" ), sep = ";", header = TRUE)

#Convert date
householdpower$Date <- as.Date(householdpower$Date, format="%d/%m/%Y")

#subset 2 days
subsethhp <- householdpower[(householdpower$Date=="2007-02-01") | (householdpower$Date=="2007-02-02"),]

#convert numeric variables
subsethhp$Global_active_power <- as.numeric(as.character(subsethhp$Global_active_power))
subsethhp$Sub_metering_1 <- as.numeric(as.character(subsethhp$Sub_metering_1))
subsethhp$Sub_metering_2 <- as.numeric(as.character(subsethhp$Sub_metering_2))
subsethhp$Sub_metering_3 <- as.numeric(as.character(subsethhp$Sub_metering_3))

#Convert timestamp
subsethhp <- transform(subsethhp, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#creates line graph
plot(subsethhp$timestamp,subsethhp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subsethhp$timestamp,subsethhp$Sub_metering_2,col="red")
lines(subsethhp$timestamp,subsethhp$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#Creates png file on the working directory
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()