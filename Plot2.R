#Downloading file from URL
download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',destfile='localfile.zip', method='auto')
Unzipping
unzip ("localfile.zip", exdir = ".")
list.files(".")
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")
#Verifying the data
str(data)
summary(data)
#Subsetting
filter=subset(data,Date=="1/2/2007"|Date=="2/2/2007")
filter$Global_active_power=as.numeric(filter$Global_active_power)

#Plot2
datetime <- strptime(paste(filter$Date, filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, filter$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
