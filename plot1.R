plot1<- function(workingdir) {
  
  library(dplyr)

  setwd(workingdir)

  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";" )
  data$Date <- as.Date(data$Date, "%d/%m/%Y")

  fdata <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

  fdata$DateTime <- paste(fdata$Date, fdata$Time)

  fdata$DateTime <- strptime(fdata$DateTime, "%Y-%m-%d %H:%M:%S")

  fdata$Global_active_power <- as.numeric(fdata$Global_active_power)

  hist(fdata$Global_active_power, 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (Kilowatts) ")

  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()

}
