#Read in household power consumption data
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  x <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",x)
  power <- unzip(x)
  unlink(x)
}
household_power_consumption <- read.table(power, header=TRUE, sep=";",na.strings="?")


#Subset data to two dates we are interested in
power_consump <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007" )

#Put date and time into one string, changes order and puts it into new column
power_consump$DateTime <- strptime(paste(power_consump$Date,power_consump$Time), "%d/%m/%Y %H:%M:%S")

#Opens png file device
png(file="plot2.png")

#Plots day vs global active power data
plot(power_consump$DateTime,power_consump$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

#Close png file device
dev.off()