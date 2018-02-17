plots<- function()
{
  library(lubridate)
  columns <- read.table("household_power_consumption.txt",nrows=1,sep=";",stringsAsFactors = FALSE)
  fh<-file("household_power_consumption.txt")
  #Reading the files with the mentioned date range
  filteredDs <- read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE) ,skip=1,col.names = columns,sep=";",stringsAsFactors = FALSE)
  close.connection(fh)
  #Plot1
  #converting into as.Date the date column and binding it again
  datecolumn <- as.Date(filteredDs[,1],"%d/%m/%Y")
  filteredDs$ModifiedDt <- datecolumn
  datetime <- paste(as.Date(filteredDs$ModifiedDt), filteredDs$Time)
  filteredDs$Datetime <- as.POSIXct(datetime)
  par(mar=c(4,4,2,1))
  hist(filteredDs$Global_active_power,xlab="Global Active Power (Kilowatts)",ylab="Frequency",main = "Global Active Power",col="red")
  ##Save file and close device
  dev.copy(png,"plot1.png", width=480, height=480)
  dev.off()
  #Plot2
  # par(mfrow=c(1,1),mar=c(3,4,1,1))
  # plot(filteredDs$Global_active_power~filteredDs$Datetime,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
  # ##Save file and close device
  # dev.copy(png,"plot2.png", width=480, height=480)
  # dev.off()
  # Create Plot 3
  # with(filteredDs, {
  #   plot(Sub_metering_1~Datetime, type="l",
  #        ylab="Energy Sub Metering", xlab="")
  #   lines(Sub_metering_2~Datetime,col='Red')
  #   lines(Sub_metering_3~Datetime,col='Blue')
  # })
  # legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
  #        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # ## Save file and close device
  # dev.copy(png,"plot3.png", width=480, height=480)
  # dev.off()
  
  ## Create Plot 4
  # par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  # with(filteredDs, {
  #   plot(Global_active_power~Datetime, type="l",
  #        ylab="Global Active Power", xlab="")
  #   plot(Voltage~Datetime, type="l",
  #        ylab="Voltage", xlab="")
  #   plot(Sub_metering_1~Datetime, type="l",
  #        ylab="Energy Sub Metering", xlab="")
  #   lines(Sub_metering_2~Datetime,col='Red')
  #   lines(Sub_metering_3~Datetime,col='Blue')
  #   legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
  #          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #   plot(Global_reactive_power~Datetime, type="l",
  #        ylab="Global Reactive Power",xlab="")
  # })
  # ## Save file and close device
  # dev.copy(png,"plot4.png", width=480, height=480)
  # dev.off()
}