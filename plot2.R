setwd("/Users/josephlamps/Downloads")

hpc <- read.table("household_power_consumption.txt", sep=";")
subsethpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

#2nd plot
subsethpc$Date <- as.Date(subsethpc$Date, format="%d/%m/%Y")
subsethpc$Time <- strptime(subsethpc$Time, format="%H:%M:%S")
subsethpc[1:1440,"Time"] <- format(subsethpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsethpc[1441:2880,"Time"] <- format(subsethpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subsethpc$Time, subsethpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power vs Time")