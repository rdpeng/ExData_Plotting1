library(dplyr)
library(reshape2)
library(lubridate)


pc<- read.table("hpc.txt", header = TRUE, sep = ";", na.strings = "?")
pc<- mutate(pc, DT=dmy_hms(paste(pc$Date, pc$Time)))
ss<- filter(pc, Date=="1/2/2007" | Date=="2/2/2007")
ss$Date<- dmy(ss$Date)

png(file="plot2.png", width = 480, height = 480, units="px")
plot(ss$DT, ss$Global_active_power, xlab= "", ylab="Global Active Power (kilowatts)", cex=.0005)
lines(ss$DT, ss$Global_active_power)
dev.off()