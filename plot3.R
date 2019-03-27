Sys.setlocale("LC_ALL","English")

df1 <- read.table("household_power_consumption.txt", dec=".",  sep = ";", na.strings = "?", 
                stringsAsFactors = F, header = T, colClasses = c("character", 
                "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric" ))

df1$DT <- strptime(paste(df1$Date, df1$Time), format = "%d/%m/%Y %H:%M:%S")
df1 <- subset(df1, DT >= "2007-02-01" & DT < "2007-02-03")


png(filename = "Figure/Plot3.png")

plot(x= df1$DT, y= df1$Sub_metering_1,
     type = "n", ylab = "Energy sub metering", xlab="" )
lines(x= df1$DT, y= df1$Sub_metering_1, type = "l")
lines(x= df1$DT, y= df1$Sub_metering_2, type = "l", col="red")
lines(x= df1$DT, y= df1$Sub_metering_3, type = "l", col="blue")
legend("topright", lwd = 3, pch = "-", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



