household_power_consumption <- read.table("~/Coursera_ExplorData-CourseProj/household_power_consumption.txt", sep=";", quote="\"")
household_power_consumption$V1<-as.Date(household_power_consumption$V1,format='%d/%m/%Y')
data<-household_power_consumption[household_power_consumption$V1>="2007-02-01" & household_power_consumption$V1<="2007-02-02",]
chart1<-hist(as.numeric(as.character(data[,3])),col="red",breaks=13,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()