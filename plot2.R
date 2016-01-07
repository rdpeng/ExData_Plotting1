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

#convert numeric
subsethhp$Global_active_power <- as.numeric(as.character(subsethhp$Global_active_power))

#Convert timestamp
subsethhp <- transform(subsethhp, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#creates line plot
plot(subsethhp$timestamp,subsethhp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Creates png file on the working directory
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()