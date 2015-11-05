library(dplyr)
library(reshape2)
library(lubridate)


pc<- read.table("hpc.txt", header = TRUE, sep = ";", na.strings = "?")
pc<- mutate(pc, DT=dmy_hms(paste(pc$Date, pc$Time)))
ss<- filter(pc, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png", width = 480, height = 480, units="px")
hist(ss$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off()