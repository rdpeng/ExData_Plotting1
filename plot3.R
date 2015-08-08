library(sqldf)
tempplot2 <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
tempplot2$Date <- as.Date(tempplot2$Date,'%d/%m/%Y')
tempplot2$Time <- as.POSIXct(paste(tempplot2$Date, tempplot2$Time), format="%Y-%m-%d %H:%M:%S")

finalplot2<- tempplot2[,-which(names(tempplot2) == "Date")]
png(file = "plot3.png", bg = "white",width = 480, height = 480, units = "px")
plot(finalplot2$Time,finalplot2$Sub_metering_1,  ylab="Global Active Power(kilowatts)" ,type="l",xlab="")
lines(finalplot2$Time,finalplot2$Sub_metering_2,col="red",type="l")
lines(finalplot2$Time,finalplot2$Sub_metering_3,col="blue",type="l")
legend("topright", legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),col=c("black","red","blue"), lty=1,inset=.02)
dev.off ();


