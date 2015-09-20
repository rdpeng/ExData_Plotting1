library(datasets)

data <- read.csv("household_power_consumption.txt", sep=";")
View(data)

windows.options(width=480, height=480)

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))

with(data1,{  
  
  {plot(as.numeric(as.character(data1$Global_active_power)),
        type="l",xaxt = "n",xlab=NA, ylab="Global Active Power")
    axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))} 
  
  
  {plot(as.numeric(as.character(data1$Voltage)),
        type="l",xaxt = "n",xlab="datetime", ylab="Voltage")
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) }
  
  {plot(as.numeric(as.character(data1[,7])),type="l",xaxt = "n",xlab=NA, ylab="Energy sub metering")
  with(data1, lines(as.numeric(as.character(data1[,8])), col = "red"))
  with(data1, lines(as.numeric(as.character(data1[,9])), col = "blue"))
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
  legend("topright",c("Sub_metering_1", "Sub_metering_2",
                      "Sub_metering_3"),cex=.3, col=c("black","red","blue"),lty=c(1,1,1))} 
  
  {plot(as.numeric(as.character(data1$Global_reactive_power)),
        type="l",xaxt = "n",xlab="datetime", ylab="Global_reactive_power")
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) }
  
})  ## Create plot on screen device

dev.copy(png, file = "Plot4.png")  ## Copy my plot to a PNG file
dev.off()




