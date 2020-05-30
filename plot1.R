file<-"./data.txt"
t<-read.table(file, header =TRUE, sep = ";", dec = ".")
str(t)

data1<-subset(t,as.Date(Date)=="1/2/2007"|as.Date(Date)=="2/2/2007")
str(data1)

hist(as.numeric(data1$Global_active_power),col="red",xlab="Global Active Power(Kilowatt)",main="Global Active Power",xlim = range(0,6),ylim = range(0,1200))
title(main="Global Active Power")
dev.copy(png,"plot1.png")
dev.off()

