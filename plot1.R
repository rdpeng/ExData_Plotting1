source("LoadData.R")

plot1 <- function() {
        data <- load_data() # Load Data using load_data function.
        
        png("plot1.png", width=490, height=490) #Initialize png function
        
        hist(data$Global_active_power, # Create histogram with required dimensions and formatting
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
        dev.off() # closing the graphics file
}