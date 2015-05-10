
### library for SQL
library(sqldf)
#### plyr
library(plyr)

######### URL location of Zipped data file
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## setting the time zone
Sys.setlocale("LC_TIME", "English")

### checkng if file is already downloaded and unzipped, if nottdownload and unzip
if(!file.exists("household_power_consumption.txt"))

{
	download.file(url, "household_power_consumption.zip")
	unzip("household_power_consumption.zip")
	
}

filename<-"household_power_consumption.txt"
## We will only be using data from the dates 2007-02-01 and 2007-02-02 and Global_active_power. !="?"
## One alternative is to read the data from just those dates rather than reading in 
## the entire dataset and subsetting to those dates.

sql<-'select *from file where Date in ("1/2/2007", "2/2/2007") and Global_active_power !="?"'
myTable<- read.csv.sql(filename, sql, sep = ";")
sqldf()

#### Creating new column datetime by meging Date and Time column not needed for this plot

NewTab<-mutate(myTable,DateTime=strptime(paste(myTable$Date, myTable$Time), "%d/%m/%Y %H:%M:%S", tz= ""))



####
png(filename = "plot4.png", width = 480, height = 480, units = "px")

attach(NewTab)

par(mfrow=c(2,2))

#### plotting line chart
plot(DateTime,Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(DateTime,Voltage, type="l")
plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Sub Metering")
lines(DateTime, Sub_metering_2, col="red", type="l")
lines(DateTime, Sub_metering_3, col="blue", type="l")
legend(c("topright"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black", "blue","red"))

plot(DateTime, Global_reactive_power, type="l")

dev.copy(png,"plot4.png",width=480,height=480,units="px")

dev.off()
dev.off()
rm(myTable)