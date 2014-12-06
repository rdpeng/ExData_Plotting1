#Prepares the file for download and read to table
setwd("~/R_Stat/Coursera/4 Exploratory Data Analysis") # sets the working directory
geturl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip") #gets the url to download
download.file(geturl,destfile="exdata-data-household_power_consumption.zip",method="curl") #command to download to working directory
unzip("exdata-data-household_power_consumption.zip") #unzip the file above in working directory
house_power_consum_tbl<-read.table("household_power_consumption.txt",sep = ";",h=T,na.strings = "?") #create the table

#select rows and select only 2007/02/01 and 2007/02/02
house_power_consum_filter1<-house_power_consum_tbl[1:2075260,] #select the required rows
house_power_consum_filter1$Date<-strptime(house_power_consum_filter1$Date,"%d/%m/%Y") #convert the date strings to readable date format for criteria selection
house_power_consum_filter2<-house_power_consum_filter1[house_power_consum_filter1$Date>="2007-02-01"& house_power_consum_filter1$Date<="2007-02-02",] #select the time period
house_power_consum_filter2$DateTime<-paste(house_power_consum_filter2$Date,house_power_consum_filter2$Time) #paste both date and time to a new column
house_power_consum_filter2$DateTime2 <- strptime(house_power_consum_filter2$DateTime, format="%Y-%m-%d %H:%M:%S") #converts to readable date/ time format so that the days can be read

#outputs to png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) #create 2 by 2 charts
with(house_power_consum_filter2, {
  plot(DateTime2,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l") #chart 1
  plot(DateTime2,Voltage,ylab="Voltage",xlab="datetime",type="l") #chart 2
  
  plot(DateTime2,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",col="black") #chart 3
  lines(house_power_consum_filter2$DateTime2,house_power_consum_filter2$Sub_metering_2,col="red") #lines command is added after plot
  lines(house_power_consum_filter2$DateTime2,house_power_consum_filter2$Sub_metering_3,col="blue") #lines command is added after plot
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n") #bty removes the border of the legend
  
  plot(DateTime2,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l") #chart 4
})
dev.off()
