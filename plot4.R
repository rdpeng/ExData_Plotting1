getwd()
##READ THE DATA
EPCData<-read.table("G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/household_power_consumption.txt",sep=";",header=TRUE,
                    na.strings=c("?"))
#CONVERT THE DATE FORMAT & SUBSET
EPCData$Date<-as.Date(EPCData$Date,format='%d/%m/%Y')
EPCData <- subset(EPCData, subset = (EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02")) 
EPCData$datetime <- strptime(paste(EPCData$Date, EPCData$Time), "%Y-%m-%d %H:%M:%S") 
EPCData$datetime <- as.POSIXct(EPCData$datetime) 

#PLOT
dev.off()
par(mfrow=c(2,2))
with(EPCData, {
  plot(datetime,Global_active_power, type = "l", 
                    ylab = "Global Active Power", xlab = "")
  plot(datetime,Voltage, type = "l", 
       ylab = "Voltage", xlab = "datetime")
  plot(EPCData$Sub_metering_1 ~ EPCData$datetime, type = "l",  
       ylab = "Energy sub metering", xlab = "") 
  lines(EPCData$Sub_metering_2 ~ EPCData$datetime, col = "Red") 
  lines(EPCData$Sub_metering_3 ~ EPCData$datetime, col = "Blue") 
  legend("topright", lty = 1, col = c("black", "red", "blue"),  
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  plot(datetime,Global_reactive_power, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
  title( "Plot 4", outer=TRUE, adj=0)
  
})

#SAVE
dev.copy(png, file = "G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/plot4.png", height = 480, width = 480) 
dev.off()