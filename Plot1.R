
##Set the working directory to the location where input data file exists

power_data <- read.table("household_power_consumption.txt",header=T,sep=";")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# subsetting for the required 2 dates
power <- subset(power_data,Date == "2007-02-01"| Date=="2007-02-02")

png(filename="plot1.png",width=480,height=480,units="px",bg="white")
hist(as.numeric(power$Global_active_power)/500,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

