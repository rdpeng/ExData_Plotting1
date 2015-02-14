if(!file.exists("./household_power_consumption.txt")) {
  temp <- tempfile()
  fileUrl <-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,temp,method="curl")
  file <- unzip(temp)
}
data <- read.table("./household_power_consumption.txt",header=T,sep=";")
data <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime = as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
