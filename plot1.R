##setwd("C:/Users/ocsuser/Desktop/Coursera work/EDA/")
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?") ## read data file
head(dt)
str(dt)
dt2 <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]  ## new data frame of subset during 2007-02-01~02
dt2$datetime <- strptime(paste(dt2[,1],dt2[,2]), "%d/%m/%Y %H:%M:%S") ## make a vector of date and time class changed from dt2$Date_Time 
head(dt2)
str(dt2)

png(file="plot1.png", width=480, height=480, units="px")
with(dt2, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()