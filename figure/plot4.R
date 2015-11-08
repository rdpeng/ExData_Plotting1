##Read the data Individual household electric power consumption Data Set from working folder
##Format the data column by using as.Date function
##Create the subset of the data for the two days of interest
##Format the global active power data column as numberic
##Transform the data and time to the required format
##Plot 4 graphs in multi panel plotting window
##   ##Plot 1 - Global Active Power
##   ##Plot 2 - datetime Vs Voltage
##   ##Plot 3 - Energy sub metering
##   #Plot 4 - datetime Vs Global_reactive_power
##Save the file as "plot4.png" 
##Display the saved PNG path using getwd

plot4 <- function() {
  HHCD <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?", "NA"))
  HHCD$Date <- as.Date(HHCD$Date, format = "%d/%m/%Y")
  HHCD_SubSet <- HHCD[(HHCD$Date == "2007-02-01") | (HHCD$Date == "2007-02-02"),]
  
  HHCD_SubSet$Global_active_power <- as.numeric(as.character(HHCD_SubSet$Global_active_power))
  HHCD_SubSet$Global_reactive_power <- as.numeric(as.character(HHCD_SubSet$Global_reactive_power))
  HHCD_SubSet$Voltage <- as.numeric(as.character(HHCD_SubSet$Voltage))
  
  HHCD_SubSet <- transform(HHCD_SubSet, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  HHCD_SubSet$Sub_metering_1 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_1))
  HHCD_SubSet$Sub_metering_2 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_2))
  HHCD_SubSet$Sub_metering_3 <- as.numeric(as.character(HHCD_SubSet$Sub_metering_3))
  
  par(mfrow = c(2,2))
  
  ##Plot 1 - Global Active Power
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  ##Plot 2 - datetime Vs Voltage
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
   
  ##Plot 3 - Energy sub metering
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_2,col = "red")
  lines(HHCD_SubSet$timestamp,HHCD_SubSet$Sub_metering_3,col = "blue")
  legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), bty = "n", cex = .5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #Plot 4 - datetime Vs Global_reactive_power
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
 
  dev.copy(png, file = "plot4.png", width = 480, height = 480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
