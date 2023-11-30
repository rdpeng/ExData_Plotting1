df <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
df <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

df$Time <- as.POSIXct(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

png("plot3.png", width=480, height=480)
plot(df$Time,as.numeric(df$Sub_metering_1),type="n",xaxt="n",xlab="",ylab="Energy sub metering")
with(df,lines(Time,as.numeric(Sub_metering_1)))
with(df,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(df,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=df$Time,gap.axis = 10,labels = weekdays(df$Time))
title(main="Energy sub-metering")

dev.off()