# Loading data - assumes that the data file is within the current working directory
# Subsets to only take the data during the interested time frame
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# Changes the formatting of the date and time 
data$fullDateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Day <- format(data$fullDateTime, "%A")

# Graphs histogram
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
