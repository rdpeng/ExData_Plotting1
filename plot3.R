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


plot(workingset$datetime,workingset$Sub_metering_1,type="l",
     main="",ylab="Energy sub metering",xlab="")
lines(workingset$datetime,workingset$Sub_metering_2,col="red")
lines(workingset$datetime,workingset$Sub_metering_3,col="blue")

legend("topright",lty=1,col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

###################################################################################
## Save plot to png

##Increased width of png so that legends are clear
dev.copy(png,'plot3.png', width = 580, height = 480)
dev.off()
