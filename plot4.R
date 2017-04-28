# Download datasets
geturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(geturl,"dataset.zip")

if(!file.exists("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt")){
        unzip("dataset.zip")
}

# Check file size
file.info("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt")$size

# Define date range in file-provided character format
minDate <- "1/2/2007"
maxDate <- "2/2/2007"

# Get logical array of rows within date range
classes <- c("character", rep("NULL", 8))

getDates <- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
                       ,header=TRUE
                       ,stringsAsFactors = FALSE
                       ,na.strings = "?"
                       ,sep = ";"
                       ,colClasses = classes
                       #                       ,nrows = 100
)

getDates <- ( getDates$Date == minDate ) | ( getDates$Date == maxDate )

# Get data within date range
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" )

hpc <- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
                  ,header=TRUE
                  ,stringsAsFactors = FALSE
                  ,na.strings = "?"
                  ,sep = ";"
                  ,colClasses = classes
                  #                  ,nrows = 100
)[getDates, ]

# Add DateTime variable
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# initialize graphical device = PNG
png("plot4.png", width=480, height=480)

# paramaterize plot
par(mfrow = (c(2,2)))

# Plot to PNG file
with(hpc, {
        plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
        plot(DateTime, Voltage, type="l", xlab = "datetime")
        {plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering") 
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", legend = c(names(hpc)[7:9]), lty=c(1,1,1), col=c("black", "red", "blue"))
        }
        plot(DateTime, Global_reactive_power, type="l", xlab = "datetime")
} )


# Close dev connection
dev.off()

