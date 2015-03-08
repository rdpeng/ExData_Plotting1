##made by Nidhi Shrivastava

d<-read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE, stringsAsFactors=FALSE, na.strings="?", colClasses=c(rep("character", 2), rep("numeric",7)))
ds<-d[(d$Date=="1/2/2007" | d$Date=="2/2/2007"),]
ds$DateTime<-strptime(paste(ds$Date, ds$Time), "%d%m%Y %H%M%S")
ds$DateTime<-as.POSIXct(ds$DateTime, format="%d%m%Y %H%M%S")
hist(ds$Global_active_power, col="red", xlab="Global Active Power(kilowatts)",axes=TRUE,plot=TRUE , main="Histogram of Global Active Power")

png(filename="plot1.png", width=480, height=480, units="px", pointsize=12, type="windows", antialias="none")
