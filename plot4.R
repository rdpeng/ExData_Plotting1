# plot4.R: Project 1, part 4 of Exploratory Data Analysis (Johns Hopkins / Coursera)
# 
# updated for March 2015 session of EDA
#
# Reads electrical power consumption data and creates a png file of four plots
# 

if(!file.exists(".\\data")){dir.create(".\\data")}
hpcfile <- ".\\data\\household_power_consumption.txt"
if(file.exists(hpcfile))
  {
  print ("reading from existing text file . . . .")
  alldata <- read.table(hpcfile, sep=";", header = TRUE, stringsAsFactors = FALSE)
  } else
  {
  print ("downloading and reading from temporary zipped file")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(fileUrl,temp)
  alldata <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header = TRUE, stringsAsFactors = FALSE)
  unlink(temp)
  }

# extract data from the dates 2007-02-01 and 2007-02-02
data <- alldata[(alldata$Date=="1/2/2007") | (alldata$Date=="2/2/2007"),]
#
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

png(filename=".\\data\\plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data$datetime, as.numeric(data$Global_active_power), type="l",
     xlab="",
     ylab='Global Active Power')

plot(data$datetime, as.numeric(data$Voltage), type="l",
     xlab="datetime",
     ylab='Voltage')

plot(data$datetime, as.numeric(data$Sub_metering_1), type="l",
     xlab="",
     ylab='Energy sub metering')
lines(data$datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(data$datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1, col=c('black','red','blue'), bty='n')

plot(data$datetime, as.numeric(data$Global_reactive_power), type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

