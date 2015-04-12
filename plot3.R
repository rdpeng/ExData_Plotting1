if(!file.exists("Assignment1_preproc.R"))
{
	stop("The data input and processing code, Assignment1_preproc.R is missing.  Make sure it's in working directory")
}

source('Assignment1_preproc.R')

#
# let the plotting begin
#
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


	# Output file
	dev.copy(png, file="plot3.png", width=480, height=480)
	dev.off
	cat("Yo, plot3.png is done too, yo all can find it in", getwd())

	q()