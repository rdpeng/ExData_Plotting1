library(data.table)

##Download and unzip the dataset (if it exists not already in the working directory)
filename <- "Electric Power Consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, mode = "wb")
}  
unzip(filename) 

##Getting dataset with all values and transform "?" to NAs
data.all <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data.all$Date <- as.Date(data.all$Date, format="%d/%m/%Y")

##Subsetting the data, remove data.all and convert it to data table to save memory
data <- data.table(subset(data.all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")))
rm(data.all)

##Converting dates
date.time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(data.time)

##Fourth plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global active power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global reactive power",xlab="")
})

##Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()