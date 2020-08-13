dataurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"electric_consumption.zip"

##download data
if (!file.exists(zipfile))
download.file(dataurl, zipfile, mode = "wb")

##unzip data
datapath<-"household_power_consumption.txt"
if (!file.exists(datapath)) 
    unzip(zipfile)
## read data into R
unsortedData<-read.table(datapath, sep = ";", header = TRUE)

##subset data needed for this task
tidyData<-subset(unsortedData, Date == "1/2/2007" | Date == "2/2/2007")
rm(unsortedData)

##Making a histogramm of global active power
tidyData$Global_active_power<-as.numeric(tidyData$Global_active_power)
hist(tidyData$Global_active_power, main = "Global Active Power", 
    xlab = "Global Active Power (killowatts)", col = "red" )

##copy plot to a png file 
dev.copy(png, file = "plot1.png")
dev.off()