#  loading the dataset into R. 
# If you have the dataset .txt in your directory you can use this way: "./household_power_consumption.txt". Otherwise, please use ./data/household_power_consumption.txt
# Read.table is a function that read a file in table forma and creates a data frame from it.
# "./data/household_power_consumption.txt" is a file
# header to indicated whether the file contains the names of the variables as its first line
# sep=";" that means that values on each line are separated by ";". In other cases, I could be \t
# stringsAsFactors=FALSE means that characters vectors should be converted to factors. In this cases this factors are not necessary.
# the character used in the file for decimal points.
hpctxt <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# $ is an operator to subset 
# %in% is an operator to match 
# "c("1/2/2007","2/2/2007") ," means the vector that you want to match
subSethpctxt <- hpctxt[hpctxt$Date %in% c("1/2/2007","2/2/2007") ,]


 #str(subSethpctxt) strptime is a functions to convert between character representations and objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times.
# that step is necessary We will only be using data from the dates 2007-02-01 and 2007-02-02. Consequently, we are gonna converte from 2/2/2007 to 2007-02-02.
# d  day of the month as decimal number (01–31).
# m  Month as decimal number (01–12).
# Y  Year with century
# H Hours as decimal number (00–23)
# M Minute as decimal number (00–59).
# S Second as decimal number (00–61)
datetime <- strptime(paste(subSethpctxt$Date, subSethpctxt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# that step is necessary to create the subset  numbers that you want in your graphic. 
# subSethpctxt$Global_active_power are string of a character and you need as numeric. Create many subsets from a subSethpctxt
globalActivePower <- as.numeric(subSethpctxt$Global_active_power)
globalReactivePower <- as.numeric(subSethpctxt$Global_reactive_power)
voltage <- as.numeric(subSethpctxt$Voltage)
subMetering1 <- as.numeric(subSethpctxt$Sub_metering_1)
subMetering2 <- as.numeric(subSethpctxt$Sub_metering_2)
subMetering3 <- as.numeric(subSethpctxt$Sub_metering_3)

# png is a format bitmap files. That is the format that is gonna save the graphic. It is necessary to write before creating an any graphic
# it is gonna save in PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width=480, height=480)

# Graphics that you want c(2,2) means two columns and two rows
par(mfrow = c(2, 2)) 

# plot using datetime, globalActivePower is of data that you put in your graphic.
# col is colour
# type is a type of plot should be drawn. There are many possibilities. In this case, "l" means for lines 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

#legend is a function to put a legend in any place that you want to put in the graphic
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
