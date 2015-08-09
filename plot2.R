#Objective: Read data from Create Plot for UC Irvine Machine Learning Repository,  “Individual household electric power consumption Data Set”. And create Daily plot for Global Active Power.

#Download the file and put the file in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")

#Unzip the file
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Select only 2-day period in February, 2007
small_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Format variable datetime or numeric for plotting
datetime <- strptime(paste(small_data$Date, small_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(small_data$Global_active_power)

#Plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
