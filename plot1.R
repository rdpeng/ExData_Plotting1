plot1<-function(){
    alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
    datesub<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
    datesub$Date<-as.Date(datesub$Date,format = "%d/%m/%Y")
    hist(datesub$Global_active_power,col = "Red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",breaks = 20)
    dev.copy(png,file = "plot1.png",width = 480,height = 480, units = "px")
}