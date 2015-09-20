library(datasets)

data <- read.csv("household_power_consumption.txt", sep=";")
View(data)

windows.options(width=480, height=480)

with(data1,
     
     {plot(as.numeric(as.character(data1[,7])),type="l",xaxt = "n",xlab=NA, ylab="Energy sub metering")
       with(data1, lines(as.numeric(as.character(data1[,8])), col = "red"))
       with(data1, lines(as.numeric(as.character(data1[,9])), col = "blue"))
       axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
       legend("topright",c("Sub_metering_1", "Sub_metering_2",
                           "Sub_metering_3"),cex=.6, col=c("black","red","blue"),lty=c(1,1,1))
     })  ## Create plot on screen device

dev.copy(png, file = "Plot3.png")  ## Copy my plot to a PNG file
dev.off()

