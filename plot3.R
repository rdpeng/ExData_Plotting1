


#read data from file
data <- read.table('household_power_consumption.txt', colClasses = c("character", "character",
                                                                     "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"), header =TRUE, sep =';', na.strings="?")



#add dateTime column
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data we want
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01",]
data<-data[data$Date<="2007-02-02",]
head(data,3)




# create the png with with the matching labels and size

png(filename="plot3.png", width=480, height=480)


# calling the basic plot functions
plot(data$DateTime,data$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering",main="",yaxt="n")
par(xpd=F)
axis(2, at = seq(0, 30, by = 10), las=2)
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")
dev.off()



