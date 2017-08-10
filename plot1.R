getwd()
##READ THE DATA
EPCData<-read.table("G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/household_power_consumption.txt",sep=";",header=TRUE,
na.strings=c("?"))
#CONVERT THE DATE FORMAT & SUBSET
EPCData$Date<-as.Date(EPCData$Date,format='%d/%m/%Y')
EPCData <- subset(EPCData, subset = (EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02")) 

#Plot
dev.off()
hist(EPCData$Global_active_power, main = "Global Active Power",  
     xlab = "Global Active Power (kilowatts)", col = "red") 
mtext("Plot 1", side=3, adj=0, line=1, cex=1, font=1) 
#SAVE
dev.copy(png, file = "G:/LORI/2016 Role/Analytics & Data Division/Miscellaneous/plot1.png", height = 480, width = 480) 
dev.off() 













