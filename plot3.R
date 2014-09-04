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
png(file = "/Users/jamessweeney/Desktop/plot3.png")
par(mar = c(4,4,2,1), ps = 12)
with(newdata, plot(dtf, as.numeric(as.character(Sub_metering_1)),
        type = "l", col = 81, ylab = "Energy sub metering", 
        xlab = ""))
with(newdata, lines(dtf, as.numeric(as.character(Sub_metering_2))
        ,col = "red"))
with(newdata, lines(dtf, as.numeric(as.character(Sub_metering_3))
        ,col = "blue"))
legend("topright", col = c("gray", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

dev.off()
