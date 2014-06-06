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


##################################
#Save Figure 4 in a file plot4.png
#
png(filename = "plot4.png",  width = 480, height = 480, units = "px")

par(cex = 0.75, lwd=0.5) #set parameters for "text" by which plotting text and symbols should be magnified relative to the default, and line wiedth

split.screen(c(2,2), erase = TRUE) #split display into four screens, i.e. 2 by 2

#Figure 4.1
screen(1)
plot(x, twodhoConsump$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

#Figure 4.2
screen(2)
plot(x, twodhoConsump$Voltage, type = "l", col="black", xlab = "datetime", ylab = "Voltage")


#Figure 4.3
screen(3)
plot(x, twodhoConsump$Sub_metering_1, type = "l", col="black", xlab = " ", ylab = "Energy sub metering")
lines(x, twodhoConsump$Sub_metering_2,col="red")
lines(x, twodhoConsump$Sub_metering_3,col="blue")
legeLabels <- c(names(twodhoConsump)[7], names(twodhoConsump)[8],names(twodhoConsump)[9] )
legend("topright", legeLabels,lty=1 , col=c("black", "red", "blue"), bty="n")



#Figure 4.4
screen(4)
plot(x, twodhoConsump$Global_reactive_power, type = "l", col="black", xlab = "datetime", ylab = names(twodhoConsump[4]))

close.screen(all = TRUE) # exit split-screen mode

dev.off()

###################################
        
