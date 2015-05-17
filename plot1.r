## Getting full sub_dataset of power consumption sub_data

power_consump_full_data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",

nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

power_consump_full_data$Date <- as.Date(power_consump_full_data$Date, format="%d/%m/%Y")



## getting sub_data covering 2007-02-01 to 2007-02-02sub_sub_data

sub_data <- subset(power_consump_full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(power_consump_full_data)



## Now, we need to convert dates

convertedDate <- paste(as.Date(sub_data$Date), sub_data$Time)

sub_data$convertedDate <- as.POSIXct(convertedDate)



## Our first plotconvertedDate

hist(sub_data$Global_active_power, main="Global Active Power", 

     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")



## Creating png

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

