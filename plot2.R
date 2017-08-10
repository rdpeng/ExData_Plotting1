getwd()
##READ THE DATA
EPCData<-read.table("G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/household_power_consumption.txt",sep=";",header=TRUE,
                    na.strings=c("?"))
#CONVERT THE DATE FORMAT & SUBSET
EPCData$Date<-as.Date(EPCData$Date,format='%d/%m/%Y')
EPCData <- subset(EPCData, subset = (EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02")) 
EPCData$datetime <- strptime(paste(EPCData$Date, EPCData$Time), "%Y-%m-%d %H:%M:%S") 
EPCData$datetime <- as.POSIXct(EPCData$datetime) 

#PLOT
dev.off()
with(EPCData,plot(datetime,Global_active_power, type = "l",  
     ylab = "Global Active Power (kilowatts)", xlab = ""))
mtext("Plot 2", side=3, adj=0, line=1, cex=1, font=1) 

#SAVE
dev.copy(png, file = "G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/plot2.png", height = 480, width = 480) 
dev.off()

