dataset<-read.table(file="household_power_consumption.txt",sep=";",header=T)
df<-dataset[dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007",]
rm(dataset)
x <- paste(df$Date, df$Time)
df$x<-strptime(x, "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(levels(df$Global_active_power))[df$Global_active_power]
volt<-as.numeric(levels(df$Voltage))[df$Voltage]
grp<-as.numeric(levels(df$Global_reactive_power))[df$Global_reactive_power]
cols<-c("black","red","blue")
sm1<-as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
sm2<-as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]
sm3<-df$Sub_metering_3
png(filename="plot4.png", width=480, height=480) 
par(mfrow=c(2,2))
plot(df$x,gap,ylab="Global Active Power",type="l",xlab="") 
plot(df$x,volt,ylab="Voltage",type="l",xlab="datetime") 
plot(df$x,sm1,ylab="Energy sub metering",type="l",xlab="",col=cols[1]) 
lines(df$x,sm2,type="l",xlab="",col=cols[2]) 
lines(df$x,sm3,type="l",xlab="",col=cols[3]) 
legend("topright",legend=names(df)[7:9],lwd=1, col=cols,bg = "transparent", box.col = "transparent")
plot(df$x,grp,ylab="Global_reactive_power",type="l",xlab="datetime") 
dev.off() 
