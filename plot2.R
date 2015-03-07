setwd("~/Desktop/coursera") ## set working directory
rm(list=ls()) ##remove files fr clarity
summary("household_power_consumption.txt")

hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                dec=".",
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric")) ## sets column classes
summary(hpc)

subSet_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] ## subsets dates used in plots
summary(subSet_hpc)

datetime <- strptime(paste(subSet_hpc$Date, subSet_hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##converts character to object class

globalActivePower<- as.numeric(subSet_hpc$Global_active_power) 

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()##saves plot to R
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## places plot in device after saving, remeber to turn device off after done viewing
