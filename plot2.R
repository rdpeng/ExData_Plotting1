#Prepares the file for download and read to table
setwd("~/R_Stat/Coursera/4 Exploratory Data Analysis") # sets the working directory
install.packages("lubridate")
library(lubridate)
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
png("plot2.png", width=480, height=480)
plot(house_power_consum_filter2$DateTime2,house_power_consum_filter2$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
