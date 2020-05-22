setwd("/Users/josephlamps/Downloads")

hpc <- read.table("household_power_consumption.txt", sep=";")
subsethpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")


#3rd plot
plot(subsethpc$Time, subsethpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub-metering")
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsethpc, lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
