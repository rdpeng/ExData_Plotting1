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

#Creating the PNG file and plots
png(filename = "plot1.png")
with(hist(powered$Global_active_power,xlab = "Global Active power(watts)",ylab = "Frequency",main = "Global Active Power",col = "red"))
dev.off()

