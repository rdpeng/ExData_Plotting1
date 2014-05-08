## Load  Electric power consumption data and transform it
## (Same Logic for all 4 plots)
##
#################################################################################

columnDataClasses=c('character','character','numeric','numeric','numeric','numeric'
                    ,'numeric','numeric','numeric')

data = read.csv("data/household_power_consumption.txt",sep=";",
                colClasses=columnDataClasses,na.strings="?")

datetime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- cbind(data,datetime)

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
workingset <- data[data[,1] >= startDate & data[,1]<= endDate,]

###################################################################################

## Plot on default window size has issue with legends beign messed up
windows(15,15)
par(mfrow=c(2,2))


plot(workingset$datetime,workingset$Global_active_power,type="l",
     main="",ylab="Global Active Power (Kilowatt)",xlab="")

plot(workingset$datetime,workingset$Voltage,type="l",
     main="",ylab="Voltage",xlab="datetime")

plot(workingset$datetime,workingset$Sub_metering_1,type="l",
     main="",ylab="Energy sub metering",xlab="")
lines(workingset$datetime,workingset$Sub_metering_2,collegend="red")
lines(workingset$datetime,workingset$Sub_metering_3,col="blue")

legend("topright",lty=1,bty="n",col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))



plot(workingset$datetime,workingset$Global_reactive_power,type="l",
     main="",ylab="Global_reactive_power",xlab="datetime")

###################################################################################
## Save plot to png

##Increased width of png so that legends are clear
dev.copy(png,'plot4.png', width = 580, height = 480)
dev.off()

