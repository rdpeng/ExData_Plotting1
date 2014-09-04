myfile <- "~/Downloads/household_power_consumption.txt"
con <- read.table(myfile, sep = ";", header = TRUE)
a <- con$Date
b <- as.character(a)
c <- as.Date(b, "%d/%m/%Y")
c <- con$Date
days <- con[con$Date == "2/2/2007",]
days2 <- con[con$Date == "1/2/2007",]
alldays <- rbind(days2, days)
dt <- paste(alldays$Date, alldays$Time)
dtf <- dmy_hms(dt)
newdata <- cbind(dtf, alldays[,3:9])
png(file = "/Users/jamessweeney/Desktop/plot4.png")
par(mar = c(4,4,2,1), ps = 10, mfrow = c(2,2), cex = 1.0)
with(newdata, plot(dtf, as.numeric(as.character(Global_active_power)),
        type = "l", ylab = "Global Active Power", xlab = ""))

with(newdata, plot(dtf, as.numeric(as.character(Voltage)), type = "l", 
        ylab = "Voltage", xlab = "datetime"))

with(newdata, plot(dtf, as.numeric(as.character(Sub_metering_1)),
                   type = "l", col = 81, ylab = "Energy sub metering", 
                   xlab = ""))
with(newdata, lines(dtf, as.numeric(as.character(Sub_metering_2))
                    ,col = "red"))
with(newdata, lines(dtf, as.numeric(as.character(Sub_metering_3))
                    ,col = "blue"))
legend("topright", col = c("gray", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

with(newdata, plot(dtf, as.numeric(as.character(Global_reactive_power)),
        type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()
