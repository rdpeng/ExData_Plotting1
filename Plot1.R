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

#Plot1
hist(filter$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
png("plot1.png", width=480, height=480)
hist(filter$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 
