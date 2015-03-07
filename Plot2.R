
##Set the working directory to the location where input data file exists

power_data <- read.table("household_power_consumption.txt",header=T,sep=";")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# subsetting for the required 2 dates
power <- subset(power_data,Date == "2007-02-01"| Date=="2007-02-02")

power$Time <- as.character(power$Time)
power$datetime <- paste(power$Date,power$Time)
power$datetime <- as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")
power <- power[order(power$datetime),]

png(filename="plot2.png",width=480,height=480,units="px",bg="white")
plot(as.numeric(power$Global_active_power)/500,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1,at=c("0","1500","2900"),labels=c("Thu","Fri","Sat"))
dev.off()


