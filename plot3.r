source ("ass1.r")
#ass1 contains readFebData function which downloads and reads the data

plot3 <- function(){

	feb_data <-readFebData() #data for graph is now in feb_data
	
	#launch graphic device PNG file
	png(file = "plot3.png", width = 480, height = 480, bg="white")
	plot3_1(feb_data)
	dev.off()

}

plot3_1 <- function (feb_data){
	plot(feb_data$DateTime,feb_data$Sub_metering_1, type ="l",
			ylab = "Energy sub metering", xlab ="")
	lines(feb_data$DateTime,feb_data$Sub_metering_2, col ="red")
	lines(feb_data$DateTime,feb_data$Sub_metering_3, col ="blue")
	legend("topright", pch = "___", col = c("black","red", "blue"), 
	 legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
					
}
