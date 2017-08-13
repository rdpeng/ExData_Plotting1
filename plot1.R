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

#Opens png file device
png(file="plot1.png")

#Create histogram for global active power
hist(power_consump$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Close png file device
dev.off()
