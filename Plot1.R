myDataFile <- "./data/household_power_consumption.txt"
#Read the Data table
myData <- read.table(myDataFile,header = TRUE,sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
#Subset the data based on the date 
mySubsetData <- subset (myData, Date %in% c("1/2/2007", "2/2/2007"))
mySubsetData$Date <- as.Date(mySubsetData$Date, format="%d/%m/%Y")
#Plotting using histogram 
hist(mySubsetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
#copy the plot to png format
dev.copy(png, file="plot1.png", height=480, width=600)
dev.off()
