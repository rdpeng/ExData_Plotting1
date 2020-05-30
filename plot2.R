file<-"./data.txt"
t<-read.table(file, header =TRUE, sep = ";", dec = ".")


data1<-subset(t,as.Date(Date)=="1/2/2007"|as.Date(Date)=="2/2/2007")

plot(strptime(data1$Time,format="%H:%M:%S"),as.numeric(data1$Global_active_power), main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
with(data1, lines(strptime(data1$Time,format="%H:%M:%S"),as.numeric(data1$Global_active_power)))
dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()