#Read data
data <- read.table("household_power_consumption.txt",sep=";",header=T, as.is=1:9)
data$Date <- as.Date(strptime(data$Date, format ="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
data[,3:9] <- apply(data[,3:9],2,function(el) {as.numeric(el)})

#Filter data from dates 2007-02-01 and 2007-02-02
data2 <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
rm(data)

#Plot2
png(file="plot2.png",width = 480, height = 480)
par(mfcol=c(1,1))
plot(data2$Time,data2$Global_active_power,
     type = "line",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#Close device
dev.off()
