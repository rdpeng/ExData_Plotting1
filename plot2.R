#load data and narrow it down to 2 days in question
dataFile <- "~/JHU Data Science/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#create variable to allow for sorting by time
subSetData$timestamp = 
  strptime (paste(subSetData$Date, subSetData$Time), 
            format="%d/%m/%Y %H:%M:%S", tz="UTC")

#construct png
png("plot2.png",
    width = 480, height = 480)

#plot data
plot(subSetData$timestamp,subSetData$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
