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

## Plot 1
par(mfrow = c(1,1), mar = c(3,4,4,4))
quartz()
hist(ElectricData$Global_active_power, 
     xlab="Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "./plots/plot1.png")  ## Copy my plot to a PNG file
dev.off() 
