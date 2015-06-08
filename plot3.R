title = ""
x_axis = ""
y_axis = "Energy sub metering"

with(data, 
     plot(1:length(Date), data$Sub_metering_1, type="l", 
          xlab=x_axis,ylab=y_axis,xaxt="n",col="black")
    )

with(data, 
     lines(1:length(Date), data$Sub_metering_2, type="l", 
          xlab=x_label,ylab=y_label,xaxt="n",col="red")
    )

with(data, 
     lines(1:length(Date), data$Sub_metering_3, type="l", 
          xlab=x_label,ylab=y_label,xaxt="n",col="blue")
    )

          
axis(1,at=c(0,length(data$Date)/2,length(data$Date)),labels=c("Thu","Fri","Sat"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png,file = "plot3.png")
dev.off()