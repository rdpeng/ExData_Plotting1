#source("loaddata.R")


hist(data3[,3], main = "Global Active Power", col="red", 
     ylab = "Frequency", 
     xlab="Global Active Power (kilowats)")


dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()
