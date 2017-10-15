plot4 <- function() {
    url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url,destfile = "data.zip")
    data<-unzip("data.zip")
    table<-read.table(data,header = TRUE,stringsAsFactors = T,sep=";")
    table$Date<-as.Date(table$Date,format="%d/%m/%Y")
    new_table<-table[table$Date=="2007-02-01"|table$Date=="2007-02-02",]
    library(lubridate)
    new_table<-transform(new_table,timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
    new_table$Global_active_power<-as.numeric(new_table$Global_active_power)
    new_table$Global_reactive_power<-as.numeric(new_table$Global_reactive_power)
    new_table$Voltage<-as.numeric(new_table$Voltage)
    new_table$Global_intensity<-as.numeric(new_table$Global_intensity)
    new_table$Sub_metering_1<-as.numeric(new_table$Sub_metering_1)
    new_table$Sub_metering_2<-as.numeric(new_table$Sub_metering_2)
    par(mfrow=c(2,2))
    
    ##PLOT 1
    plot(new_table$timestamp,new_table$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    ##PLOT 2
    plot(new_table$timestamp,new_table$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ##PLOT 3
    plot(new_table$timestamp,new_table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(new_table$timestamp,new_table$Sub_metering_2,col="red")
    lines(new_table$timestamp,new_table$Sub_metering_3,col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
    
    #PLOT 4
    plot(new_table$timestamp,new_table$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    #OUTPUT
    dev.copy(png, file="plot4.png", width=480, height=480)
    dev.off()
    cat("plot4.png has been saved in", getwd())
}