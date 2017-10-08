
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
powerseries<-ts(powered$Global_active_power,frequency = 1440,start = 0)
submetering1series<-ts(powered$Sub_metering_1,frequency = 1440,start = 0)
submetering2series<-ts(powered$Sub_metering_2,frequency = 1440,start = 0)
submetering3series<-ts(powered$Sub_metering_3,frequency = 1440,start = 0)
voltageseries<-ts(powered$Voltage,frequency = 1440,start = 0)
Reactiveseries<-ts(powered$Global_reactive_power,frequency = 1440,start = 0)

#Creating the file and Plots
png(filename = "plot4.png")
par(mfcol = c(2,2),mar = c(6,6,3,3))
plot.ts(powerseries,ylab = "Global Active Power (Kilowatts)",xlab = "Days(units in half days)")
plot.ts(submetering1series,ylab = "Energy sub metering",ylim = c(0,40),xlab = "Days(units in half days)")
par(new= T)
plot.ts(submetering2series,ylab = "Energy sub metering",xlab = "Days(units in half days)",ylim = c(0,40),col = "red")
par(new= T)
plot.ts(submetering3series,ylab = "Energy sub metering",xlab = "Days(units in half days)",ylim = c(0,40),col = "blue")
plot.ts(voltageseries,ylab = "Voltage",xlab = "Days(units in half days)")
plot.ts(Reactiveseries,ylab = "Global_Reactive_power",xlab = "Days(units in half days)")
dev.off()
