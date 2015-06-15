source ("ass1.r")
#ass1 contains readFebData function which downloads and reads the data
source("plot2.r")
source("plot3.r")

plot4 <- function(){

	feb_data <-readFebData() #data for graph is now in feb_data
	
	#launch graphic device PNG file
	png(file = "plot4.png", width = 480, height = 480, bg="white")
	par(mfrow = c(2,2))#two rows and two columns
	with(feb_data, {
			plot2_1(feb_data)
			plot(feb_data$DateTime,feb_data$Voltage, 
					type ="l", ylab = "Voltage", xlab ="datetime")		
			plot3_1(feb_data)
			plot(feb_data$DateTime,feb_data$Global_reactive_power, 
					type ="l", ylab = "Global_reactive_power", xlab ="datetime")
			})
			
	dev.off()
}