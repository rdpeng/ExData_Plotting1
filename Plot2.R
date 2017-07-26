data <-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date<- as.Date(data$Date,format='%d/%m/%Y')
my_data <-subset(data, Date == "2007-2-1" | Date == "2007-2-2")
y<- transform(my_data, combine = paste(Date, Time, sep= " "))

y$combine<- strptime(y$combine, format = "%Y-%m-%d %H:%M:%S")
plot(y$combine,y$Global_active_power, type="l", ylab="Global Active Power (KiloWatts)", xlab="")
dev.copy(png,file="Plot2.png")
dev.off()