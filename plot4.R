# load file into R as elecP
elecP<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
# change Date variables into Date class, and subset data from the dates 2007-02-01 and 2007-02-02
library(lubridate)
elecP$Date<-dmy(elecP$Date)
elecP_sub <- subset(elecP, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02") )

# use lubridate Time, combine Date and Time to one new variable called Datetime, use mutate function from with dplyr add the in the Datetime variable into dataframe 
elecP_sub$Time<-hms(elecP_sub$Time)
Datetime<- paste(elecP_sub$Date+elecP_sub$Time)
library(dplyr)
elecP_sub<-mutate(elecP_sub,Datetime)
elecP_sub$Datetime <- as.POSIXct(elecP_sub$Datetime)

# generate "plot4.png" file
# plot four plots in order.
png(file="plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        plot(elecP_sub$Global_active_power~elecP_sub$Datetime, type="l",ylab="Global Active Power", xlab="")
        plot(elecP_sub$Voltage~elecP_sub$Datetime, type="l",ylab="Voltage", xlab="datetime")
        plot(elecP_sub$Sub_metering_1~elecP_sub$Datetime, type="l",ylab="Energy Submetering", xlab="")
                lines(elecP_sub$Sub_metering_2~elecP_sub$Datetime, type="l",col="red")
                lines(elecP_sub$Sub_metering_3~elecP_sub$Datetime, type="l",col="blue")
                legend('topright', lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty = "n")
        plot(elecP_sub$Global_reactive_power~elecP_sub$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()
                