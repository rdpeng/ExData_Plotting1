source("LoadData.R")

plot2 <- function() {
        data <- load_data() # Load Data using load_data function.
        
        png("plot2.png", width=500, height=500) #Initialize png function
        
        plot(data$Time, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)") #Plotting line graph as per instructions with required labels
        
        dev.off()# closing the graphics file
        
}