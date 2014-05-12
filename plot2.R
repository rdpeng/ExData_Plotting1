household_power_consumption <- read.table("~/Coursera_ExplorData-CourseProj/household_power_consumption.txt", sep=";", quote="\"")
data<-household_power_consumption[as.Date(household_power_consumption$V1,format='%d/%m/%Y')>="2007-02-01" & as.Date(household_power_consumption$V1,format='%d/%m/%Y')<="2007-02-02",]
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
plot2<-plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()