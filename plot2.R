plot2<-function(fil="household_power_consumption.txt"){
        
        data<-read.table(fil,sep=";",na.strings="?",header=TRUE)
        #
        # combine day and time
        #
        x<-paste(data$Date, data$Time)
        data$x<-strptime(x,"%d/%m/%Y %H:%M:%S")
        data$Date<-as.Date(data$Date,"%d/%m/%Y")
        #
        #use only those data required for problem
        #
        prb<-c("01/02/2007","02/02/2007")
        prb<-as.Date(prb,"%d/%m/%Y")
        prb<-as.numeric(as.POSIXct(prb))
        data$Date<-as.numeric(as.POSIXct(data$Date))
        data<-subset(data,data$Date>=prb[1])
        data<-subset(data,data$Date<=prb[2])
        y<-data$Global_active_power
        #
        #plot data
        #
        png(file = "Plot2.png", bg = "transparent",width=480,height=480)
        plot(data$x, y, type="l",xlab="", ylab="Gobal Active Power (kilowats",main="Global Active Energy")
        dev.off()
}