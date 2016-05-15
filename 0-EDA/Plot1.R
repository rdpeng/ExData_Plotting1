## PLOT 1 PNG - COURSERA WEEK 1 - COURSE PROJECT 1

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA")
#1 downlad and unzip database
nomearquivo <- "dataset.zip"
if (!file.exists(nomearquivo)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, nomearquivo, method="curl")}
if (!file.exists("./0-EAD")) {unzip(nomearquivo)}
pathIn <- file.path("./")
list.files(pathIn, recursive = TRUE)
#2 preparing the database
power_consum <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings='?', stringsAsFactors=FALSE)
#2 converting date and subsetting the data 
power_consum$Date <- as.Date(power_consum$Date, format="%d/%m/%Y")
power_consum <- subset(power_consum, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#converting the date ant Time format to Date Class and store it in Datetime column
datetime <- paste(as.Date(power_consum$Date), power_consum$Time)
datetime
power_consum$Datetime <- as.POSIXct(datetime)
power_consum

## PLOT 1 - GLOBAL ACTIVE POWER
hist(power_consum$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#saving PNG
dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()

