#load data and narrow it down to 2 days in question
dataFile <- "~/JHU Data Science/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#collect all global_active_power numbers
globalActivePower <- as.numeric(subSetData$Global_active_power)
#construct png
png("plot1.png", 
    width=480, height=480)
#draw histogram
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()

