source ("ass1.r")
#ass1 contains readFebData function which downloads and reads the data

plot1 <- function(){

	feb_data <-readFebData() #data for graph is now in feb_data
	
	#launch graphic device PNG file
	png(file = "plot1.png", width = 480, height = 480, bg="white")
	plot1_1(feb_data)
	dev.off()

}

plot1_1 <- function(feb_data){

	with (feb_data, hist(feb_data$Global_active_power, col="red", 
			xlab = "Global Active Power (kilowatts)", main ="Global Active Power"))
}
