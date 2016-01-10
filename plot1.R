plot1 <- function() {
  #Read data
  powerdata = read.table(
    "household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE
  )
  powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
  data <-
    subset(powerdata,powerdata$Date == as.Date(factor("2007-02-01")) |
             powerdata$Date == as.Date(factor("2007-02-02")))
  #Create file
  png(
    filename = "plot1.png",width = 480,height = 480,units = "px"
  )
  
  # draw plot
  hist(
    data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red"
  )
  dev.off()
  
}
