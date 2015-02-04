# Exploratory Data Analysis Course Project 1 Plot 2

#Read text file "household_power_consumption.txt" into data file "power".
power<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",nrows=2075259)

#Select valid dates from the data file.
validdate<-power[,1]=="1/2/2007"|power[,1]=="2/2/2007"
validdata<-power[validdate,]

#Add a column "datetime" that combines the Date and Time columns into a single Posix column.
x<-paste(validdata[,1],validdata[,2])
datetime <- strptime(x, format="%d/%m/%Y %H:%M:%S")
validdata<-cbind(validdata,datetime)

#Plot the Global Active Power column (validdata[,3]) to a plot2.png file using the default 480X480 pixels and a resolution of 72 dpi.
#Turn printing on.
png("plot2.png")

plot(validdata[,10],validdata[,3], type="l", xlab=NA,ylab="Global Active Power (kilowatts)")

#Turn printing off.
dev.off()
