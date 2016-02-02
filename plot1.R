## reads data
df<-read.table("household_power_consumption.txt",  header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
##subsets data based on dates
power1<- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007")

## using dplyr to transform dates and create a new variable Date2 and a dataset power2
library(dplyr)
power2<- mutate(power1, date2= as.Date(power1$Date, format="%d/%m/%Y"))
power2$Global_active_power <- as.numeric(as.character(power2$Global_active_power))
power2$Global_reactive_power <- as.numeric(as.character(power2$Global_reactive_power))
power2$Voltage <- as.numeric(as.character(power2$Voltage))
power2 <- transform(power2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
power2$Sub_metering_1 <- as.numeric(as.character(power2$Sub_metering_1))
power2$Sub_metering_2 <- as.numeric(as.character(power2$Sub_metering_2))
power2$Sub_metering_3 <- as.numeric(as.character(power2$Sub_metering_3))


##plot1.R
with(power2, hist(Global_active_power, col="red" , main = "Global Active Power", 
xlab="Global active power (kilowatts)", ylab="Frequency"))
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
