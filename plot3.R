#Course 4 Exploratory Data Analysis, Wk 1 Project, plot3
power = read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep=";",
                  dec = ".",
                  na.strings = "?",
                  stringsAsFactors = FALSE)
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
str(power)
head(power)
#create new Date_Time by pasting the Date and Time fields
power$Date_Time <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480,
    units = "px")
plot(power$Date_Time, power$Sub_metering_1, type="l", xlab = "",
     ylab = "Energy sub metering")
lines(power$Date_Time, power$Sub_metering_2, type = "l", col="red")
lines(power$Date_Time, power$Sub_metering_3, type = "l", col="blue")
legend("topright", pch= , col=c("black", "blue", "red"), 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty=c(1,1,1), pt.cex = 1, cex = 0.75)
dev.off()

