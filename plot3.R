rm(list=ls())
setwd("Z:/MyDoc/gauravR/ExpDataAnalysis/CP1")

data=read.table("household_power_consumption.txt",header=T,stringsAsFactors=F,sep=";")
data$Date= as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
data$timestamp=with(data,{format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

######Plot3
png(filename = "plot3.png",width = 480, height = 480)
x= strptime(data$timestamp,"%d/%m/%Y %H:%M:%S")
plot(x,as.numeric(data$Sub_metering_3),type="l",
col="blue",ylim=c(0,40),ylab="Energy sub metering",xlab="")
lines(x,as.numeric(data$Sub_metering_2),type="l",col="red")
lines(x,as.numeric(data$Sub_metering_1),type="l",col="black")
legend("topright",col=c("black","red","blue"),
lty=1,legend=paste0(rep("Sub_metering_",3),c(1:3)))
dev.off()

