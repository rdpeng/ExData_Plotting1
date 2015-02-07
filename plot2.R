## Construct a plot and save to plot1.png
## Read files into directory
P1Data<-read.table("C:/Alison/R/R Working Directory/Project/ProjectFiles/household_power_consumption.txt", sep=";",header=TRUE)            
P1Data$Date <- dmy(P1Data$Date)
P1Data$Global_active_power[P1Data$Global_active_power == "?"] <- NA
FebData <- subset(P1Data, Date > as.POSIXct("2007-01-31") )  
FebData2 <- subset(FebData, Date <= as.POSIXct("2007-02-02") ) 
FebData2$datetime <- paste(FebData2$Date, FebData2$Time)
PlotDate = as.POSIXlt(FebData2$datetime) 
FebData2$Global_active_power <- as.numeric(as.character(FebData2$Global_active_power))
GAP = FebData2$Global_active_power
## Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6, 6, 5, 4))
plot(PlotDate, GAP, type="l",ann=FALSE)
title(ylab="Global Active Power(kilowatts)")
dev.off()
