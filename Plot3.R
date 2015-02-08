#load the file into R
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Convert date
data$Date=as.Date(data$Date,format="%d/%m/%Y")

#select data
df = data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]

#Plot and save graph
png(filename="plot3.png", width=480, height=480, units="px")
with(df,plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n"))
lines(df$Sub_metering_2,type="l",col="red")
lines(df$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off
