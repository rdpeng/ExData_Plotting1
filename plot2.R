## Plot 2

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[which(data$Date==c("2007-02-01","2007-02-02")), ]

data1$Global_active_power<-as.numeric(data1$Global_active_power)

png(file="plot2.png")

plot(data1$Time,data1$Global_active_power, lty=1, 
     ylab="Global Active Power (kilowatts)")

dev.off()