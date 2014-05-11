#Load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="power.zip")
power.data=read.table(unz("power.zip","household_power_consumption.txt"),sep=";",header=TRUE)

#Transform Date variable to as.Date()
power.data$Date=as.Date(power.data$Date,format="%d/%m/%Y")

#Extract observations corresponding to Feb 1st and Feb 2nd 2007.
data=subset(power.data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Format Time variable to POSIXlt format
a=paste(as.character(data$Date),as.character(data$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
data$Time=b

#Transform rest of variables from factor to numeric
for (i in 3:9)
{
 data[,i]=as.numeric(as.character(data[,i]))
}

#Plot 1
png("Plot1.png",bg="white")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
