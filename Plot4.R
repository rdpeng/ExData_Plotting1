## Create a directory to store the plots
if(!file.exists("./plots")){dir.create("./plots")}

## Load the data for the plots (only for the 1 and 2 of Feb 2007)
DataLocal <- grep("^[12]/2/2007", readLines("./data/household_power_consumption.txt"))-1
CNames    <- read.table("./data/household_power_consumption.txt",
                        header = F, nrows = 1, sep = ";", stringsAsFactors = F)

ElectricData <- read.table("./data/household_power_consumption.txt",
                           skip=DataLocal[1], nrows=length(DataLocal), sep = ";",
                           col.names = CNames, stringsAsFactors = F)

## Add a column with the full date and time as POSIXlt variable
ElectricData$FullDATE <- strptime(paste(ElectricData$Date,ElectricData$Time),"%d/%m/%Y %H:%M:%S")

## Plot 4
par(mfrow = c(2,2), mar = c(4,4,1,1))
plot(ElectricData$FullDATE, ElectricData$Global_active_powe,
     type="l", xlab="", ylab="Global Active Power")
with(ElectricData, plot(FullDATE, Voltage,
                        type="l", xlab="datetime", ylab="Voltage"))
with(ElectricData, plot(FullDATE, Sub_metering_1,
                        type="l", xlab="", ylab="Energy sub metering"))
with(ElectricData, points(FullDATE, Sub_metering_2,
                          type="l", xlab="", ylab="Energy sub metering", col = "red"))
with(ElectricData, points(FullDATE, Sub_metering_3,
                          type="l", xlab="", ylab="Energy sub metering", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=1,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_1"),cex = 0.55, bty = "n")
with(ElectricData, plot(FullDATE, Global_reactive_power,
                        type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.copy(png, file = "./plots/plot4.png")  ## Copy my plot to a PNG file
dev.off() 
