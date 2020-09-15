unzip(zipfile="./exdata_data_household_power_consumption.zip")

##read txt as table
powerconsumption<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))

##Format as date
powerconsumption$Date<-as.Date(powerconsumption$Date, "%d/%m/%Y")

##Subsetting data: 1 feb 2007 to 2 feb 2007
powerconsumption<-subset(powerconsumption,Date>=as.Date("2007-2-1")& Date<=as.Date("2007-2-2"))

##Delete incomplete cases
powerconsumption<-powerconsumption[complete.cases(powerconsumption),]

##Combine Date-Time
dateTime<-paste(powerconsumption$Date, powerconsumption$Time)
dateTime<-setNames(dateTime, "DateTime")
powerconsumption<-cbind(dateTime, powerconsumption)

##Format dateTime column
powerconsumption$dateTime<-as.POSIXct(dateTime)

##Plot4 
par(mfrow=c(2,2))

plot(powerconsumption$dateTime, powerconsumption$Global_active_power, type = "l",xlab = "" ,ylab = "Global Active Power")

plot(powerconsumption$dateTime, powerconsumption$Voltage, type = "l",xlab = "datetime" ,ylab = "Voltage")

with(powerconsumption, {
        plot(Sub_metering_1~dateTime, type="l",
             ylab="Energy sub metering",xlab="")
        lines(Sub_metering_2~dateTime, col="red")
        lines(Sub_metering_3~dateTime, col="blue")
})
legend("topright", col = c("black", "red", "blue"),lty =1,lwd = 2, bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(powerconsumption$dateTime, powerconsumption$Global_reactive_power, type = "l",xlab = "datetime" ,ylab = "Global_reactive_power")

##Save plot
dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")
dev.off()