#Reading the Text file
power<-read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)

#converting the type of "Date" column from "character" to "Date" with as.date()
power$Date<-as.Date(power$Date,"%d/%m/%Y")

#Subsetting the data with the necessary dates
powered<-subset(power,Date >= "2007-02-01" & Date <= "2007-02-02") 

#converting the type of "Time"column from "character" to "Time" with as.POSIXct()
powered$Time<-as.POSIXct(paste(powered$Date, powered$Time), format="%Y-%m-%d %H:%M:%S")

#converting the rest of the columns into numeric with as.numeric()
powered[,3:9]<-sapply(powered[,3:9], as.numeric)

#Creating the Time series object model for necessary features
submetering1series<-ts(powered$Sub_metering_1,frequency = 1440,start = 0)
submetering2series<-ts(powered$Sub_metering_2,frequency = 1440,start = 0)
submetering3series<-ts(powered$Sub_metering_3,frequency = 1440,start = 0)

#Creating the file and Plots
png(filename = "plot3.png")
plot.ts(submetering1series,ylab = "Energy sub metering",ylim = c(0,40),xlab = "Days(units in half days)")
par(new= T)
plot.ts(submetering2series,ylab = "Energy sub metering",xlab = "Days(units in half days)",ylim = c(0,40),col = "red")
par(new= T)
plot.ts(submetering3series,ylab = "Energy sub metering",xlab = "Days(units in half days)",ylim = c(0,40),col = "blue")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),lwd = c(1,1,1),col = c("black","red","blue"))
dev.off()