#downloading and unziping files

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"PowerData.zip")
unzip("PowerData.zip")

#Reading Data
dir()
Data<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, quote='\"')
View(Data)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

#subsetting Dates
Data <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Preparing Plot 1 (Global_active_Power hist)
hist(Data$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)",ylab = "Frequency",main = "Global Active Power")
#Extracting graph to PNG File
dev.copy(png,file="Plot 1.png",width=480,height=480)
dev.off(4)