library(lubridate)

dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                      stringsAsFactors = FALSE)

dataset$Date <- dmy(dataset$Date)

dat <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ) 
dat$Global_active_power <- as.numeric(dat$Global_active_power)


png(filename = "plot1.png", width = 480, height = 480)
par("mfcol"=c(1,1))
hist(dat$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
