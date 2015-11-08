##Read the data Individual household electric power consumption Data Set from working folder
##Format the data column by using as.Date function
##Create the subset of the data for the two days of interest
##Format the global active power data column as numberic
##Transform the data and time to the required format
##Plot Global Active Power
##Save the file as "plot2.png" 
##Display the saved PNG path using getwd

plot2 <- function() {
  
  HHCD <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?", "NA"))
  HHCD$Date <- as.Date(HHCD$Date, format = "%d/%m/%Y")
  HHCD_SubSet <- HHCD[(HHCD$Date == "2007-02-01") | (HHCD$Date == "2007-02-02"),]
  HHCD_SubSet <- transform(HHCD_SubSet, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(HHCD_SubSet$timestamp,HHCD_SubSet$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
