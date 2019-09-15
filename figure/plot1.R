library(dplyr)
#Step.1:Reading the file

fd <- read.table("household_power_consumption.txt", skip=1, sep=";")
fd <- rename(fd, date=V1,time=V2,global_active_power=V3, global_reactive_power=V4,voltage=V5, global_intensity=V6, sub_metering_1=V7, sub_metering_2=V8,sub_metering_3=V9)
fd <- subset(fd, fd$date=="1/2/2007" | fd$date=="2/2/2007")


#Step.2:Plotting the histogram:

hist(as.numeric(as.character(fd$global_active_power)), xlab="Global Active Power(kilowatts)",main="Global Active Power",col="RED")


#Step.3:Saving the plot in a PNG File

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
