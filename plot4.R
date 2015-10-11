data <- read.table("C:/Users/HP/Documents/GitHub/Huong/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",na.strings = "?",skip = 66637,nrows = 2880)
df<-data.frame(data)
colnames(df)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
df$timeline <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))

png("C:/Users/HP/Documents/GitHub/Huong/plot4.png",bg="transparent",width=480,height=480)
par(mfrow = c(2, 2), cex=0.8)
with(df, {plot(timeline,Global_active_power, type="l",ylab = "Global Active Power", xlab = "")
    plot(timeline,Voltage, type="l", ylab="Voltage", xlab="datetime")
    with(df,plot(timeline,Sub_metering_1, col="black", type = "l", ylab = "Energy sub metering", xlab = ""))
    with(df,lines(timeline,Sub_metering_2,col="red"))
    with(df,lines(timeline,Sub_metering_3,col="blue"))
    legend("topright",lty = 1,bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(timeline, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
})
dev.off()
