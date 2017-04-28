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
png("plot1.png", width=480, height=480)

# Plot to PNG file
with(hpc, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)") )

# Close dev connection
dev.off()

