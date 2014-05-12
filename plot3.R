household_power_consumption <- read.table("~/Coursera_ExplorData-CourseProj/household_power_consumption.txt", sep=";", quote="\"")
data<-household_power_consumption[as.Date(household_power_consumption$V1,format='%d/%m/%Y')>="2007-02-01" & as.Date(household_power_consumption$V1,format='%d/%m/%Y')<="2007-02-02",]
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
plot3<-with(data, plot(DateTime, as.numeric(as.character(Sub_metering_1)),type="l",ylab="Energy sub metering",xlab=""))
with(data, points(DateTime, as.numeric(as.character(Sub_metering_2)),col="red",type="l"))
with(data, points(DateTime, as.numeric(as.character(Sub_metering_3)),col="blue",type="l"))
legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png')
dev.off()