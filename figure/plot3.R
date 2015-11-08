##Read the data Individual household electric power consumption Data Set from working folder
##Format the data column by using as.Date function
##Create the subset of the data for the two days of interest
##Format the global active power data column as numberic
##Transform the data and time to the required format
##Plot Energy sub metering - plot lines in red and blue and add the required legends
##Save the file as "plot3.png" 
##Display the saved PNG path using getwd

plot3 <- function() {
  HHCD <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?", "NA"))
  HHCD$Date <- as.Date(HHCD$Date, format = "%d/%m/%Y")
  HHCD_SubSet <- HHCD[(HHCD$Date == "2007-02-01") | (HHCD$Date == "2007-02-02"),]
  HHCD_SubSet <- transform(HHCD_SubSet, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  HHCD_SubSet$Global_active_power <- as.numeric(as.character(HHCD_SubSet$Global_active_power))
  HHCD_SubSet$Global_reactive_power <- as.numeric(as.character(HHCD_SubSet$Global_reactive_power))
  HHCD_SubSet$Voltage <- as.numeric(as.character(HHCD_SubSet$Voltage))
  
  HHCD_SubSet$Sub_metering_1 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_1))
  HHCD_SubSet$Sub_metering_2 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_2))
  HHCD_SubSet$Sub_metering_3 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_3))
  
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_2,col = "red")
  lines(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_3,col = "blue")
  legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), lwd = c(1,1))
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
}
