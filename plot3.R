data <- read.table("C:/Users/HP/Documents/GitHub/Huong/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",na.strings = "?",skip = 66637,nrows = 2880)
df<-data.frame(data)
colnames(df)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
df$timeline <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))

png("C:/Users/HP/Documents/GitHub/Huong/plot3.png",bg="transparent",width=480,height=480)
with(df,plot(timeline,Sub_metering_1, col="black", type = "l",
                          ylab = "Energy sub metering", xlab = ""))
with(df,lines(timeline,Sub_metering_2,col="red"))
with(df,lines(timeline,Sub_metering_3,col="blue"))
legend("topright",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

