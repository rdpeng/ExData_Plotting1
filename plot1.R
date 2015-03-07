##set working directory
setwd("~/Desktop/coursera ")
rm(list=ls())  ##remove files for clarity

summary("household_power_consumption.txt")
hpc <- read.csv("household_power_consumption.txt", 
                sep=";",
                dec=".", 
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric"))  ## read data, setting column classes
summary(hpc)
                
                subSet_hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),] ##subset dates
summary(subSet_hpc)


png("plot1.png", width=480, height=480)
plot <- as.numeric(subSet_hpc$Global_active_power)
hist(plot, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off() ##turning device off saves plot
hist(plot, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## show plot in device, *Rememberr to turn device off again


