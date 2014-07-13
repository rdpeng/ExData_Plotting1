data<-read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors = FALSE, na.strings = "NA")
datas <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))


y <- as.numeric(datas$Global_active_power)
x <- strptime(paste(datas$Date, datas$Time), "%d/%m/%Y %H:%M:%S")
plot(x,y, type= "l",ylab = "Global Active Power (kilowatts)",xlab="")


dev.copy(png,'plot2.png',width = 480, height = 480,bg = "white")
dev.off()
