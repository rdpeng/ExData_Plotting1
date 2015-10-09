# Download file
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$time <- strptime(paste(df$Date, df$Time),"%Y-%m-%d %H:%M:%S")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#Plot 4
plot4 <- function () {
  par(mfrow=c(2,2))
#plot 1
  plot(df$time,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#plot2  
  plot(df$time,df$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
  plot(df$time,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$time,df$Sub_metering_2, col="red")
  lines(df$time,df$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),bty="n",cex=.6)
#plot4
  plot(df$time,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#copy plot
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()
