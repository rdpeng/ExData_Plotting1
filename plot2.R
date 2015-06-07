  zipFile <- "exdata-data-household_power_consumption.zip"
  textFile <- "household_power_consumption.txt"
  colClasses <- c("character", "character", rep("numeric",7))
  data <- read.csv(unz(zipFile, textFile), header = TRUE, sep = ";", na.strings = "?", colClasses= colClasses)
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data <- data[data$Date >= as.Date("2007/02/01") & data$Date <= ("2007/02/02"),]


title = ""
x_axis = ""
y_axis = "Global Active Power (kilowatts)"

with(data, plot(1:length(Date), Global_active_power, type="l", xlab=x_axis,ylab=y_axis,xaxt="n"))
axis(1,at=c(0,length(df_power$Date)/2,length(df_power$Date)),labels=c("Thu","Fri","Sat"))


dev.copy(png,"figure/plot2.png")
dev.off()