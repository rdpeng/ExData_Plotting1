# Exploratory Data Analysis Course Project 1 Plot 1

#Read text file "household_power_consumption.txt" into data file "power".
power<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",nrows=2075259)

#Select valid dates from the data file.
validdate<-power[,1]=="1/2/2007"|power[,1]=="2/2/2007"
validdata<-power[validdate,]


#Plot the Global Active Power column to a plot1.png file at the default 480X480 pixels and 72 dpi resolution.
#Begin printing to plot1.png.
png("plot1.png")

hist(validdata[,3], breaks=12,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

#Turn off printing.
dev.off()
