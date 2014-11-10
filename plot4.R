# Reading data
fichier<-"household_power_consumption.txt"
d<-read.csv2(fichier, colClasses = "character", na.strings="?")

any(d=="?",na.rm=T)

d<-subset(d,subset=(d$Date %in% c("1/2/2007", "2/2/2007")))
#debut 66637 fin 69516 #la ligne des titres omis

#conversion type
d$Date<-as.Date(d$Date, format="%d/%m/%Y")
d$Time<-strptime(paste(d$Date,d$Time),format="%F %R")
for(i in 3:7){d[,i]<-as.numeric(d[,i])}

#------------ plot 4 ------------------------
png("plot4.png")
layout(cbind(1:2,4:3))

plot(d$Time,d$Global_active_power,type="l",
     ylab="Global active Power (kilowatts)",main="",xlab="")

plot(d$Time,d$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")

plot(d$Time,d$Global_reactive_power,type="l",main="",xlab="datetime",
     ylab="Global reactive Power")

plot(d$Time,d$Sub_metering_1,type="l", col="black",main="",xlab="",
     ylab="Energy Sub metering")
lines(d$Time,d$Sub_metering_2,type="l", col="red")
lines(d$Time,d$Sub_metering_3,type="l", col="blue")
legend("topright",legend=paste0("sub_metring_",1:3),col=1:3,lty=1)

dev.off()

