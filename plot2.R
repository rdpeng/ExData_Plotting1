plot2 <- function() {
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
    filename = "plot2.png",width = 480,height = 480,units = "px"
  )
  
  # draw plot
  plot(
    data$datetime,
    data$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab =
      "",type = "l"
  )
  dev.off()
  
}
