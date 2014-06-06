#######################
#Systems settings

#Set appropriate locale for US English and global parameter for color
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
par(col="gray27")

#######################
#Data manipulations

#Read data form "household_power_consumption.txt" file
#Note that the "household_power_consumption.txt" file should be in your current working directory or use setwd comand to change you working directory
#setwd("YourWorkingDIrectoryHere")

hoConsump <- read.csv ("household_power_consumption.txt", header =T,sep=";", na.strings ="?")

#Filter data - select a two day household consumption in February; i.e. for "1/2/2007" and "2/2/2007"
twodhoConsump <- hoConsump[hoConsump$Date == "1/2/2007" | hoConsump$Date == "2/2/2007",]



#Convert Date and Time to character 
twodhoConsump$Date <- as.character(twodhoConsump$Date)
twodhoConsump$Time <- as.character(twodhoConsump$Time)
x <- paste(twodhoConsump$Date, twodhoConsump$Time)

# .. and then  convert  character representations into class representing calendar dates and times.
x <- strptime(x,"%d/%m/%Y %H:%M:%S") # x-axis in datetime format


####################################
#Save histogram in a file plot1.png
#

png(filename = "plot1.png",  width = 480, height = 480, units = "px")
hist(twodhoConsump$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
###################################

