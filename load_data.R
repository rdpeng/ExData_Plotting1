# Read the file with the read.table function (including header, sep and NA options)
hpc <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  colClasses = c("character", "character", rep("numeric",7)),
                  na = "?")
#Include hpc in the search path with the attach function
attach(hpc)
#Selecting the right date period (from 1/2/2007 to 2/2/2007)
hpc.s <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]
# concatenate Date and Time in the right POSIX format
attach(hpc.s)
DT <- paste(Date, Time)
hpc.s$DateTime <- strptime(DT, "%d/%m/%Y %H:%M:%S")
rownames(hpc.s) <- 1:nrow(hpc.s)
attach(hpc.s)
