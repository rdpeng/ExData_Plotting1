##1. Read data into the R environment, storing the data into the variable data1
data1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##1a. Selecting the appropriate data within date range 2007-02-01 and 2007-02-02
data2<-data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]

##Construct the plot and save it to a 480x480 PNG file
png(filename="plot1.png",width=480,height=480)

##3. Plot data
hist(data2$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
