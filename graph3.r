#load prepared data
source('preparedData.r')

#plot3
#Weekdays are named German in the plot ("Do"="Thu","Fr"="Fri","Sa"="Sat")
png("Plots/Plot3.png")
plot(Power.Subset$Time,Power.Subset$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(Power.Subset$Time,Power.Subset$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(Power.Subset$Time,Power.Subset$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()