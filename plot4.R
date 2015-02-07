## Add Library

    library(lubridate)

## Read and reformat data
    
    P1Data<-read.table("C:/Alison/R/R Working Directory/Project/ProjectFiles/household_power_consumption.txt", sep=";",header=TRUE)            
    P1Data$Date <- dmy(P1Data$Date)
    P1Data$Global_active_power[P1Data$Global_active_power == "?"] <- NA
    FebData <- subset(P1Data, Date > as.POSIXct("2007-01-31") )  
    FebData2 <- subset(FebData, Date <= as.POSIXct("2007-02-02") ) 
    FebData2$datetime <- paste(FebData2$Date, FebData2$Time)
## Set Plot Date
PlotDate = as.POSIXlt(FebData2$datetime) 
## Reformat and compute Global Active Power
    FebData2$Global_active_power <- as.numeric(as.character(FebData2$Global_active_power))
    GAP = FebData2$Global_active_power
## end of Global Power Code
    
## Reformat and compute Voltage
    FebData2$Voltage <- as.numeric(as.character(FebData2$Voltage))
    Volt = FebData2$Voltage
## End of VOltage Code
    
## Reformat and compute Sub-metering
    FebData2$Sub_metering_1 <- as.numeric(as.character(FebData2$Sub_metering_1))
    FebData2$Sub_metering_2 <- as.numeric(as.character(FebData2$Sub_metering_2))
    FebData2$Sub_metering_3 <- as.numeric(as.character(FebData2$Sub_metering_3))
    Sub_metering_1  = FebData2$Sub_metering_1
    Sub_metering_2  = FebData2$Sub_metering_2 
    Sub_metering_3  = FebData2$Sub_metering_3 
## End of Metering code
    
## Reformat and compute Reactive Power
    FebData2$Global_reactive_power <- as.numeric(as.character(FebData2$Global_reactive_power))
    Reactive = FebData2$Global_reactive_power
## End of Reactive Power Code
    
## Start plotting
    par (mfrow = c(2,2))                     ## set up for two columns and two rows
    par(mar = c(6, 6, 5, 4))                 ## set margins
    
## Plot Global Power
    plot(PlotDate, GAP, type="l",ann=FALSE)
    title(ylab="Global Active Power")
    
## Plot Voltage
    plot(PlotDate, Volt, type="l",ann=FALSE)
    title(ylab="Voltage")
    title(xlab="datetime")
    
## plot Energy Metering
    plot(PlotDate,Sub_metering_1, type="l",col="black",ann=FALSE)
    lines(PlotDate,Sub_metering_2, type="l",col="red")
    lines(PlotDate,Sub_metering_3, type="l",col="blue")
    title(ylab="Energy sub metering")
    legend ("topright",lwd=0.5,col=c("black","red", "blue"), 
            cex=0.5, pt.cex=0.9,bty="n",
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## plot reactive energy 
    plot(PlotDate, Reactive, type="l",ann=FALSE)
    title(ylab="Global_Reactive_power")
    title(xlab="datetime")
##  Copy to png file and close device
dev.copy(png,filename="plot4.png",width = 480, height = 480, units = "px", bg = "white");
dev.off ();

