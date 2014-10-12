e<-read.csv2("household_power_consumption.txt",dec=".")
be <- e[(e$Date =="2/2/2007" | e$Date =="1/2/2007"),]
a <-be$Global_active_power
a <- as.numeric((as.character(a)))
hist(a,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")


dev.copy(png,file="plot1.png")
dev.off()
