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

#merge Date and time
Date_Time<-paste(Data$Date,Data$Time)
Data$Date_time<-as.POSIXct(Date_Time)


#Creating Plot 2 and extract to png
plot(Data$Date_time,Data$Global_active_power,ylab="Global Active Power (kilowatts)", xlab="",type = "l")
dev.copy(png,file="Plot 2.png",width=480,height=480)
dev.off(4)