
library(datasets)

data <- read.csv("household_power_consumption.txt", sep=";")
View(data)


data1 <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

windows.options(width=480, height=480)


P1<-{hist(as.numeric(as.character(data1$Global_active_power)),main="Global Active Power",ylab="Frequency",
          xlab="Global Active Power (kilowatts)",freq=TRUE, col = "red")}  
with(data1,P1 )  ## Create plot on screen device

dev.copy(png, file = "Plot1.png")  ## Copy my plot to a PNG file
dev.off()
