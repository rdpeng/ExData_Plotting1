# reading the data
h <- read.csv2("household_power_consumption.txt", 
                na.strings="?", 
                quote="", 
                colClasses = "character",
                stringsAsFactors = FALSE)
# subsetting
h2 = h[h$Date %in% c("1/2/2007", "2/2/2007"),]
h2$dt = strptime(paste(h2$Date,h2$Time), 
         format = "%d/%m/%Y %H:%M:%S") 

# setting locales to English 
# (weekdays should appear in English)
Sys.setlocale("LC_ALL","English")

# launch png device
png(filename="plot4.png")

# plot 4 
# divides device in 4 quadrants to be filled by rows
# and sets margins
par(mfrow=c(2,2), mar=c(4,4,2,2))


# topleft 
with(h2, plot(dt, as.numeric(Global_active_power), type="l",
              ylab="Global Active Power", xlab=""))

# topright
with(h2, plot(dt, as.numeric(Voltage), type="l",
              ylab="Voltage", xlab="datetime"))
# bottomleft
with(h2, plot(dt, as.numeric(Sub_metering_1), type="n",
              ylab="Energy sub metering", xlab=""))
lines(h2$dt, h2$Sub_metering_1)
lines(h2$dt, h2$Sub_metering_2, col="red")
lines(h2$dt, h2$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=paste("Sub_metering",1:3,sep="_"))

# bottomright
with(h2, plot(dt, as.numeric(Global_reactive_power), type="l",
              ylab="Global Rective Power", xlab="datetime"))

# closing png device
dev.off()