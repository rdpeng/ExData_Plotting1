source ("ass1.r")
#ass1 contains readFebData function which downloads and reads the data

plot2 <- function(){

	feb_data <-readFebData() #data for graph is now in feb_data
	
	#launch graphic device PNG file
	png(file = "plot2.png", width = 480, height = 480, bg="white")
	plot2_1(feb_data)
	dev.off()

}

plot2_1 <- function (feb_data){
	with (feb_data,  plot(feb_data$DateTime,feb_data$Global_active_power, 
					type ="l", ylab = "Global Active Power (kilowatts)", xlab =""))
}