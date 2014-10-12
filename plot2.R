e<-read.csv2("household_power_consumption.txt",dec=".")
be <- e[(e$Date =="2/2/2007" | e$Date =="1/2/2007"),]
a <-be$Global_active_power
a <- as.numeric((as.character(a)))
t <- be$time


par(mar=c(3,4,2,2))

par(xaxt="n")
plot(a,t, type="l",ylab="Global Active Power (Kilowatts)")

par(xaxt="s")

axis(1,0,"Thu")
axis(1,1440,"Fri")
axis(1,2881,"Sat")


dev.copy(png,file="plot2.png")
dev.off()
