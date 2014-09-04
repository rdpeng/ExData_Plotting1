setwd("/Users/Desktop/Coursera/exploratorydataanalysis")

#read file
fname<-file("household_power_consumption.txt","r")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(fname),value=TRUE),sep= ";", header= F,na.strings= "?")
close(fname)
data <- na.omit(data)

#add column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#covert date and time


data$datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
data$week <- weekdays(data$datetime,abbreviate=T)



#check data
head(data)
tail(data)

#plot 1
hist(data$Global_active_power,main= "Global Active Power",xlab="Global Active Power (Kilowatts)",col ="red")
dev.copy(png,file= "plot1.png") #copy the plot to a PNG file
dev.off()

