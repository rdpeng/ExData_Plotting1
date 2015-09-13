#set the working directory and unzip the data file.
file<-"./household_power_consumption.txt"
data<-read.table(file,sep = ";",na.strings = "?",skip = 66637,nrows = 2880)
df<-data.frame(data)
colnames(df)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")

#my PC´s symtem language is Spanish by default, that's why the xlabels are in Spanish
df$timestamp <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))

png("plot3.png",bg="transparent")
with(df,plot(timestamp,Sub_metering_1, col="black", type = "l",
             ylab = "Energy sub metering", xlab = ""))
with(df,lines(timestamp,Sub_metering_2,col="red"))
with(df,lines(timestamp,Sub_metering_3,col="blue"))
legend("topright",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()