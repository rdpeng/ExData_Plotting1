setwd("~/Desktop/coursera ")
rm(list=ls())

summary("household_power_consumption.txt")
hpc <- read.csv("household_power_consumption.txt", 
                sep=";",
                dec=".", 
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
summary(hpc)
                subSet_hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]
summary(subSet_hpc)


png("plot1.png", width=480, height=480)
plot <- as.numeric(subSet_hpc$Global_active_power)
hist(plot, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
hist(plot, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

