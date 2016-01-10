plot4 <- function() {
  #Read data
  powerdata = read.table(
    "household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE
  )
  powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
  data <-
    subset(powerdata,powerdata$Date == as.Date(factor("2007-02-01")) |
             powerdata$Date == as.Date(factor("2007-02-02")))
  data$datetime <-
    as.POSIXct(paste(data$Date, as.character(data$Time)))
  #Create file
  png(
    filename = "plot4.png",width = 480,height = 480,units = "px"
  )
  par(mfrow = c(2,2))
  # draw plot
  plot(
    data$datetime,
    data$Global_active_power,ylab = "Global Active Power",xlab =
      "",type = "l"
  )
  plot(
    data$datetime,
    data$Voltage,ylab = "Voltage",xlab = "Datetime",type = "l"
  )
  
  plot(
    data$datetime,data$Sub_metering_1,ylim = range(
      c(
        data$Sub_metering_1, data$Sub_metering_2,data$Sub_metering_3
      )
    ),ylab = "Energy sub metering",xlab = "",type = "l"
    
  )
  lines(data$datetime,data$Sub_metering_2,col = "red")
  lines(data$datetime,data$Sub_metering_3,col = "blue")
  legend(
    "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty =
      c(1,1,1)
  )
  
  plot(
    data$datetime,
    data$Global_reactive_power,ylab = "Global_reactive_power",xlab = "Datetime"
    ,type = "l"
  )
  dev.off()
  
}
