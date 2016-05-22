###STEP-1: DOWNLOADING AND READING THE DATA
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){
  dir.create("./house_consumption_data")
  setwd("./house_consumption_data")
  unzip("house_data.zip")
  download.file(url, destfile = "./house_data.zip", mode = "wb")
  unzip("./house_data.zip")
  library("data.table")
  data_full<-fread("household_power_consumption.txt", header = TRUE, sep = ";")
}

###STEP-2: CLEANING THE DATA
data_full$Date<-as.Date(data_full$Date, format="%d/%m/%Y")
data_cut<-data_full[between(data_full$Date,"2007-02-01","2007-02-02"),]
data_cut$datetime <- paste(data_cut$Date, data_cut$Time)
data_cut$datetime <- as.POSIXct(data_cut$datetime)

data_cut$Global_active_power<-as.numeric(data_cut$Global_active_power)
data_cut$Global_reactive_power<-as.numeric(data_cut$Global_reactive_power)
data_cut$Voltage<-as.numeric(data_cut$Voltage)
data_cut$Global_intensity<-as.numeric(data_cut$Global_intensity)
data_cut$Sub_metering_1<-as.numeric(data_cut$Sub_metering_1)
data_cut$Sub_metering_2<-as.numeric(data_cut$Sub_metering_2)
data_cut$Sub_metering_3<-as.numeric(data_cut$Sub_metering_3)


###STEP-3 PLOTTING THE DATA
####plot-4
par(mar = c(4,4,2,2),mfrow = c(2,2))
with(data_cut, {
  plot(Global_active_power~datetime, type = "l", xlab="", ylab="Global Active Power")
  plot(Voltage~datetime, type = "l", xlab="datetime", ylab="Voltage")
  
  plot(Sub_metering_1~datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~datetime, type = "l", col = "red")
  lines(Sub_metering_3~datetime, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=1, lwd=2.5, bty="o" )
  
  plot(Global_reactive_power~datetime, type = "l", ylab = "Energy sub metering", xlab = "datetime")
})
dev.copy(png,"plot4.png")
dev.off()

