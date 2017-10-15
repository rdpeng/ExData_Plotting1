plot3 <- function() {
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
    head(new_table)
    plot(new_table$timestamp,new_table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(new_table$timestamp,new_table$Sub_metering_2,col="red")
    lines(new_table$timestamp,new_table$Sub_metering_3,col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
    dev.copy(png, file="plot3.png", width=480, height=480)
    dev.off()
    cat("plot3.png has been saved in", getwd())



}