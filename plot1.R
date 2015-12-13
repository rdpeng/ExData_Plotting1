#Plot 1 for Coursea Project

#Data setup

{
  
  x <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
  
  dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
  
  x[as.Date(x$datetime) %in% dates,]
  
}

#Plot1 

png("plot1.png", width=480, height=480, bg= "white")

hist(x$Global_active_power, col="red",
     
     main="Global Active Power",
     
     xlab="Global Active Power (kilowatts)")

dev.off()
