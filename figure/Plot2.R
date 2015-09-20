library(datasets)

data <- read.csv("household_power_consumption.txt", sep=";")
View(data)

windows.options(width=480, height=480)


data1 <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
with(data1,
     {plot(as.numeric(as.character(data1$Global_active_power)),
           type="l",xaxt = "n",xlab=NA, ylab="Global Active Power (kilowatts)")
       axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
     })  ## Create plot on screen device

dev.copy(png, file = "Plot2.png")  ## Copy my plot to a PNG file
dev.off()
