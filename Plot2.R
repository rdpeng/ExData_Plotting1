#load the file into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date
data$Date<- strptime(data$Date, "%d/%m/%Y")

#subset data
subdata<-data[data$Date>="2007-02-01" & data$Date<= "2007-02-02",]

#Convert date in subsetdata
subdata$datetime <- paste(subdata$Date, subdata$Time, sep = " ") 
subdata$datetime<-as.POSIXlt(subdata$datetime)

#Plot
png(filename="plot2.png", width=480, height=480, units="px")
plot(y= subdata$Global_active_power, x=subdata$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off
