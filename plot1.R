##################
##   Project 1  ##
##################


##  Loading Data from 2/1/2007 to 2/2/2007
filePower <- "C:/Users/Johnny/Desktop/course/1-R Programming/R/data/household_power_consumption.txt"
data <- read.table(filePower, header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  Plot1

GlobalActivePower <- as.numeric(data1$Global_active_power)

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

hist(GlobalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
