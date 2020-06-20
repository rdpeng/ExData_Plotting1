# R Code for Plot3.png

data <- read.csv("./data/household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
nrow(data);ncol(data)
names(data)
data$Date = as.Date(data$Date,"%d/%m/%Y")
reqdata <- subset(data,Date>="2007-2-1" & Date <= "2007-2-2")
reqdata$datetime <- as.POSIXct(paste(reqdata$Date, reqdata$Time))
head(reqdata)
png(filename = "plot3.png",height = 480,width = 480)
plot(reqdata$datetime,reqdata$Sub_metering_1,type='l',ylab="Energy Sub Metering",xlab="")
lines(reqdata$datetime,reqdata$Sub_metering_2,type='l', col = "red")
lines(reqdata$datetime,reqdata$Sub_metering_3,type='l', col = "blue")
legend("topright",lty=1,lwd=1,legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'),
       col = c("black","red","blue"))
dev.off()