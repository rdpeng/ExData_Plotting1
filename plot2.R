file1 <- read.table("C:/Users/shivam giri/Downloads/household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors=FALSE,na.strings = "?")
sub1<-subset(file1,file1$Date=="1/2/2007"|file1$Date=="2/2/2007")
datetime <- strptime(paste(sub1$Date, sub1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot2<-function(){
  plot(datetime, sub1$Global_active_power, type="l", xlab=" ",ylab = "Global Active Power(kilowatts)")
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}
plot2()
