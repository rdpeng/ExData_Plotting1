plot3<-function ()
{
	plot(df$timestamp,df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

	lines(df$timestamp,df$Sub_metering_1, col="black")
	lines(df$timestamp,df$Sub_metering_2, col="red")
	lines(df$timestamp,df$Sub_metering_3, col="blue")

	# Legend
	legend("topright",
		col=c("black","red","blue"),
		c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		lty=c(1,1),
		lwd=c(1,1))
}	