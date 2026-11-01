# Downloading and unzipping the dataset
if(!file.exists("./project1"))
{dir.create("./project1")}
datalink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datalink,destfile="./project1/power_consumption.zip")
unzip(zipfile="./project1/power_consumption.zip",exdir="./project1")

#Reading complete table
data_table <- read.table("./project1/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Filtering data from the dates 2007-02-01 and 2007-02-02
data_table$Date <- as.Date(data_table$Date, format = "%d/%m/%Y")
date_subset <- subset(data_table, data_table$Date >= as.Date("2007-2-1") & data_table$Date <= as.Date("2007-2-2"))

# Merging date and Time column and adding it to the data subset
dateTime <- paste(date_subset$Date, date_subset$Time)
date_subset <- cbind(dateTime, date_subset)
## Format dateTime Column
date_subset$dateTime <- as.POSIXct(dateTime)
View(date_subset)


# Generating the first Plot
hist(date_subset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()