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


plot(workingset$datetime,workingset$Global_active_power,type="l",
     main="",ylab="Global Active Power (Kilowatt)",xlab="")

###################################################################################
## Save plot to png

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
