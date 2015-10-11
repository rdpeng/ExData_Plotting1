file<-"C:/Users/HP/Documents/GitHub/Huong/household_power_consumption.txt"
data<-read.table(file,sep = ";",na.strings = "?",skip = 66637,nrows = 2880)
df<-data.frame(data)
colnames(df)<-c("Date","Time","Global_active_power","Global_reactive_power",
                                 "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2",
                                 "Sub_metering_3")
df$timeline <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))
  
png("C:/Users/HP/Documents/GitHub/Huong/plot2.png",bg="transparent",width=480,height=480)
with(df,plot(timeline,Global_active_power, type="l",
                              ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
  
  
  
