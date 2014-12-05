#Prepares the file for download and read to table
setwd("~/R_Stat/Coursera/4 Exploratory Data Analysis") # sets the working directory
geturl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip") #gets the url to download
download.file(geturl,destfile="exdata-data-household_power_consumption.zip",method="curl") #command to download to working directory
unzip("exdata-data-household_power_consumption.zip") #unzip the file above in working directory
house_power_consum_tbl<-read.table("household_power_consumption.txt",sep = ";",h=T,na.strings = "?") #creates the table

#select rows and select only 2007/02/01 and 2007/02/02
house_power_consum_filter1<-house_power_consum_tbl[1:2075260,] #select the required rows
house_power_consum_filter1$Date<-strptime(house_power_consum_filter1$Date,"%d/%m/%Y") #convert the date strings to readable date format for criteria selection
house_power_consum_filter2<-house_power_consum_filter1[house_power_consum_filter1$Date>="2007-02-01"& house_power_consum_filter1$Date<="2007-02-02",] #select the time period

#outputs to png
png("plot1.png", width=480, height=480) #create the png file in working directory
hist(house_power_consum_filter2$Global_active_power,col="red",ylim=c(0,1265),freq = TRUE,main="Global Active Power", xlab="Global Active Power (kilowatts)",right=TRUE) #create the histogram with following conditions
dev.off()
